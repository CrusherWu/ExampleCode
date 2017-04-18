//
//  DrawingImageView.m
//  Drawing
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "DrawingImageView.h"

@implementation DrawingImageView

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSLog(@"%s",__func__);
    
    UIImage *xcodeIcon = [UIImage imageNamed:@"大面包车"];
    [xcodeIcon drawAtPoint:CGPointMake(0.0f, 20.0f)];
}

@end
