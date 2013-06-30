//
//  NSString+HashUtil.h
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2012/12/04.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HashUtil)

/*!
    ランダムな文字列を生成する
 */
+ (NSString *)generateUUID;

/*!
 文字列からsha256でハッシュ値を求める
 */
+ (NSString*)sha256ForStr:(NSString *)str;

/*!
 タイムスタンプ文字列を生成する
 */
+ (NSString*)createTimestamp;

/*!
 Hash値を生成する
 */
+ (NSString *)generateHashedString:(NSArray *)params;

/*!
 文字列からsha256でハッシュ値を求める(インスタンスメソッド)
 */
- (NSString *)sha256ForStr;

@end
