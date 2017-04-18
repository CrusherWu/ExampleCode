//
//  DrawingVC.m
//  Drawing
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "DrawingVC.h"
#import "DrawingVC.h"
#import "DrawingTextView.h"
#import "DrawingImageView.h"
#import "DrawPathView.h"

@interface DrawingVC ()

@end

@implementation DrawingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [NSClassFromString(_viewClassString) new];
    view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
