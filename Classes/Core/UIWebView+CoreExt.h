//
//  UIWebView+CoreExt.h
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/10.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (CoreExt)

/*!
    @discussion JSの実行は、MainThreadじゃないとアプリが落ちるっぽい.
 */
- (NSString *)userAgent;

/*!
    @method callbackToWebView:userInfo:
    @abstract コールバックJSを実行する
    @discussion iOSから直接呼び出す場合は、MainThreadで呼び出すこと(WebViewからであればMainThread).
    @param name コールバックJS関数名
    @param userInfo 関数に渡すデータ(JSON)
 */
- (void)callbackToWebView:(NSString *)name userInfo:(NSDictionary *)userInfo;

/*!
    @method triggerUpdateToWebView:userInfo:
    @abstract 指定したjQueryイベントを実行する
    @discussion iOSから直接呼び出す場合は、MainThreadで呼び出すこと(WebViewからであればMainThread).
    @param event 発火させるイベント名
    @param userInfo イベントオブジェクトに渡すデータ
 */
- (void)triggerUpdateToWebView:(NSString *)event userInfo:(NSDictionary *)userInfo;

@end
