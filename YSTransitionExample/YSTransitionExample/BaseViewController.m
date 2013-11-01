//
//  BaseViewController.m
//  YSTransitionExample
//
//  Created by ysakui on 2013/11/01.
//  Copyright (c) 2013年 YoshimitsuSakui. All rights reserved.
//

#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "YSNavigationController.h"
#import "PushViewController.h"
#import "ModalViewController.h"

typedef NS_ENUM(NSInteger, TableSection) {
    TableSectionViewSetting,
    TableSectionPush,
    TableSectionModal,
    TableSectionCount,
};

typedef NS_ENUM(NSInteger, TableViewSettingRow) {
    TableViewSettingRowToggleNavigationBar,
    TableViewSettingRowCount,
};

typedef NS_ENUM(NSInteger, TablePushRow) {
    TablePushRowFromRight,
    TablePushRowFromLeft,
    TablePushRowFromTop,
    TablePushRowFromBottom,
    TablePushRowCount,
};

typedef NS_ENUM(NSInteger, TableModalRow) {
    TableModalRowFromRight,
    TableModalRowFromLeft,
    TableModalRowFromTop,
    TableModalRowFromBottom,
    TableModalRowCount,
};


@interface BaseViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"YSTransition";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView flashScrollIndicators];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


#pragma mark - UITableView datasource & delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return TableSectionCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case TableSectionViewSetting:
            return @"ViewSetting";
            break;
        case TableSectionPush:
            return @"PushViewController";
            break;
        case TableSectionModal:
            return @"PresentViewController";
        default:
            break;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    tableView.sectionHeaderHeight = headerView.frame.size.height;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, headerView.frame.size.width - 10, 22)];
    label.text = [self tableView:tableView titleForHeaderInSection:section];
    label.font = [UIFont boldSystemFontOfSize:16.0];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    [headerView addSubview:label];
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case TableSectionViewSetting:
            return TableViewSettingRowCount;
            break;
        case TableSectionPush:
            return TablePushRowCount;
            break;
        case TableSectionModal:
            return TableModalRowCount;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    switch (indexPath.section) {
        case TableSectionViewSetting:
            
            switch (indexPath.row) {
                case TableViewSettingRowToggleNavigationBar:
                    if (self.navigationController.navigationBarHidden)
                        cell.textLabel.text = @"Show NavigationBar";
                    else
                        cell.textLabel.text = @"Hide NavigationBar";
                    break;
                    
                default:
                    break;
            }
            break;
            
        case TableSectionPush:
            switch (indexPath.row) {
                case TablePushRowFromRight:
                    cell.textLabel.text = @"From Right";
                    break;
                case TablePushRowFromLeft:
                    cell.textLabel.text = @"From Left";
                    break;
                case TablePushRowFromTop:
                    cell.textLabel.text = @"From Top";
                    break;
                case TablePushRowFromBottom:
                    cell.textLabel.text = @"From Bottom";
                    break;
                default:
                    break;
            }
            break;
            
        case TableSectionModal:
            switch (indexPath.row) {
                case TableModalRowFromRight:
                    cell.textLabel.text = @"From Right";
                    break;
                case TableModalRowFromLeft:
                    cell.textLabel.text = @"From Left";
                    break;
                case TableModalRowFromTop:
                    cell.textLabel.text = @"From Top";
                    break;
                case TableModalRowFromBottom:
                    cell.textLabel.text = @"From Bottom";
                    break;
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"willDisplayCell: %d", indexPath.row);
    cell.backgroundColor = [UIColor clearColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
            
        case TableSectionViewSetting: {
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            switch (indexPath.row) {
                case TableViewSettingRowToggleNavigationBar:
                    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
                    
                    if (self.navigationController.navigationBarHidden)
                        cell.textLabel.text = @"Show NavigationBar";
                    else
                        cell.textLabel.text = @"Hide NavigationBar";
                    
                    [tableView deselectRowAtIndexPath:indexPath animated:YES];
                    break;
                    
                default:
                    break;
            }
            
        }   break;
            
        case TableSectionPush: {
            
            PushViewController *pushViewController = [[PushViewController alloc] init];
            YSTransitionType pushSubtype;
            
            switch (indexPath.row) {
                case TablePushRowFromRight:
                    pushSubtype = YSTransitionTypeFromRight;
                    pushViewController.transitionType = YSTransitionTypeFromLeft;
                    break;
                    
                case TablePushRowFromLeft:
                    pushSubtype = YSTransitionTypeFromLeft;
                    pushViewController.transitionType = YSTransitionTypeFromRight;
                    break;
                    
                case TablePushRowFromTop:
                    pushSubtype = YSTransitionTypeFromTop;
                    pushViewController.transitionType = YSTransitionTypeFromBottom;
                    break;
                    
                case TablePushRowFromBottom:
                    pushSubtype = YSTransitionTypeFromBottom;
                    pushViewController.transitionType = YSTransitionTypeFromTop;
                    break;
                    
                default:
                    pushSubtype = YSTransitionTypeFromLeft;
                    break;
            }
            
            [(YSNavigationController *)self.navigationController pushViewController:pushViewController withTransitionType:pushSubtype];
            
        }   break;
            
            
        case TableSectionModal: {
            
            ModalViewController *modalViewController = [[ModalViewController alloc] init];
            YSTransitionType presentSubtype;
            
            switch (indexPath.row) {
                case TableModalRowFromRight:
                    presentSubtype = YSTransitionTypeFromRight;
                    modalViewController.transitionType = YSTransitionTypeFromLeft;
                    break;
                    
                case TableModalRowFromLeft:
                    presentSubtype = YSTransitionTypeFromLeft;
                    modalViewController.transitionType = YSTransitionTypeFromRight;
                    break;
                    
                case TableModalRowFromTop:
                    presentSubtype = YSTransitionTypeFromBottom;
                    modalViewController.transitionType = YSTransitionTypeFromTop;
                    break;
                    
                case TableModalRowFromBottom:
                    presentSubtype = YSTransitionTypeFromTop;
                    modalViewController.transitionType = YSTransitionTypeFromBottom;
                    break;
                    
                default:
                    presentSubtype = YSTransitionTypeFromBottom;
                    break;
            }
            
            if (self.navigationController.navigationBarHidden) {
                [self presentViewController:modalViewController withTransitionType:presentSubtype completion:nil];
            } else {
                UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:modalViewController];
                [self presentViewController:navigationController withTransitionType:presentSubtype completion:nil];
            }
        }   break;
            
        default:
            break;
    }
}


#pragma mark - Acessor

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

@end
