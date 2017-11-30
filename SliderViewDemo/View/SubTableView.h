//
//  SubTableView.h
//  SliderViewDemo
//
//  Created by abc on 2017/11/30.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubTableView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *titleArray;

@end
