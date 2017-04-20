//
//  YYCommonLabel.m
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYCommonLabel.h"

@implementation YYCommonLabel
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title cellPressed:(cellPressed)pressed {
    
    YYCommonLabel *label = [[self alloc]init];
    label.title = title;
    label.icon  = icon;
    label.block = pressed;
    
    return label;
}
@end
