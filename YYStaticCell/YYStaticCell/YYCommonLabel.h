//
//  YYCommonLabel.h
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYStaticItem.h"
typedef void(^cellPressed)(void);

@interface YYCommonLabel : YYStaticItem

@property (nonatomic ,copy) cellPressed block;

@property (nonatomic ,strong) NSString *text;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title cellPressed:(cellPressed)pressed;

@end
