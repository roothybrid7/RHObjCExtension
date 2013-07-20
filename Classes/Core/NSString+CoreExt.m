//
//  NSString+CoreExt.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/10.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSString+CoreExt.h"
#import "NSArray+Enumerable.h"

@implementation NSString (CoreExt)

+ (NSString *)camelize:(NSString *)source
{
    NSArray *keyChunks = [source componentsSeparatedByString:@"_"];
    keyChunks = [keyChunks mapUsingBlock:^(id item, NSUInteger idx) {
        if (idx == 0) {
            return item;
        }
        return (id)[item capitalizedString];
    }];
    return [keyChunks componentsJoinedByString:@""];
}

- (NSString *)camelize
{
    return [[self class] camelize:self];
}


@end
