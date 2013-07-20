//
//  NSString+URLEncode.h
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/01/07.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncode)

+ (NSString*)stringByURLDecodingString:(NSString*)escapedString;
+ (NSString*)stringByURLEncodingString:(NSString*)unescapedString;

@end
