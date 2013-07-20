//
//  SKProduct+CoreExt.m
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2013/01/16.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "SKProduct+CoreExt.h"

@implementation SKProduct (CoreExt)

+ (NSNumberFormatter *)currencyFormatter
{
    static NSNumberFormatter *currencyFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currencyFormatter = [[NSNumberFormatter alloc] init];
    });
    return currencyFormatter;
}

/*!
    NSLogで価格が見たいので追加.
 */
- (NSString*)localizedPriceString {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:self.priceLocale];
    return [numberFormatter stringFromNumber:self.price];
}

- (NSString *)currencySymbol
{
    NSNumberFormatter *currencyFormatter = [self.class currencyFormatter];
    [currencyFormatter setLocale:self.priceLocale];
    return [currencyFormatter internationalCurrencySymbol]; // EUR, GBP, USD...
}

- (NSString *)productPlatform
{
    static NSString *platform = @"apple";
    return platform;
}

@end
