//
//  MainViewController.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/8.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "MainViewController.h"
#import "Public.h"
#import "NextViewController.h"
#import "Tab1ViewController.h"
#import "Tab2ViewController.h"
#import "Tab3ViewController.h"

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
      
//      self.view.backgroundColor = [UIColor yellowColor];
//      self.edgesForExtendedLayout = UIRectEdgeNone;
//      self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
//
//      if (@available(iOS 11.0, *)) {
//            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//去掉tableview上方的20point的空白区域
//      } else {
//            self.automaticallyAdjustsScrollViewInsets = NO;
//      }
//      UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
//      header.backgroundColor = [UIColor grayColor];
//      self.tableView.tableHeaderView = header;
//      self.tableView.delegate = self;
//      self.tableView.dataSource = self;
//      [self.view addSubview:self.tableView];
   
      [self addTabBarControllers];
     
}


- (void)addTabBarControllers
{
      Tab1ViewController *tab1 = [[Tab1ViewController alloc] init];
      UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:tab1];
      nav1.title = @"推荐";
      
      Tab2ViewController *tab2 = [[Tab2ViewController alloc] init];
      UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:tab2];
      nav2.title = @"目的地";
      
      Tab3ViewController *tab3 = [[Tab3ViewController alloc] init];
      UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:tab3];
      nav3.title = @"发现";
      
      self.viewControllers = @[nav1, nav2, nav3];
      
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      return 30;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//      if (section == 0)
//      {
            UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
            header.backgroundColor = [UIColor redColor];
            return header;
//      }

      return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resuse"];
      static int i = 0;
      cell.textLabel.text = [NSString stringWithFormat:@"第%d行",i++];
      return cell;
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
