//
//  YJTableViewController.m
//  YJChatDemo
//
//  Created by liuyingjie on 2017/8/3.
//  Copyright © 2017年 liuyingjie. All rights reserved.
//

#import "YJTableViewController.h"

@interface YJTableViewController ()

@end

@implementation YJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}


@end
