//
//  AppDelegate.m
//  AnimationCollection
//
//  Created by yfm on 2018/8/21.
//  Copyright © 2018年 yfm. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    RootViewController *rootVC = [[RootViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = nav;

    [self.window makeKeyAndVisible];
    return YES;
}


@end
