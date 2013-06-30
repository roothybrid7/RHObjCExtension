//
//  NSComparisonPredicate+CoreExt.m
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2013/04/15.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import "NSComparisonPredicate+CoreExt.h"

@implementation NSComparisonPredicate (CoreExt)

+ (NSPredicate *)buildTemplateWithPropertyName:(NSString *)name type:(NSPredicateOperatorType)type options:(NSUInteger)options
{
    NSExpression *lhs = [NSExpression expressionForKeyPath:name];
    NSExpression *rhs = [NSExpression expressionForVariable:name];
    return [[self class] predicateWithLeftExpression:lhs rightExpression:rhs modifier:NSDirectPredicateModifier type:type options:options];
}

@end
