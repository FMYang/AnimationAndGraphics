//
//  ProgressViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/22.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "ProgressViewController.h"

@interface ProgressViewController () <CAAnimationDelegate>
@property (nonatomic, strong) CAShapeLayer *shaperLayer;
@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - function
- (IBAction)drawProgressBar:(id)sender {
    _shaperLayer = [CAShapeLayer layer];
    _shaperLayer.frame = CGRectMake(self.view.bounds.size.width/2-50, 100, 100, 100);

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_shaperLayer.bounds.size.width/2, _shaperLayer.frame.size.height/2) radius:50 startAngle:-M_PI/2 endAngle:M_PI * 3/2 clockwise:true];

    _shaperLayer.lineWidth = 2.0;
    _shaperLayer.strokeColor = [UIColor redColor].CGColor;
    _shaperLayer.fillColor = [UIColor clearColor].CGColor;
    _shaperLayer.path = path.CGPath;

    [self.view.layer addSublayer:_shaperLayer];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"]; // 属性的关键路径动画
    animation.duration = 5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSNumber numberWithDouble: 0.0];
    animation.toValue = [NSNumber numberWithDouble: 1.0];;
    animation.delegate = self;

    [_shaperLayer addAnimation:animation forKey:@"progressAnimation"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    [self.shaperLayer removeFromSuperlayer];
}

@end
