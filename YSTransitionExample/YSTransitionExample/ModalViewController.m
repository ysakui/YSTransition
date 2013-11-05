//
//  ModalViewController.m
//  YSTransitionExample
//
//  Created by ysakui on 2013/11/01.
//  Copyright (c) 2013年 YoshimitsuSakui. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Modal View";
    self.view.backgroundColor = [UIColor randomColor];
    
    [self.navigationItem setHidesBackButton:YES];
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    closeButton.frame = CGRectMake(0, 0, 100, 40);
    closeButton.center = self.view.center;
    [closeButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonDidTapped:) forControlEvents:UIControlEventTouchUpInside];
    closeButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:closeButton];
}


#pragma mark - Button Actions

- (void)closeButtonDidTapped:(id)sender {
    [self dismissViewControllerWithTransitionType:self.transitionType completion:nil];
}

@end
