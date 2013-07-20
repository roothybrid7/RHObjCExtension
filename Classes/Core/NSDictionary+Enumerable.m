//
//  NSDictionary+Enumerable.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/10.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSDictionary+Enumerable.h"

@implementation NSDictionary (Enumerable)

- (NSDictionary *)mapUsingBlock:(id (^)(id, id))block
{
    NSMutableDictionary *newDictionary = [@{} mutableCopy];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [newDictionary addEntriesFromDictionary:block(key, obj)];
    }];
    return newDictionary;
}

@end
