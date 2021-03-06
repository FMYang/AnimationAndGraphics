//
//  CALayerAnimationViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/22.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "CALayerAnimationViewController.h"
#import "ProgressViewController.h"
#import "TransitionViewController.h"
#import "MeituanAddFoodViewController.h"
#import "ShakeViewController.h"
#import "CAEmitterViewController.h"
#import "DrawLineViewController.h"
#import "PropertyAnimationViewController.h"

@interface CALayerAnimationViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datasource;
@end

@implementation CALayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _datasource = @[@"属性动画",
                    @"过渡动画",
                    @"画线",
                    @"进度条",
                    @"抛物线",
                    @"点赞",
                    @"粒子效果",
                    @"圆周运动",
                    @"抖动"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableView delegate/datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    cell.textLabel.text = self.datasource[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc;
    switch (indexPath.row) {
        case 0:
            vc = [[PropertyAnimationViewController alloc]init];
            break;

        case 1:
            vc = [[TransitionViewController alloc]init];
            break;

        case 2:
            vc = [[DrawLineViewController alloc]init];
            break;

        case 3: {
            vc = [[ProgressViewController alloc]init];
            break;
        }

        case 4:
            vc = [[MeituanAddFoodViewController alloc]init];
            break;

        case 5:
            break;
            
        case 6:
            vc = [[CAEmitterViewController alloc]init];
            break;
            
        case 8:
            vc = [[ShakeViewController alloc]init];
            break;

        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:true];
}

@end
