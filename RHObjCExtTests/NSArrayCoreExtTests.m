//
//  NSArrayCoreExtTests.m
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/07/20.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSArrayCoreExtTests.h"

#import "NSArray+CoreExt.h"

@implementation NSArrayCoreExtTests

- (void)testMutableDeepCopyWithEmptyArray
{
    expect(@[].mutableDeepCopy).to.beKindOf([NSMutableArray class]);
    expect(@[].mutableDeepCopy).to.beEmpty();
}

- (void)testMutableDeepCopyWithNoNestedArray
{
    NSArray *target = @[@"foo", @"bar", @{@"foo": @"bar"}];
    NSMutableArray *result = target.mutableDeepCopy;
    expect(target).notTo.beKindOf([NSMutableArray class]);
    expect(result).to.beKindOf([NSMutableArray class]);
    expect(result).notTo.beEmpty();
    expect(result).to.contain(@"foo");
    expect(target.lastObject).notTo.beKindOf([NSMutableDictionary class]);
    expect(result.lastObject).to.beKindOf([NSMutableDictionary class]);
    expect([result.lastObject objectForKey:@"foo"]).to.equal(@"bar");
}

- (void)testMutableDeepCopyWithNestedArray
{
    NSArray *target = @[@[@"foo", @"bar"], @{@"foo": @[@"bar",@"buz"]}];
    NSMutableArray *result = target.mutableDeepCopy;
    expect(result).to.beKindOf([NSMutableArray class]);
    expect(target[0]).notTo.beKindOf([NSMutableArray class]);
    expect(result[0]).to.beKindOf([NSMutableArray class]);
    expect(result[0]).to.contain(@"foo");
    NSMutableDictionary *resultDict = result.lastObject;
    expect([resultDict objectForKey:@"foo"]).to.beKindOf([NSMutableArray class]);
    expect([resultDict objectForKey:@"foo"]).to.contain(@"bar");
}

- (void)testFindBy
{
    expect([@[@"foo"] findBy:nil]).to.beNil();
    expect([@[] findBy:@"foo"]).to.beNil();
    expect([@[@"foo"] findBy:@"foo"]).notTo.beNil();
    expect([@[@"foo"] findBy:@"foo"]).to.equal(@"foo");
    expect([@[@"foo"] findBy:@"bar"]).to.beNil();
}

@end
