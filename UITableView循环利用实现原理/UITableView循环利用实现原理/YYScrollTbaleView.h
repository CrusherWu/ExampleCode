//
//  YYScrollTbaleView.h
//  UITableView循环利用实现原理
//
//  Created by 1hhd on 17/4/1.
//  Copyright © 2017年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYScrollTbaleView;

@protocol YYScrollTbaleViewDataSource <NSObject>

@required

- (NSInteger)tableView:(YYScrollTbaleView *)yyScrollTbaleView numberOfRowsInSection:(NSInteger)section;

@end

@protocol YYScrollTbaleViewDelegate <NSObject, UIScrollViewDelegate>

// 返回每行cell有多高
- (CGFloat)tableView:(YYScrollTbaleView *)yyScrollTbaleView widthForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YYScrollTbaleView : UIScrollView

@property (nonatomic,weak) id<YYScrollTbaleViewDataSource> dataSource;
@property (nonatomic,weak) id<YYScrollTbaleViewDelegate> delegate;

-(void)reloadData;

@end
