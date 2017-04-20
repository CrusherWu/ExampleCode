//
//  YYCommonSwitchItem.h
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYStaticItem.h"
typedef void(^valueChange)(BOOL isOn);

@interface YYCommonSwitchItem : YYStaticItem

@property (nonatomic ,copy) valueChange valueChange;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title valueChange:(valueChange)valueChange;

@end



