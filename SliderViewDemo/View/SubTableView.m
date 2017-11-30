//
//  SubTableView.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/30.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "SubTableView.h"

@implementation SubTableView

- (instancetype)initWithFrame:(CGRect)frame
{
      if (self = [super initWithFrame:frame])
      {
            self.titleArray = @[@"新闻", @"娱乐", @"电视剧", @"旅游", @"历史文化"];
            UITableView *tableview = [[UITableView alloc] initWithFrame:frame];
            tableview.delegate = self;
            tableview.dataSource = self;
            [self addSubview:tableview];
      }
      
      return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
      return 30;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
      UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
      scrollView.bounces = NO;
      scrollView.showsHorizontalScrollIndicator = NO;
      scrollView.backgroundColor = [UIColor grayColor];
      CGFloat top = 5;
      CGFloat spaceWidth = 30;
      static CGFloat leftEdge = 20;
      for (int i = 0; i < self.titleArray.count; i++)
      {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = [UIFont systemFontOfSize:14.0];
            CGSize size = [self.titleArray[i] sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
            button.frame = CGRectMake(leftEdge, top, size.width, size.height);
            [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100 + i;
            [scrollView addSubview:button];
            leftEdge += size.width + spaceWidth;
      }
      scrollView.contentSize = CGSizeMake(leftEdge, 30);
      return scrollView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      static int i = 0;
      UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
      cell.textLabel.text = [NSString stringWithFormat:@"第%d行",i++];
      return cell;
}

@end
