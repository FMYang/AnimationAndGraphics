//
//  UIImage+DotLine.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/31.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "UIImage+DotLine.h"

@implementation UIImage (DotLine)

+ (UIImage *)dotLine {

    // 切换到图片上下文
    UIGraphicsBeginImageContext(CGSizeMake(screenWidth, 1));

    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 设置画笔颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);

    // 设置线宽
    CGContextSetLineWidth(ctx, 1);

    // 绘制虚线
    CGFloat lenghts[] = {3, 5.0};

    // 设置虚线绘制模式
    // phase 第一个线段的宽度，比如lenghts为{3， 5}, phase为1，则第虚线的第一个点的宽度为2
    // lenghts {3.0, 5.0}表示虚线的线段宽度为3，每隔5个点绘制一个宽度为3的线段
    // count 如果长度参数指定一个数组，那么传递数组中元素的数量，否则传0。
    CGContextSetLineDash(ctx, 0, lenghts, 2);

    // 画第一条虚线
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, screenWidth, 0);
    // 绘制1
    CGContextDrawPath(ctx, kCGPathFillStroke);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    // 关闭当前图片上下文
    UIGraphicsEndImageContext();

    return image;
}

@end
