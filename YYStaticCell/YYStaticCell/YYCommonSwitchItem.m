//
//  YYCommonSwitchItem.m
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYCommonSwitchItem.h"

@implementation YYCommonSwitchItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title valueChange:(valueChange)valueChange {
    
    YYCommonSwitchItem *item = [self itemWithIcon:icon title:title];
    
    item.valueChange = valueChange;
    return item;
}

@end
