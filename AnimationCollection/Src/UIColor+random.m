//
//  UIColor+random.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/30.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "UIColor+random.h"

@implementation UIColor (random)

+ (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
