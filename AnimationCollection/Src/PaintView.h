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
    kPaintStyleTriangle,    // 三角形
    kPaintStyleRectangle,   // 矩形
    kPaintStylePentagram,   // 五角星
    kPaintStyleForm,        // 表格
} PaintStyle;

@interface PaintView : UIView
@property (nonatomic, assign) PaintStyle style;
- (instancetype)initWithStyle:(PaintStyle)style;
@end
