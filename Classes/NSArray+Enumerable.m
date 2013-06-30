//
//  NSArray+CoreExt.m
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2013/05/08.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSArray+Enumerable.h"

@implementation NSArray (Enumerable)

- (NSArray *)mapUsingBlock:(id (^)(id, NSUInteger))block
{
    NSMutableArray *newArray = [@[] mutableCopy];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [newArray addObject:block(obj, idx)];
    }];
    return newArray;
}

- (NSArray *)rejectUsingBlock:(BOOL (^)(id, NSUInteger))block
{
    NSIndexSet *indexSet = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return !block(obj, idx);
    }];
    return [self objectsAtIndexes:indexSet];
}

- (id)findUsingBlock:(BOOL (^)(id, NSUInteger))block
{
    __block id matchObj = nil;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BOOL result = block(obj, idx);
        if (result) {
            matchObj = obj;
            *stop = YES;
            return;
        }
    }];
    return matchObj;
}

@end
