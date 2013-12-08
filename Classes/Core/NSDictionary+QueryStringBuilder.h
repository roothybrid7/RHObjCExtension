//
//  NSDictionary+QueryStringBuilder.h
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/10.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (QueryStringBuilder)

- (NSString *)queryString;
+ (NSDictionary *)dictionaryFromQueryString:(NSString *)query;

@end
