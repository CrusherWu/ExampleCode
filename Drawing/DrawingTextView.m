//
//  DrawingTextView.m
//  Drawing
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "DrawingTextView.h"

@implementation DrawingTextView

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSLog(@"%s",__func__);
    
    NSString *myString = @"Some String";
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSFontAttributeName] = [UIFont systemFontOfSize:40.f];
    att[NSForegroundColorAttributeName] = [UIColor blueColor];
    
    [myString drawAtPoint:CGPointMake(10, 100) withAttributes:att];
}

@end
