//
//  ViewController.m
//  SliderViewDemo
//
//  Created by abc on 2017/11/8.
//  Copyright © 2017年 xiangTian. All rights reserved.
//

#import "ViewController.h"
#import "MyPanGestureRecognizer.h"
#import "Public.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
{
      BOOL isOpen;
      BOOL needMoveWithPan;
      UIViewController *leftVC;
      CGFloat leftX;
      UITapGestureRecognizer *tap;
}
@property (nonatomic, strong) MyPanGestureRecognizer *panGesture;
@property (nonatomic, assign) CGFloat displacementX;
@property (nonatomic, strong) UITabBarController *mainVC;
@end

@implementation ViewController

- (void)viewDidLoad {
      [super viewDidLoad];
      // Do any additional setup after loading the view, typically from a nib.
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leftSliderPush:) name:@"leftSliderTapped" object:nil];
      
}



- (instancetype)initWithMainController:(UIViewController *)mainController LeftController:(UIViewController *)leftController
{
      if (self = [super init])
      {
            self.mainVC = (UITabBarController *)mainController;
            leftX = -kWidth+kRightDistance;
            self.panGesture = [[MyPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:) onView:mainController.view];
            [self.mainVC.viewControllers[0].view addGestureRecognizer:self.panGesture];
            [self.panGesture setCancelsTouchesInView:NO];
            self.panGesture.delegate = self;
            
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToClose)];
            tap.numberOfTapsRequired = 1;
            tap.numberOfTouchesRequired = 1;
            tap.enabled = NO;
            [self.mainVC.viewControllers[0].view addGestureRecognizer:tap];
            
            
            leftVC = leftController;
            
            leftController.view.frame = CGRectMake(leftX, 0, kWidth-kRightDistance, kHeight);
            mainController.view.frame = self.view.bounds;
            [self.view addSubview:mainController.view];
            [self.view addSubview:leftController.view];
            [self addChildViewController:mainController];
            [self addChildViewController:leftController];
            _displacementX = 0;
            isOpen = NO;
      }
      return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)pan
{
      needMoveWithPan = YES;
      if (self.panGesture.beginPoint.x > 15 && !isOpen)
      {
            return;
      }
      
      CGPoint point = [pan translationInView:self.view];
      _displacementX += point.x;
      if ((CGRectGetMaxX(leftVC.view.frame) < 0 && _displacementX < 0) || (CGRectGetMaxX(leftVC.view.frame) > (kWidth - kRightDistance) && _displacementX > 0))
      {
            needMoveWithPan = NO;
            _displacementX = 0;
      }
      
      
      if (needMoveWithPan && CGRectGetMaxX(leftVC.view.frame) >= 0 && CGRectGetMaxX(leftVC.view.frame) <= (kWidth - kRightDistance))
      {
            if (leftX + _displacementX > 0 && _displacementX > 0)
            {
                 _displacementX = kWidth - kRightDistance;
            }
            leftVC.view.frame = CGRectMake( leftX + _displacementX, 0, kWidth - kRightDistance, kHeight);
//            leftVC.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, _displacementX, 0);
//            NSLog(@"leftVC.view.MaxX = %lf", CGRectGetMaxX(leftVC.view.frame));
            [pan setTranslation:CGPointMake(0, 0) inView:self.view];
      }
      
      if (!needMoveWithPan)
      {
            _displacementX = 0;
            if (CGRectGetMaxX(leftVC.view.frame) >= (kWidth - kRightDistance-2))
                  [self openLeftView];
            else if (CGRectGetMaxX(leftVC.view.frame) <= 0)
                  [self closeLeftView];
      }
      
      if (pan.state == UIGestureRecognizerStateEnded)
      {
            
            if(fabs(_displacementX) >= (kWidth-kRightDistance)/2.0)
            {
                  isOpen = !isOpen;
            }
            if (isOpen)
            {
                  [self openLeftView];
            }
            else
            {
                  [self closeLeftView];
            }
            _displacementX = 0;
      }
      
      
}

- (void)openLeftView
{
      [UIView beginAnimations:nil context:nil];
      [UIView setAnimationDuration:0.4];
      leftVC.view.frame = CGRectMake(0, 0, leftVC.view.frame.size.width, leftVC.view.frame.size.height);
      leftVC.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
//      NSLog(@"leftVC.view.openX = %lf", CGRectGetMaxX(leftVC.view.frame));
      isOpen = YES;
      leftX = 0;
      [UIView commitAnimations];
      [self enableSingleTap];
      
}

- (void)closeLeftView
{
      [UIView beginAnimations:nil context:nil];
      [UIView setAnimationDuration:0.4];
      leftVC.view.frame = CGRectMake(-kWidth+kRightDistance, 0, leftVC.view.frame.size.width, leftVC.view.frame.size.height);
      leftVC.view.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
//      NSLog(@"leftVC.view.closeX = %lf", CGRectGetMaxX(leftVC.view.frame));
      isOpen = NO;
      leftX = -kWidth + kRightDistance;
      [UIView commitAnimations];
      [self disableSingleTap];
}

- (void)disableSingleTap
{
      tap.enabled = NO;
      
}

- (void)enableSingleTap
{
      tap.enabled = YES;
      tap.cancelsTouchesInView = YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
      return YES;
}

- (void)leftSliderPush:(NSNotification *)notification
{
      [self closeLeftView];
      
      [self.mainVC.viewControllers[0] pushViewController:notification.object animated:YES];
}

- (void)tapToClose
{
      [self closeLeftView];
}

- (void)didReceiveMemoryWarning {
      [super didReceiveMemoryWarning];
      // Dispose of any resources that can be recreated.
}


@end
