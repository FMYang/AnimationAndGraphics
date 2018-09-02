//
//  ViewAnimationViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/21.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "ViewAnimationViewController.h"

@interface ViewAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (assign, nonatomic) BOOL isChanged;

@end

@implementation ViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.firstView.backgroundColor = UIColor.grayColor;
    self.secondView.backgroundColor = UIColor.cyanColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 基本动画
// 平移
- (IBAction)move:(id)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect rect = self.animationView.frame;
        self.animationView.frame = CGRectMake(200, rect.origin.y, rect.size.width, rect.size.height);
    } completion:^(BOOL finished) {
        // do noting
    }];
}

// 缩放
- (IBAction)scale:(id)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.animationView.transform = CGAffineTransformMakeScale(1.2, 1.2); // CGAffineTransformMakeScale参数分别表示x轴和y轴的缩放比例
    } completion:^(BOOL finished) {
        self.animationView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

// 旋转
- (IBAction)transform:(id)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat animations:^{
        
        // 注意：CALayer的transform属性CATransform3D，UIView的transform属性CGAffineTransform
//        self.animationView.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0); // 3D动画 x, y, z
        self.animationView.transform = CGAffineTransformRotate(self.animationView.transform, M_PI / 2); // 2D动画
    } completion:^(BOOL finished) {
        // do noting
    }];
}

// 透明度渐变
- (IBAction)show:(id)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.animationView.alpha = 0.5;
    } completion:^(BOOL finished) {
        self.animationView.alpha = 1.0;
    }];
}

#pragma mark - 过渡动画
- (IBAction)transition:(id)sender {

    NSInteger index = ((UIButton *)sender).tag;

    UIViewAnimationOptions options;

    switch (index) {
        case 100:
            options = UIViewAnimationOptionTransitionFlipFromLeft;
            break;

        case 101:
            options = UIViewAnimationOptionTransitionFlipFromRight;
            break;

        case 102:
            options = UIViewAnimationOptionTransitionFlipFromTop;
            break;

        case 103:
            options = UIViewAnimationOptionTransitionFlipFromBottom;
            break;

        case 104:
            options = UIViewAnimationOptionTransitionCurlUp;
            break;

        case 105:
            options = UIViewAnimationOptionTransitionCurlDown;
            break;

        default:
            options = UIViewAnimationOptionTransitionFlipFromLeft;
            break;
    };

    // 动画完成后toView添加到fromView的父视图上，fromView从它的父视图移除（动画作用于fromView的父视图），如果不想移除可以设置在options加上UIViewAnimationOptionShowHideTransitionViews（此属性修改默认的添加移除行为为显示和隐藏）
    [UIView transitionFromView:self.isChanged ? _firstView : _secondView toView: self.isChanged ? _secondView : _firstView duration: 1.0 options:options | UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
        self.isChanged = !self.isChanged;
    }];

    // 与上面等价
//    [UIView transitionWithView:self.containView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//        if (self.isChanged) {
//            self.firstView.hidden = true;
//            self.secondView.hidden = false;
//        } else {
//            self.firstView.hidden = false;
//            self.secondView.hidden = true;
//        }
//    } completion:^(BOOL finished) {
//        self.isChanged = !self.isChanged;
//    }];
}


@end
