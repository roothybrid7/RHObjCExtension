//
//  NSDictionaryQueryBuilderTests.m
//  RHObjCExt
//
//  Created by Satoshi Ohki on 2013/12/08.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "NSDictionary+QueryStringBuilder.h"

@interface NSDictionaryQueryBuilderTests : SenTestCase

@end

@implementation NSDictionaryQueryBuilderTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testDictionaryFromQueryString
{
    NSDictionary *result = [NSDictionary dictionaryFromQueryString:@"a=1qaz"];
    STAssertNotNil(result, @"");
    STAssertTrue(result.count == 1, @"");
    STAssertTrue([[result allKeys] containsObject:@"a"], @"");
    STAssertEqualObjects(result[@"a"], @"1qaz", @"");

    result = [NSDictionary dictionaryFromQueryString:@"a=1qaz&b=2wsx&c=3edc"];
    STAssertNotNil(result, @"");
    STAssertTrue(result.count == 3, @"");
    STAssertTrue([[result allKeys] containsObject:@"a"], @"");
    STAssertTrue([[result allKeys] containsObject:@"b"], @"");
    STAssertTrue([[result allKeys] containsObject:@"c"], @"");
    STAssertEqualObjects(result[@"a"], @"1qaz", @"");
    STAssertEqualObjects(result[@"b"], @"2wsx", @"");
    STAssertEqualObjects(result[@"c"], @"3edc", @"");

    result = [NSDictionary dictionaryFromQueryString:nil];
    STAssertNotNil(result, @"");
    STAssertTrue(result.count == 0, @"");

    result = [NSDictionary dictionaryFromQueryString:@""];
    STAssertNotNil(result, @"");
    STAssertTrue([[result allKeys] containsObject:@""], @"");
}

@end
