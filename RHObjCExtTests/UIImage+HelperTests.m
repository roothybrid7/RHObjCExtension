//
//  UIImage+HelperTests.m
//  RHObjCExt
//
//  Created by Satoshi Ohki on 2013/11/22.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import <UIKit/UIKit.h>
#import "UIImage+Helper.h"

@interface UIImage_HelperTests : SenTestCase

@end

@implementation UIImage_HelperTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    [NSThread sleepForTimeInterval:1.0];
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
//    STFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testImageNamedScaleToFillInView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    UIImage *image = [UIImage imageNamed:@"image.jpg" scaleToFillInView:view];
    STAssertTrue([image isMemberOfClass:[UIImage class]], @"");
    STAssertEquals(image.size, view.bounds.size, @"");
}

- (void)testImageWithUIColor
{
    UIImage *image = [UIImage imageWithUIColor:[UIColor whiteColor]];
    STAssertTrue([image isMemberOfClass:[UIImage class]], @"image with color");
}

@end
