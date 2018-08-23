//
//  PaintView.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/23.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "PaintView.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@implementation PaintView

- (instancetype)initWithStyle:(PaintStyle)style {
    if (self = [super init]) {
        _style = style;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    switch (self.style) {
        case kPaintStyleLine:
            [self drawLine:ctx];
            break;

        case kPaintStyleDottedLine:
            [self drawDottedLine:ctx];
            break;

        case kPaintStyleBezier:
            [self drawBezier:ctx];
            break;

        case kPaintStyleCircle:
            [self drawCircle:ctx];
            break;

        case kPaintStyleOval:
            [self drawOval:ctx];
            break;

        case kPaintStyleGradients:
            [self drawGradients:ctx];

        default:
            break;
    }
}

- (void)drawLine:(CGContextRef)ctx {
    // 设置画笔颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);

    // 设置线宽
    CGContextSetLineWidth(ctx, 10.0);

    // 设置起始点
    CGContextMoveToPoint(ctx, 100, 100);

    // 添加一条道终点的线
    CGContextAddLineToPoint(ctx, 300, 100);

    // 绘制
    CGContextDrawPath(ctx, kCGPathFillStroke);


    // 第二条线
    CGContextSetLineWidth(ctx, 2.0);
    CGContextMoveToPoint(ctx, 100, 200);
    CGContextAddLineToPoint(ctx, 300, 200);
    CGContextDrawPath(ctx, kCGPathFillStroke);


}

- (void)drawDottedLine:(CGContextRef)ctx {
    // 设置画笔颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);

    // 设置线宽
    CGContextSetLineWidth(ctx, 2.0);

    CGFloat lenghts[] = {10.0, 5.0};

    // 绘制虚线
    // phase 第一个线段的宽度，比如lenghts为{3， 5}, phase为1，则第虚线的第一个点的宽度为2
    // lenghts {3.0, 5.0}表示虚线的线段宽度为3，每隔5个点绘制一个宽度为3的线段
    // count 如果长度参数指定一个数组，那么传递数组中元素的数量，否则传0。
    CGContextSetLineDash(ctx, 0, lenghts, 2);

    // 画第一条虚线
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 300, 100);
    // 绘制1
    CGContextDrawPath(ctx, kCGPathFillStroke);

    // 画第二条虚线
    CGContextSetLineDash(ctx, 5, lenghts, 2);
    CGContextMoveToPoint(ctx, 100, 150);
    CGContextAddLineToPoint(ctx, 300, 150);

    // 绘制2
    CGContextDrawPath(ctx, kCGPathFillStroke);

    // 画第三条虚线
    CGContextSetLineDash(ctx, 10, lenghts, 2);
    CGContextMoveToPoint(ctx, 100, 200);
    CGContextAddLineToPoint(ctx, 300, 200);

    // 绘制3
    CGContextDrawPath(ctx, kCGPathFillStroke);

    // 对比上面三条线查看CGContextSetLineDash参数的区别

    // 两条不同颜色的虚线组合为一条
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGFloat lenghts1[] = {10.0, 30.0};
    CGContextSetLineDash(ctx, 0, lenghts1, 2);
    CGContextMoveToPoint(ctx, 100, 300);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextDrawPath(ctx, kCGPathFillStroke);

    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextSetLineDash(ctx, 20, lenghts1, 2);
    CGContextMoveToPoint(ctx, 100, 300);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

- (void)drawBezier:(CGContextRef)ctx {
    // 设置画笔颜色
    [[UIColor redColor] set];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(100, 100)];
    // endPoint , controlPoint
    [path1 addQuadCurveToPoint:CGPointMake(300, 100) controlPoint:CGPointMake(150, 200)];
    [path1 stroke];

    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(100, 300)];
    [path2 addCurveToPoint:CGPointMake(300, 300) controlPoint1:CGPointMake(150, 200) controlPoint2:CGPointMake(250, 400)];
    [path2 stroke];

    // 绘制贝塞尔曲线参考线
    [[UIColor grayColor] set];
    UIBezierPath *referPath = [UIBezierPath bezierPath];
    [referPath moveToPoint:CGPointMake(100, 300)];
    [referPath addLineToPoint:CGPointMake(150, 200)];
    [referPath addLineToPoint:CGPointMake(250, 400)];
    [referPath addLineToPoint:CGPointMake(300, 300)];
    [referPath stroke];
}

- (void)drawCircle:(CGContextRef)ctx {
    // 画圆
    [[UIColor redColor] set];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 addArcWithCenter:CGPointMake(100, 150) radius:50 startAngle:0 endAngle:2*M_PI clockwise:true];
    [path1 stroke];

    // 填充圆, 5中填充模式
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 400, 50, 50) cornerRadius:25];
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, path2.CGPath);
    CGContextDrawPath(ctx, kCGPathFillStroke);

    //使用偶数规则在路径内渲染该区域。
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(70, 400, 50, 50) cornerRadius:25];
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, path3.CGPath);
    CGContextDrawPath(ctx, kCGPathEOFill);

    //使用非零绕组编号规则呈现路径中包含的区域。
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(140, 400, 50, 50) cornerRadius:25];
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, path4.CGPath);
    CGContextDrawPath(ctx, kCGPathFill);

    //首先填充然后描边，使用偶数规则。
    UIBezierPath *path5 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(220, 400, 50, 50) cornerRadius:25];
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, path5.CGPath);
    CGContextDrawPath(ctx, kCGPathEOFillStroke);

    //沿路径呈现一行。
    UIBezierPath *path6 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(290, 400, 50, 50) cornerRadius:25];
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, path6.CGPath);
    CGContextDrawPath(ctx, kCGPathStroke);
}

- (void)drawOval:(CGContextRef)ctx {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 100, 50)];
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextAddPath(ctx, path.CGPath);
    CGContextDrawPath(ctx, kCGPathStroke);
}

- (void)drawGradients:(CGContextRef)ctx {

    // create CGGradientRef object
    CGGradientRef gradientRef;
    CGColorSpaceRef myColorSpace;
    size_t number_location = 2;
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
        0.0, 1.0, 0.0, 1.0};

    myColorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    gradientRef = CGGradientCreateWithColorComponents(myColorSpace, components, locations, number_location);

    CGColorSpaceRelease(myColorSpace);

    //  paint an axial or linear gradient (线性渐变)
    CGContextDrawLinearGradient(ctx, gradientRef, CGPointMake(20.0, 120.0), CGPointMake(20.0, 220.0), kCGGradientDrawsBeforeStartLocation);

    //辐射渐变
    CGPoint start = CGPointMake(100, 380);//起始点
    CGPoint end = CGPointMake(100, 500); //终结点
    //辐射渐变 start:起始点 20:起始点的半径 end:终止点 40: 终止点的半径 这个辐射渐变
    CGContextDrawRadialGradient(ctx, gradientRef, start, 20, end, 40, 0);

    // 注意：CAGradientLayer只支持线性渐变
}

@end
