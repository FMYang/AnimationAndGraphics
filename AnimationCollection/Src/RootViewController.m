//
//  RootViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/21.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "RootViewController.h"
#import "ViewAnimationViewController.h"
#import "CALayerAnimationViewController.h"
#import "GraphicsViewController.h"

@interface RootViewController () <UITabBarDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datasource;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"动画和绘图合集";

    _datasource = @[@"绘图", @"UIView动画", @"CALayer动画", @"有趣的动画"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableViewDelegate
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

    if (indexPath.row == 0) {
        GraphicsViewController *vc = [[GraphicsViewController alloc]init];
        [self.navigationController pushViewController:vc animated:true];
    }
    else if (indexPath.row == 1) {
        ViewAnimationViewController *vc = [[ViewAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    } else if (indexPath.row == 2) {
        CALayerAnimationViewController *vc = [[CALayerAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }
}

@end
