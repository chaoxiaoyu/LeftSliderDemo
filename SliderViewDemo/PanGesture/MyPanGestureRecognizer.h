//
//  MyPanGestureRecognizer.h
//  SliderViewDemo
//
//  Created by abc on 2017/11/9.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPanGestureRecognizer : UIPanGestureRecognizer

@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, strong) UIView *onView;

- (instancetype)initWithTarget:(id)target action:(SEL)action onView:(UIView *)view;

@end
