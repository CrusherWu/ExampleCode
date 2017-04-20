//
//  YYStaticItem.m
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYStaticItem.h"

@implementation YYStaticItem

+ (instancetype)itemWithTitle:(NSString *)title {
    
    return [self itemWithIcon:nil title:title];
    
}
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    
    YYStaticItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    
    return item;
}

@end
