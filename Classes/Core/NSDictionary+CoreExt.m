//
//  NSDictionary+CoreExt.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/11.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSDictionary+CoreExt.h"

@implementation NSDictionary (CoreExt)

- (NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *mutableDictionary = (NSMutableDictionary *)CFBridgingRelease(CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFDictionaryRef)self, kCFPropertyListMutableContainers));

    return mutableDictionary;
}

@end
