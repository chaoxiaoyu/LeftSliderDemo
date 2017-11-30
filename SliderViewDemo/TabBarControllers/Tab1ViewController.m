//
//  Tab1ViewController.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/29.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "Tab1ViewController.h"
#import "Public.h"
#import "SubTableView.h"
@interface Tab1ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation Tab1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
      tableView.delegate = self;
      tableView.dataSource = self;
      UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 100)];
      headerView.backgroundColor = [UIColor yellowColor];
      tableView.tableHeaderView = headerView;
      tableView.tableFooterView = [UIView new];
      [self.view addSubview:tableView];
      
      self.titleArray = @[@"新闻", @"娱乐", @"电视剧", @"旅游", @"历史文化"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      return self.view.frame.size.height;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//      return 30;
//}
//
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//      UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 30)];
//      scrollView.bounces = NO;
//      scrollView.showsHorizontalScrollIndicator = NO;
//      scrollView.backgroundColor = [UIColor grayColor];
//      CGFloat top = 5;
//      CGFloat spaceWidth = 30;
//      static CGFloat leftEdge = 20;
//      for (int i = 0; i < self.titleArray.count; i++)
//      {
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
//            CGSize size = [self.titleArray[i] sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
//            button.frame = CGRectMake(leftEdge, top, size.width, size.height);
//            [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
//            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
//            button.tag = 100 + i;
//            [scrollView addSubview:button];
//            leftEdge += size.width + spaceWidth;
//      }
//      scrollView.contentSize = CGSizeMake(leftEdge, 30);
//      return scrollView;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      UITableViewCell *cell = [[UITableViewCell alloc] init];
      SubTableView *subTableView = [[SubTableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
      [cell addSubview:subTableView];
      return cell;
}

- (void)buttonTapped:(UIButton *)button
{
      
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
