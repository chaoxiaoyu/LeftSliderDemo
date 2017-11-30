//
//  HeaderBtn.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/20.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "HeaderBtn.h"

@implementation HeaderBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
      CGRect rect = CGRectMake(0, 0, contentRect.size.width, contentRect.size.width);
      return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
      CGRect rect = CGRectMake(0, contentRect.size.width+5, contentRect.size.width, 20);
      return rect;
}

@end
