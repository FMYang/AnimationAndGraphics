//
//  DrawLineViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/9/3.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "DrawLineViewController.h"

@interface DrawLineViewController ()

@end

@implementation DrawLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)drawLine:(UIButton *)sender {

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 64, screenWidth, 400);
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];

    UIBezierPath *linePath = [UIBezierPath bezierPath];
    linePath.lineWidth = 3;
    [linePath moveToPoint:CGPointMake(10, 200)];
    [linePath addLineToPoint:CGPointMake(300, 200)];
    layer.path = linePath.CGPath;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 2;

    [layer addAnimation:animation forKey:@"drawLineAnimation"];
    
}


@end
