//
//  NextViewController.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/23.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()<UIGestureRecognizerDelegate>

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor whiteColor];
      [self setPopGestureRecognizer];
}

- (void)setPopGestureRecognizer
{
      UIGestureRecognizer *gesture = self.navigationController.interactivePopGestureRecognizer;
      NSArray *targets = [gesture valueForKey:@"targets"];
      id navigationTarget = [targets firstObject];
      id popTarget = [navigationTarget valueForKey:@"target"];
      SEL navigationTransition = NSSelectorFromString(@"handleNavigationTransition:");
      UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:popTarget action:navigationTransition];
      panGesture.delegate = self;
      [self.view addGestureRecognizer:panGesture];
      self.navigationController.interactivePopGestureRecognizer.enabled = NO;
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
