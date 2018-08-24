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
            break;
            
        case kPaintStyleRectangle:
            [self drawRectangle:ctx];
            break;

        case kPaintStyleForm:
            [self drawForm:ctx rect:(CGRect)rect];
            break;

        default:
            break;
    }
}

- (void)drawLine:(CGContextRef)ctx {
    // 设置画笔颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);

    // 设置笔帽样式
    // kCGLineCapButt,  方形的线，默认样式
    // kCGLineCapRound, 圆角的线
    // kCGLineCapSquare
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 设置线宽
    CGContextSetLineWidth(ctx, 20.0);

    // 设置起始点
    CGContextMoveToPoint(ctx, 100, 100);

    // 添加一条道终点的线
    CGContextAddLineToPoint(ctx, 300, 100);

    // 绘制
    CGContextDrawPath(ctx, kCGPathFillStroke);


    // 第二条线
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    CGContextSetLineWidth(ctx, 20.0);
    CGContextMoveToPoint(ctx, 100, 200);
    CGContextAddLineToPoint(ctx, 300, 200);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    // 第三条线
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineWidth(ctx, 20.0);
    CGContextMoveToPoint(ctx, 100, 300);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    // 第四条线
    // 设置线的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextSetLineWidth(ctx, 20.0);
    CGContextMoveToPoint(ctx, 100, 500);
    CGContextAddLineToPoint(ctx, 300, 500);
    CGContextAddLineToPoint(ctx, 300, 700);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    CGContextMoveToPoint(ctx, 300, 700);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextAddLineToPoint(ctx, 100, 700);
    CGContextDrawPath(ctx, kCGPathStroke);
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
    
    // 定义渐变的每种颜色的颜色组件。组件应位于空间指定的颜色空间中。
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
        0.0, 1.0, 0.0, 1.0};

    myColorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    
    gradientRef = CGGradientCreateWithColorComponents(myColorSpace, components, locations, number_location);

    CGColorSpaceRelease(myColorSpace);

    //  线性渐变
    CGContextDrawLinearGradient(ctx, gradientRef, CGPointMake(80.0, 140.0), CGPointMake(80.0, 250.0), kCGGradientDrawsBeforeStartLocation);

    // 辐射渐变, 绘制沿所提供的开始和结束圆圈定义的区域变化的渐变填充。
    CGPoint start = CGPointMake(100, 380);//起始点
    CGPoint end = CGPointMake(100, 500); //终结点
    //辐射渐变 start:起始点 20:起始点的半径 end:终止点 40: 终止点的半径 这个辐射渐变
    CGContextDrawRadialGradient(ctx, gradientRef, start, 20, end, 40, 0);

    CGGradientRelease(gradientRef);
    
    // 注意：CAGradientLayer只支持线性渐变
}

- (void)drawRectangle:(CGContextRef)ctx {
    // 绘制三角形
    CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor cyanColor].CGColor);
    CGContextSetLineWidth(ctx, 10);
    CGPoint lines[] = {
        CGPointMake(100, 100),
        CGPointMake(100, 200),
        CGPointMake(200, 200)
    };
    CGContextAddLines(ctx, lines, sizeof(lines)/sizeof(lines[0]));
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    // 绘制矩形
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextAddRect(ctx, CGRectMake(240, 100, 100, 100));
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    // 绘制多边形
    CGContextSetLineWidth(ctx, 1);
    CGPoint lines1[] = {
        CGPointMake(100, 300),
        CGPointMake(100, 400),
        CGPointMake(200, 400),
        CGPointMake(300, 300),
    };
    CGContextAddLines(ctx, lines1, sizeof(lines1)/sizeof(lines1[0]));
    CGContextClosePath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    // 绘制五角星
    // 确定中心点
    CGPoint centerPoint = CGPointMake(200, 500);
    // 确定半径
    CGFloat radius = 50;
    // 五角星的顶点
    CGPoint p1 = CGPointMake(centerPoint.x, centerPoint.y-radius);
    CGContextMoveToPoint(ctx, p1.x, p1.y);
    // 五角星每个点之间的夹角，采用弧度计算
    // 点与点之间的夹角为2*M_PI/5.0
    CGFloat angle = 4*M_PI/5;
    for (int i=0; i<=5; i++) {
        CGFloat x = centerPoint.x - sinf(i*angle)*radius;
        CGFloat y = centerPoint.y - cosf(i*angle)*radius;
        CGContextAddLineToPoint(ctx, x, y);
    }
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

- (void)drawForm:(CGContextRef)ctx rect:(CGRect)rect {
    // Drawing code
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

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat leftMargin = 20;
    CGFloat rightMargin = 20;
    CGFloat topMargin = 60;
    CGFloat bottomMargin = 40;
    CGFloat hSpace = (width-40)/7;
    CGFloat vSpace = (height-100)/6;
    CGFloat x = 0.0;
    CGFloat y = 0.0;

    NSArray *graphPoints = @[@6, @2, @5, @2, @4, @1, @3];

    CGFloat startY = height - bottomMargin - [graphPoints[0] intValue] * vSpace;
    CGPoint startPoint = CGPointMake(leftMargin, startY);

    UIBezierPath *drawPath = [UIBezierPath bezierPath];
    [[UIColor whiteColor] setFill];
    [[UIColor whiteColor] setStroke];
    drawPath.lineWidth = 2;

    [drawPath moveToPoint:startPoint];

    for (int i=0; i<graphPoints.count; i++) {
        x = leftMargin + i*hSpace;
        y = height - bottomMargin - [graphPoints[i] intValue] * vSpace;
        [drawPath addLineToPoint:CGPointMake(x, y)];
    }

    [drawPath stroke];

    // 绘制折线填充区域
//    UIBezierPath *clippingPath = [drawPath copy];
//    [clippingPath addLineToPoint:CGPointMake(leftMargin+7*hSpace, height)];
//    [clippingPath addLineToPoint:CGPointMake(leftMargin, height)];
//    [clippingPath closePath];
//
//    [clippingPath addClip];
//
//    [[UIColor grayColor] setFill];
//    [drawPath stroke];
//    UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:rect];
//    [rectpath fill];

}

@end
