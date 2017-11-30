//
//  Tab1ViewController.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/29.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "Tab1ViewController.h"

@interface Tab1ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation Tab1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
      tableView.delegate = self;
      tableView.dataSource = self;
      UIView *headerView = [UIView alloc]
      
      [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
