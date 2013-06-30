//
//  NSString+URLEncode.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/01/07.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

// the reverse of url encoding
+ (NSString*)stringByURLDecodingString:(NSString*)escapedString {
    return [[escapedString stringByReplacingOccurrencesOfString:@"+" withString:@" "]
            stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString*)stringByURLEncodingString:(NSString*)unescapedString {
    NSString* result = CFBridgingRelease(
        CFURLCreateStringByAddingPercentEscapes(
            kCFAllocatorDefault,
            (CFStringRef)unescapedString,
            NULL, // characters to leave unescaped
            (CFStringRef)@":!*();@/&?#[]+$,='%’\"",
            kCFStringEncodingUTF8));
    return result;
}

@end
