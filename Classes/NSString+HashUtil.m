//
//  NSString+HashUtil.m
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2012/12/04.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSString+HashUtil.h"

static NSString * const HMAC_SHA256_HASH_KEY = @"hash_key_dayo";

@implementation NSString (HashUtil)

+ (NSString *)generateUUID
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)uuid;
}

+ (NSString*)sha256ForStr:(NSString *)str
{
    //文字列からsha256でハッシュ値を求める
    const char *c = [str UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(c, strlen(c), result);
    NSMutableString* strs = [NSMutableString string];
    for (int i=0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [strs appendFormat:@"%02x", result[i]];
    }

    return strs;
}

+ (NSString*)createTimestamp
{
    //タイムスタンプ文字列を生成する
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSNumber *timeStampObj = @(timeStamp);
    return [NSString stringWithFormat:@"%d",[timeStampObj intValue]];
}

+ (NSString *)generateHashedString:(NSArray *)params
{
    NSString *base_string = @"";
    for(NSString *param in params){
        base_string = [base_string stringByAppendingString:param];
        base_string = [base_string stringByAppendingString:@"|"];
    }
    base_string = [base_string stringByAppendingString:HMAC_SHA256_HASH_KEY];
    return [base_string sha256ForStr];
}

- (NSString *)sha256ForStr
{
    return [NSString sha256ForStr:self];
}

@end
