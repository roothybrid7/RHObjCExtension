//
//  UIImage+Helper.h
//  RHObjCExt
//
//  Created by OKI SATOSHI on 2012/12/14.
//  Copyright (c) 2013年 roothybrid7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)

/*!
    @method imageNamed:scaleToFillInView:
    @abstract 指定したViewのサイズに引き伸ばした画像を返す
 */
+ (UIImage * )imageNamed:(NSString *)imageName scaleToFillInView:(UIView *)view;

- (UIImage *)resizePerRate:(CGFloat)rate;

@end
