//
//  DrawingLineView.m
//  Drawing
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "DrawingLineView.h"

@implementation DrawingLineView

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSLog(@"%s",__func__);
    
    /* Step1 设置绘图颜色 */
    [[UIColor brownColor] set];
    
    /* Step2 获取当期的画布: Graphic Context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    /* Step3 设置线条宽度 */
    CGContextSetLineWidth(currentContext,5.0f);
    
    /* Step4 把画笔移动到起始点 */
    CGContextMoveToPoint(currentContext,50.0f, 10.0f);
    
    /* Step5 从起始点绘制线条到终点 */
    CGContextAddLineToPoint(currentContext,100.0f, 200.0f);
    
    /* Step6 提交绘制 */
    CGContextStrokePath(currentContext);
}
@end
