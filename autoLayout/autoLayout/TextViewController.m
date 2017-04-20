//
//  TextViewController.m
//  autoLayout
//
//  Created by 1hhd on 17/4/15.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "TextViewController.h"
#import "YYTextView.h"

@interface TextViewController ()
@property (weak, nonatomic) IBOutlet YYTextView *yyTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) YYTextView *yyTextView2;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _yyTextView2 = [YYTextView new];
    _yyTextView2.frame = CGRectMake(10, 100, 200, 60);
    [self.view addSubview:_yyTextView2];
    _yyTextView2.font = [UIFont systemFontOfSize:14];
    _yyTextView2.placeHolder = @"请输入内容...";
    
     UIImage *image2 = [UIImage imageNamed:@"72.png"];
    _imageView.image = [self circleImage:image2 withParam:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    //圆的边框宽度为2，颜色为红色
    
    CGContextSetLineWidth(context,0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset *2.0f, image.size.height - inset *2.0f);
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextClip(context);
    
    //在圆区域内画出image原图
    
    [image drawInRect:rect];
    
    CGContextAddEllipseInRect(context, rect);
    
    CGContextStrokePath(context);
    
    //生成新的image
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newimg;
    
}


@end
