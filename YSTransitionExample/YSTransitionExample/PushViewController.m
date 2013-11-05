//
//  PushViewController.m
//  YSTransitionExample
//
//  Created by ysakui on 2013/11/01.
//  Copyright (c) 2013年 YoshimitsuSakui. All rights reserved.
//

#import "PushViewController.h"
#import "YSNavigationController.h"

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Push View";
    self.view.backgroundColor = [UIColor randomColor];
    
    [self.navigationItem setHidesBackButton:YES];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(0, 0, 100, 40);
    backButton.center = self.view.center;
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonDidTapped:) forControlEvents:UIControlEventTouchUpInside];
    backButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:backButton];
}


#pragma mark - Button Actions

- (void)backButtonDidTapped:(id)sender {
    [(YSNavigationController *)self.navigationController popViewControllerWithTransitionType:self.transitionType];
}

@end
