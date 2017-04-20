//
//  YYCommonGroup.h
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYCommonGroup : NSObject


@property (nonatomic, copy) NSString *footer;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, strong) NSArray *items;
+ (instancetype)group;

@end
