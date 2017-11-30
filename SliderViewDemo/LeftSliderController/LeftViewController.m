//
//  LeftViewController.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/8.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "LeftViewController.h"
#import "Public.h"

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//      self.view.backgroundColor = [UIColor greenColor];
      [self addTableView];
      
}

- (void)addTableView
{
      self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth - kRightDistance, kHeight) style:UITableViewStylePlain];
      self.tableView.delegate = self;
      self.tableView.dataSource = self;
      [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
      cell.imageView.image = [UIImage imageNamed:@""];
      cell.textLabel.text = @"wodeshangcheng";
      return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
      return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      UIViewController *controller = nil;
      [tableView deselectRowAtIndexPath:indexPath animated:YES];
      switch (indexPath.row) {
            case 0:
                  controller = [[NextViewController alloc] init];
                  break;
            case 1:
                  controller = [[NextViewController alloc] init];
                  break;
            case 2:
                  controller = [[NextViewController alloc] init];
                  break;
            case 3:
                  controller = [[NextViewController alloc] init];
                  break;
            case 4:
                  controller = [[NextViewController alloc] init];
                  break;
            case 5:
                  controller = [[NextViewController alloc] init];
                  break;
                  
            default:
                  break;
      }
      
      [[NSNotificationCenter defaultCenter] postNotificationName:@"leftSliderTapped" object:controller];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
      UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
      
      HeaderBtn *button = [HeaderBtn buttonWithType:UIButtonTypeCustom];
      button.bounds = CGRectMake(0, 0, 90, 120);
      button.center = CGPointMake(self.view.frame.size.width/2.0, 90);
      button.imageView.clipsToBounds = YES;
//      button.imageView.image = [UIImage imageNamed:@"header"];
      [button setImage:[UIImage imageNamed:@"header"] forState:UIControlStateNormal];
      button.imageView.layer.cornerRadius = button.bounds.size.width/2.0;
      
      [button setTitle:@"nick" forState:UIControlStateNormal];
      button.titleLabel.textAlignment = NSTextAlignmentCenter;
      [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      [button addTarget:self action:@selector(changeInformation:) forControlEvents:UIControlEventTouchUpInside];
      [backView addSubview:button];
      
      UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(backView.frame)-1, backView.frame.size.width-20, 1)];
      lineView.backgroundColor = [UIColor grayColor];
      [backView addSubview:lineView];
      return backView;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//
//}

- (void)changeInformation:(UIButton *)button
{
      UIViewController *infoController = [[NextViewController alloc] init];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"leftSliderTapped" object:infoController];
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
