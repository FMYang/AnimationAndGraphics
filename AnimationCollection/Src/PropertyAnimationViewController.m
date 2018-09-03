//
//  PropertyAnimationViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/9/3.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "PropertyAnimationViewController.h"

@interface PropertyAnimationViewController ()
@property (strong, nonatomic) NSArray *propertys;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation PropertyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _propertys = @[@"position", @"transform.scale", @"transform.rotation.x", @"transform.rotation.y", @"transform.rotation.z", @"opacity", @"transform.translation.x", @"backgroundColor", @"cornerRadius"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)makeAnimation:(UIButton *)sender {

    NSString *keyPath = self.propertys[sender.tag];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    switch (sender.tag) {
        case 0: {
            animation.fromValue = @[@(self.iconView.center.x), @(self.iconView.center.y)];
            animation.toValue = @[@(self.iconView.center.x), @(self.iconView.center.y + 100)];
        }
            break;

        case 1: {
            animation.fromValue = @1;
            animation.toValue = @2;
        }
            break;

        case 2:
        case 3:
        case 4: {
            animation.fromValue = @0;
            animation.toValue = @(M_PI);
        }
            break;

        case 5: {
            animation.fromValue = @0;
            animation.toValue = @1;
        }
            break;

        case 6: {
            animation.fromValue = @0;
            animation.toValue = @100;
        }
            break;

        case 7: {
        }
            break;

        case 8: {
            self.iconView.layer.masksToBounds = true;
            animation.fromValue = @0.0;
            animation.toValue = @(self.iconView.bounds.size.height/2);
        }
            break;

        default:
            break;
    }

    animation.duration = 1;
    animation.removedOnCompletion = false;
    animation.fillMode = kCAFillModeForwards;
    self.iconView.layer.cornerRadius = 8.0;

    [self.iconView.layer addAnimation:animation forKey:nil];
}

- (IBAction)groupAnimation:(id)sender {
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation1.fromValue = @0;
    animation1.toValue = @(M_PI);

    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation2.fromValue = @0;
    animation2.toValue = @(M_PI);

    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation3.fromValue = @0;
    animation3.toValue = @(M_PI);

    CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
    group.animations = @[animation1, animation2, animation3];
    group.duration = 2;

    [self.iconView.layer addAnimation:group forKey:nil];
}


@end
