//
//  NSArray+CoreExt.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/11.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSArray+CoreExt.h"

@implementation NSArray (CoreExt)

- (NSMutableArray *)mutableDeepCopy
{
    NSMutableArray *mutableArray = (NSMutableArray *)CFBridgingRelease(CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFArrayRef)self, kCFPropertyListMutableContainers));

    return mutableArray;
}

- (id)findBy:(id)obj
{
    NSUInteger idx = [self indexOfObject:obj];
    if (idx == NSNotFound) {
        return nil;
    }
    return self[idx];
}

@end
