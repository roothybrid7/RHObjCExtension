//
//  SKProduct+CoreExt.h
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2013/01/16.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <StoreKit/StoreKit.h>

@interface SKProduct (CoreExt)

- (NSString *)localizedPriceString;
/*!
    通貨記号(3桁): EUR, USD, JPY, ...
 */
- (NSString *)currencySymbol;

- (NSString *)productPlatform;

@end
