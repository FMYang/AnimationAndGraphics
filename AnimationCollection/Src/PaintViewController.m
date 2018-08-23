//
//  PaintViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/23.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "PaintViewController.h"

@interface PaintViewController ()

@end

@implementation PaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    PaintView *paintView = [[PaintView alloc]initWithStyle:self.style];
    paintView.backgroundColor = UIColor.whiteColor;
    paintView.frame = self.view.frame;
    [self.view addSubview:paintView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
