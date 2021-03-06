//
//  PaintView.h
//  AnimationCollection
//
//  Created by yfm on 2018/8/23.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kPaintStyleLine,        // 直线
    kPaintStyleDottedLine,  // 虚线
    kPaintStyleBezier,      // 贝塞尔曲线
    kPaintStyleGradients,   // 渐变
    kPaintStyleCircle,      // 圆形
    kPaintStyleOval,        // 椭圆
    kPaintStyleRectangle,   // 多边形
    kPaintStyleTrendChart,  // 走势图
    kPaintStyleHistogram,   // 柱状图
    kPaintStylePie          // 饼图
} PaintStyle;

@interface PaintView : UIView
@property (nonatomic, assign) PaintStyle style;
- (instancetype)initWithStyle:(PaintStyle)style;
@end
