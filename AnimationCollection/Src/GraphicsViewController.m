//
//  GraphicsViewController.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/23.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "GraphicsViewController.h"
#import "PaintViewController.h"

@interface GraphicsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datasource;
@end

@implementation GraphicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _datasource = @[@"画线",
                    @"虚线",
                    @"贝塞尔曲线",
                    @"渐变",
                    @"圆",
                    @"椭圆",
                    @"多边形",
                    @"走势图",
                    @"柱状图",
                    @"饼图"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - TableView delegate/datasource
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

    PaintStyle style;
    switch (indexPath.row) {
        case 0:
            style = kPaintStyleLine;
            break;

        case 1:
            style = kPaintStyleDottedLine;
            break;

        case 2:
            style = kPaintStyleBezier;
            break;

        case 3:
            style = kPaintStyleGradients;
            break;

        case 4:
            style = kPaintStyleCircle;
            break;

        case 5:
            style = kPaintStyleOval;
            break;

        case 6:
            style = kPaintStyleRectangle;
            break;

        case 7:
            style = kPaintStyleTrendChart;
            break;

        case 8:
            style = kPaintStyleHistogram;
            break;

        case 9:
            style = kPaintStylePie;
            break;

        default:
            style = kPaintStyleLine;
            break;
    }

    PaintViewController *vc = [[PaintViewController alloc]init];
    vc.style = style;
    [self.navigationController pushViewController:vc animated:true];
}

@end
