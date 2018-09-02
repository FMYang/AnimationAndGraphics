//
//  CAEmitterViewController.m
//  AnimationCollection
//
//  Created by 杨方明 on 2018/9/2.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "CAEmitterViewController.h"

@interface CAEmitterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *praiseButton;

@property (strong, nonatomic) NSMutableArray *cells;

@property (strong, nonatomic) CAEmitterLayer *emitter;

@end

@implementation CAEmitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.praiseButton.layer addSublayer:self.emitter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)praiseTap:(UIButton *)sender {
    self.emitter.birthRate = 1;
    
    for (int i=0; i<5; i++) {
        CAEmitterCell *cell = [[CAEmitterCell alloc] init];
        cell.contents = (__bridge id)[UIImage imageNamed:[NSString stringWithFormat:@"emoji_%d", arc4random_uniform(113)+1]].CGImage;
        cell.contentsScale = 3;
        cell.birthRate = 1; // 每秒产生多少个
        cell.lifetime = 1; // 生存时间
        cell.alphaSpeed = 0.3;
        cell.velocity = 200; // 初始速度
//        cell.velocityRange = 100;
        cell.xAcceleration = -100; //x轴方向的加速度
        cell.yAcceleration = 100; //y轴加速度
        cell.emissionLongitude = 5 * M_PI / 4; // y轴发射角度
        cell.emissionRange = 3 * M_PI/ 4; // 发射范围，与y轴发射角度的夹角，左右对称的弧形范围
        [self.cells addObject:cell];
    }
    self.emitter.emitterCells = self.cells;
    
    [self.cells removeAllObjects];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.emitter.birthRate = 0;
    });
}

- (CAEmitterLayer *)emitter {
    if (!_emitter) {
        _emitter = [CAEmitterLayer layer];
        _emitter.renderMode = kCAEmitterLayerAdditive;
        _emitter.emitterShape = kCAEmitterLayerPoint;
        _emitter.emitterPosition = CGPointMake(_emitter.frame.size.width / 2, _emitter.frame.size.height / 2);
        _emitter.birthRate = 1;
    }
    return _emitter;
}

- (NSMutableArray *)cells {
    if (!_cells) {
        _cells = [@[] mutableCopy];
    }
    return _cells;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
