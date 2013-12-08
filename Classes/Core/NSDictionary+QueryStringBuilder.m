//
//  NSDictionary+QueryStringBuilder.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/10.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSDictionary+QueryStringBuilder.h"
#import "NSString+URLEncode.h"

@implementation NSDictionary (QueryStringBuilder)

- (NSString *)queryString
{
    NSMutableString *queryString = nil;
    NSArray *keys = [self allKeys];
    if ([keys count] > 0) {
        for (id key in keys) {
            id value = [self objectForKey:key];
            if (nil == queryString) {
                queryString = [[NSMutableString alloc] init];
                [queryString appendFormat:@"?"];
            } else {
                [queryString appendFormat:@"&"];
            }

            if (nil != key && nil != value) {
                [queryString appendFormat:@"%@=%@", [NSString stringByURLEncodingString:key], [NSString stringByURLEncodingString:value]];
            } else if (nil != key) {
                [queryString appendFormat:@"%@", [NSString stringByURLEncodingString:key]];
            }
        }
    }

    return queryString;
}

+ (NSDictionary *)dictionaryFromQueryString:(NSString *)query
{
    NSMutableDictionary *queryDictionary = [[[self alloc] init] mutableCopy];
    CFStringRef clean = CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)query, CFSTR(""));
    NSString *cleanQuery = (NSString *)CFBridgingRelease(clean);
    [[cleanQuery componentsSeparatedByString:@"&"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSArray *chunks = [obj componentsSeparatedByString:@"="];
        [queryDictionary setObject:chunks.lastObject forKey:chunks.firstObject];
    }];
    return queryDictionary;
}

@end
