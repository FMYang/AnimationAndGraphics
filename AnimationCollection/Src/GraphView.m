//
//  GraphView.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/24.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 创建颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();

    CGColorRef colors[] = {
        [UIColor colorWithRed:255/255.0 green:233/255.0 blue:222/255.0 alpha:1.0].CGColor,
        [UIColor colorWithRed:252/255.0 green:79/255.0 blue:8/255.0 alpha:1.0].CGColor
    };

    CGFloat loactions[2] = {0.0, 1.0};

    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void**)colors, 2, nil);

    // 创建渐变对象
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, colorArray, loactions);

    // 裁剪
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(8, 8)];

    [path addClip];

    // 绘制渐变
    CGContextDrawLinearGradient(ctx, gradient, CGPointZero, CGPointMake(0, self.bounds.size.height), 0);

    // 释放创建的对象
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);


    // 绘制折线
    NSArray *graphPoints = @[@4, @2, @6, @4, @5, @8, @3];

}


@end
