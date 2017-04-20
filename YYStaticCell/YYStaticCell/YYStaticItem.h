//
//  YYStaticItem.h
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYStaticItem : NSObject

@property (nonatomic ,copy) NSString *icon;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *subTitle;

@property (nonatomic ,copy) NSString *badgeValue;

@property (nonatomic, assign) Class detailClass;




+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;

@end
