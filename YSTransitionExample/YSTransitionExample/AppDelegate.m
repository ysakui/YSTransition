//
//  AppDelegate.m
//  YSTransitionExample
//
//  Created by ysakui on 2013/11/01.
//  Copyright (c) 2013年 YoshimitsuSakui. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "YSNavigationController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseViewController *baseViewController = [[BaseViewController alloc] init];
    YSNavigationController *navigationController = [[YSNavigationController alloc] initWithRootViewController:baseViewController];
    self.window.rootViewController = navigationController;;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
