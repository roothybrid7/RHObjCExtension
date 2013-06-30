//
//  NSArray+CoreExt.h
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2013/05/08.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Enumerable)

/*!
    @method mapUsingBlock:
    @abstract Ruby Array#mapのような何か.
    @example
        NSArray *keyChunks = [sourceKey componentsSeparatedByString:@"_"];
        keyChunks = [keyChunks mapUsingBlock:^(id item, NSUInteger idx) {
            if (idx == 0) {
                return item;
            }
            return (id)[item capitalizedString];
        }];
 */
- (NSArray *)mapUsingBlock:(id (^)(id, NSUInteger))block;

/*!
    @method rejectUsingBlock:
    @abstract block内でYES(True)を返した要素を配列から除外する
 */
- (NSArray *)rejectUsingBlock:(BOOL (^)(id, NSUInteger))block;

/*!
    @method findUsingBlock:
    @abstract block内でYES(True)を返した最初の要素を返す
 */
- (id)findUsingBlock:(BOOL (^)(id, NSUInteger))block;

@end
