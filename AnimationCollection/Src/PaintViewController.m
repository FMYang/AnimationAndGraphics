//
//  PaintViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/23.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "PaintViewController.h"
#import "GraphView.h"

@interface PaintViewController ()

@end

@implementation PaintViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    PaintView *paintView = [[PaintView alloc]initWithStyle:self.style];
    paintView.backgroundColor = UIColor.whiteColor;
    if (self.style == kPaintStyleForm) {
        paintView.frame = CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width-40, 250);
    } else {
        paintView.frame = self.view.frame;
    }
    [self.view addSubview:paintView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
