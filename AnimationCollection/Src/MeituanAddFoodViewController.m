//
//  MeituanAddFoodViewController.m
//  AnimationCollection
//
//  Created by 杨方明 on 2018/9/1.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "MeituanAddFoodViewController.h"

@interface MeituanAddFoodViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *shoppingCartView;
@property (weak, nonatomic) IBOutlet UIButton *addOrderButton;
@property (nonatomic, strong) UIImageView *animationView;
@property (nonatomic, strong) NSMutableArray *animationViews;
@end

@implementation MeituanAddFoodViewController

- (void)dealloc {
    [self.animationViews removeAllObjects];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _animationViews = [@[] mutableCopy];
    
    NSMutableArray *images = [@[] mutableCopy];
    for (int i=0; i<13; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"shoppingcart_unempty_%d", i]]];
    };
    self.shoppingCartView.animationImages = images;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [self.animationViews removeAllObjects];
}

#pragma mark - Functaion

- (IBAction)addOrder:(UIButton *)sender {
    
    _animationView = [[UIImageView alloc]init];
    _animationView.image = [UIImage imageNamed:@"home_footerbar_dot"];
    _animationView.frame = CGRectMake(0, 0, 20, 20);
    _animationView.center = self.addOrderButton.center;
    [self.animationViews addObject:_animationView];
    [self.view addSubview:_animationView];
    [self.view bringSubviewToFront:self.shoppingCartView];
    
    CGPoint startPoint = self.addOrderButton.center;
    CGPoint endPoint = self.shoppingCartView.center;
    
    CGPoint controlPoint = CGPointMake(startPoint.x - 120, startPoint.y - 220);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO; // 保持结束状态，frame值未改变
    animation.delegate = self;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    animation.path = path.CGPath;
    
    [self.animationView.layer addAnimation:animation forKey:nil];
}

#pragma mark - delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self.shoppingCartView startAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.shoppingCartView stopAnimating];
            self.shoppingCartView.image = [UIImage imageNamed:@"shoppingcart_unempty_0"];
        });
    }
}

@end
