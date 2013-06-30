//
//  NSArray+CoreExt.h
//  RHObjCExt
//
//  Created by 大木 聡 on 2013/06/11.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CoreExt)

/*!
    @method mutableDeepCopy
    @abstract NSArrayを中身を含め再帰的にNSMutableArrayに変換する
 */
- (NSMutableArray *)mutableDeepCopy;

/*!
    @method findBy:
    @abstract 配列を検索して最初に一致した要素を返す
 */
- (id)findBy:(id)obj;

@end
