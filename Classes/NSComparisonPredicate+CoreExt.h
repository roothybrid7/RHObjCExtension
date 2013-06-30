//
//  NSComparisonPredicate+CoreExt.h
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2013/04/15.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSComparisonPredicate (CoreExt)

/*!
    @method buildTemplateWithPropertyName:type:options
    @abstract 指定したキー値と条件から動的に条件式のテンプレートを作成する
    @example
        NSPredicate *predicate = [NSComparisonPredicate buildTemplateWithPropertyName:@"name" NSContainsPredicateOperatorType options:NSCaseInsensitivePredicateOption];
 */
+ (NSPredicate *)buildTemplateWithPropertyName:(NSString *)name type:(NSPredicateOperatorType)type options:(NSUInteger)options;
@end
