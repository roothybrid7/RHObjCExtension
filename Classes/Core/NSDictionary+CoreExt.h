//
//  NSDictionary+CoreExt.h
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/11.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CoreExt)

/*!
    @method mutableDeepCopy
    @abstract NSDictionaryを中身を含め再帰的にNSMutableDictionaryに変換する
 */
- (NSMutableDictionary *)mutableDeepCopy;

@end
