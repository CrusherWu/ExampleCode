//
//  DrawPathView.m
//  Drawing
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "DrawPathView.h"

@implementation DrawPathView

-(instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSLog(@"%s",__func__);
    
    /* Step1 获取当期的画布: Graphic Context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    /* Step2 创建 path */
    CGMutablePathRef path = CGPathCreateMutable();
    
    /* Step3 移动到起始点 */
    CGPathMoveToPoint(path,NULL, self.frame.size.width, self.frame.origin.y);
    
    /* Step4 绘制一个椭圆 */
    CGPathAddEllipseInRect(path, &CGAffineTransformIdentity, CGRectMake(0, 320, 160, 160));
    
    /* Step5 再添加一条直线 */
    CGPathAddLineToPoint(path,NULL, self.frame.origin.x, self.frame.size.height);
    
    /* Step6 向画布添加path */
    CGContextAddPath(currentContext, path);
    
    /* Step7 设置绘制类型: kCGPathStroke(绘制边缘), kCGPathFill(填充path内区域), kCGPathFillStroke(包含前面两项)*/
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    /* Step8 提交绘制 */
    CGContextStrokePath(currentContext);
    
    /* Step9 release path */
    CGPathRelease(path);
}

@end
