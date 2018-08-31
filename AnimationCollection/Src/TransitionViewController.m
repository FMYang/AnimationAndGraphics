//
//  TransitionViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/31.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "TransitionViewController.h"
#import "UIColor+random.h"
#import <objc/runtime.h>

@interface TransitionViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)fade:(id)sender {

    NSInteger tag = ((UIButton *)sender).tag;
    NSString *type = @"fade";
    NSString *subType= @"fromRight";
    switch (tag) {
        case 0: {
            type = @"fade";
            subType = @"fromRight";
        }
            break;

        case 1: {
            type = @"moveIn";
            subType = @"fromRight";
        }
            break;

        case 2: {
            type = @"push";
            subType = @"fromRight";
        }
            break;

        case 3: {
            type = @"reveal";
            subType = @"fromRight";
        }
            break;

        // 下面是私有api（慎用）
        case 4: {
            type = @"cube";
            subType = @"fromRight";
        }
            break;

        case 5: {
            type = @"suckEffect";
            subType = @"fromRight";
        }
            break;

        case 6: {
            type = @"oglFlip";
            subType = @"fromRight";
        }
            break;

        case 7: {
            type = @"rippleEffect";
            subType = @"fromRight";
        }
            break;

        case 8: {
            type = @"pageCurl";
            subType = @"fromRight";
        }
            break;

        case 9: {
            type = @"pageUnCurl";
            subType = @"fromRight";
        }
            break;

        case 10: {
            type = @"cameraIrisHollowOpen";
            subType = @"fromRight";
        }
            break;

        case 11: {
            type = @"cameraIrisHollowClose";
            subType = @"fromRight";
        }
            break;

        default:
            break;
    }

    self.animationView.backgroundColor = [UIColor randomColor];

    CATransition *transion = [CATransition animation]; // 创建过渡动画
    transion.type = type; // 动画类型
    transion.subtype = subType; // 动画方向
    transion.duration = 2;

    [self.animationView.layer addAnimation:transion forKey:nil];
}

@end
