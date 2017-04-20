//
//  YYScrollTbaleView.m
//  UITableView循环利用实现原理
//
//  Created by 1hhd on 17/4/1.
//  Copyright © 2017年 yz. All rights reserved.
//

#import "YYScrollTbaleView.h"

@interface YYScrollTbaleView ()
{
    
}

// 屏幕可见数组
@property (nonatomic, strong) NSMutableArray *visibleTableViews;

// 缓存池
@property (nonatomic, strong) NSMutableSet *reuserTableViews;

// 记录每个可见cell的indexPaths的顺序
@property (nonatomic, strong) NSMutableArray *visibleIndexPaths;

@end

@implementation YYScrollTbaleView

@dynamic delegate;


- (void)reloadData
{
    NSInteger tableViewNum = [self.dataSource tableView:self numberOfRowsInSection:0];
    
    // 遍历所有cell的高度，计算每行cell的frame
    CGRect cellF;
    CGFloat cellX = 0;
    CGFloat cellY = 0;
    CGFloat cellW = self.bounds.size.width;
    CGFloat cellH = 0;
    
    for (int i = 0; i < tableViewNum; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        // 注意：这里获取的delegate，是UIScrollView中声明的属性
        if ([self.delegate respondsToSelector:@selector(tableView:widthForRowAtIndexPath:)]) {
            cellH = [self.delegate tableView:self widthForRowAtIndexPath:indexPath];
        }else{
            cellH = self.bounds.size.width;
        }
        
        cellY = i * cellH;
        
        cellF = CGRectMake(cellX, cellY, cellW, cellH);
        
        // 判断有多少cell显示在屏幕上,只加载显示在屏幕上的cell
        if ([self isInScreen:cellF]) { // 当前cell的frame在屏幕上
            // 通过数据源获取cell
            //UITableViewCell *cell = [self.dataSource tableView:self cellForRowAtIndexPath:indexPath];
            UITableView *cell = [UITableView new];
            
            cell.frame = cellF;
            
            // 插入到最里面，否则会挡住分割线
            [self insertSubview:cell atIndex:0];
            
            // 添加到cell可见数组中
            [self.visibleTableViews addObject:cell];
            
            // 记录每个可见cell的indexPaths的顺序
            [self.visibleIndexPaths addObject:indexPath];
            
        }
    }
    
    
    
}

// 根据cell尺寸判断cell在不在屏幕上
- (BOOL)isInScreen:(CGRect)cellF
{
    // tableView能滚动，因此需要加上偏移量判断
    
    // 当tableView内容往下走，offsetY会一直增加 ,cell的最大y值 < offsetY偏移量   ,cell移除屏幕
    // tableView内容往上走 , offsetY会一直减少，屏幕的最大Y值 <  cell的y值 ，Cell移除屏幕
    // 屏幕最大y值 = 屏幕的高度 + offsetY
    
    // 这里拿屏幕来比较，其实是因为tableView的尺寸我默认等于屏幕的高度，正常应该是tableView的高度。
    // cell在屏幕上， cell的最大y值 > offsetY && cell的y值 < 屏幕的最大Y值(屏幕的高度 + offsetY)
    
    CGFloat offsetY = self.contentOffset.y;
    
    return CGRectGetMaxY(cellF) > offsetY && cellF.origin.y < (self.bounds.size.height + offsetY);
    
}

@end
