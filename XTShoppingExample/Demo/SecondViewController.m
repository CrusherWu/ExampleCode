//
//  SecondViewController.m
//  Demo
//
//  Created by 1hhd on 17/4/25.
//  Copyright © 2017年 Zhangjingwang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 200)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    NSLog(@"view1 frame: %@", NSStringFromCGRect(view1.frame));
    NSLog(@"view1 center: %@", NSStringFromCGPoint(view1.center));
    
    CGPoint originInWindowCoordinates = [self.view convertPoint:view1.bounds.origin fromView:view1];
    NSLog(@"bounds.origin: %@", NSStringFromCGPoint(view1.bounds.origin));
    NSLog(@"convertPoint:fromView: %@", NSStringFromCGPoint(originInWindowCoordinates));
    
    CGPoint originInView1Coordinates = [self.view convertPoint:view1.frame.origin toView:view1];
    NSLog(@"frame: %@", NSStringFromCGPoint(view1.frame.origin));
    NSLog(@"convertPoint:toView: %@", NSStringFromCGPoint(originInView1Coordinates));
}


@end
