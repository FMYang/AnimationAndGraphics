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
@interface RootViewController () <UITabBarDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datasource;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"动画和绘图合集";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    cell.textLabel.text = (indexPath.row == 0) ? @"UIView动画" : @"CALayer动画";

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ViewAnimationViewController *vc = [[ViewAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    } else {
        CALayerAnimationViewController *vc = [[CALayerAnimationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }
}

@end