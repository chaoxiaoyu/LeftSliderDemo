//
//  MyPanGestureRecognizer.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/9.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "MyPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation MyPanGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action onView:(UIView *)view
{
      if (self = [super initWithTarget:target action:action])
      {
            self.onView = view;
      }
      return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
      [super touchesBegan:touches withEvent:event];
      UITouch *touch = [touches anyObject];
      CGPoint point = [touch locationInView:self.onView];
      self.beginPoint = point;
}

@end
