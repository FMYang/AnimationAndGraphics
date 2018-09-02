//
//  ShakeViewController.m
//  AnimationCollection
//
//  Created by 杨方明 on 2018/9/2.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "ShakeViewController.h"

@interface ShakeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *shakeImageView;

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap)];
    longGes.minimumPressDuration = 0.5;
    self.shakeImageView.userInteractionEnabled = true;
    [self.shakeImageView addGestureRecognizer:longGes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 长按
- (void)longTap {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.values = @[@DEGREES_TO_RADIANS(-3), @DEGREES_TO_RADIANS(3), @DEGREES_TO_RADIANS(-3)];
    animation.repeatCount = HUGE;
    animation.duration = 0.25;
    
    [self.shakeImageView.layer addAnimation:animation forKey: nil];
}


@end
