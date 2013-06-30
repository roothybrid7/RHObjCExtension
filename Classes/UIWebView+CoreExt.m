//
//  UIWebView+CoreExt.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/10.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "UIWebView+CoreExt.h"

@implementation UIWebView (CoreExt)

#pragma mark - Private methods.

- (NSString *)jsonString:(NSDictionary *)info
{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"jsonString parse error: %@", error);
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

#pragma mark - Public methods.

- (NSString *)userAgent
{
    __strong static NSString *_userAgent = nil;
    if (!_userAgent) {
        if (![NSThread isMainThread]) {
            UIWebView __weak *weakSelf = self;
            // MARK: 非同期でデータを取得するまで待つ
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            dispatch_async(dispatch_get_main_queue(), ^{
                _userAgent = [weakSelf stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
                // MARK: シグナル送って待機状態を解除
                dispatch_semaphore_signal(semaphore);
            });
            // MARK: 終わるまで待つ
            while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW)) {
                // MARK: 処理を待機するとデットロックする場合があるので、終わるまでランループに0.1秒間ずつ処理を切り替える
                [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1f]];
            }
        } else {
            _userAgent = [self stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        }
    }
    return _userAgent;
}

- (void)callbackToWebView:(NSString *)name userInfo:(NSDictionary *)userInfo
{
    if (![NSThread isMainThread] || !name || !userInfo) {
        return;
    }
    NSString *key = userInfo[@"filteredKey"];
    id info = key ? userInfo[key] : userInfo;

    NSString *jsonString = [self jsonString:info];
    if (!jsonString) {
        return;
    }
    NSString *js = [NSString stringWithFormat:@"%@(%@)", name, jsonString];
    [self stringByEvaluatingJavaScriptFromString:js];
}

- (void)triggerUpdateToWebView:(NSString *)event userInfo:(NSDictionary *)userInfo
{
    if (![NSThread isMainThread] || !event || !userInfo) {
        return;
    }
    NSMutableDictionary *eventObject = [@{
        @"type": event,
    } mutableCopy];
    [eventObject addEntriesFromDictionary:userInfo];
    NSString *jsonString = [self jsonString:eventObject];
    if (!jsonString) {
        return;
    }
    NSString *jQueryEventTrigger = [NSString stringWithFormat:@"$(document).trigger(%@)", jsonString];
    [self stringByEvaluatingJavaScriptFromString:jQueryEventTrigger];
}

@end
