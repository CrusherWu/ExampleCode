//
//  YYTabelView.m
//  CLStaticTableViewItem
//
//  Created by 1hhd on 17/4/19.
//  Copyright © 2017年 秦传龙. All rights reserved.
//

#import "YYTabelView.h"
#import "YYStaticDefineHeader.h"
#import "YYStaticItem.h"
#import "YYStaticTableViewCell.h"

@interface YYTabelView ()<UITableViewDelegate,UITableViewDataSource>
{
    
}

@end

@implementation YYTabelView


- (void)setUpUI {

    if (!self.backgroundColor) {
        self.backgroundColor = YYStaticColor(0.937);
    }
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpUI];
}

- (instancetype)init
{
    if (self == [super init]) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.groups[section] items] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    YYStaticTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YYStaticTableViewCell"];
    if (!cell) {
        cell = [[YYStaticTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"YYStaticTableViewCell"];
    }
    cell.item = [self.groups[indexPath.section] items][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YYStaticItem *item = [self.groups[indexPath.section]items][indexPath.row];
    
    if (item.detailClass) {

        UIViewController *vc = [item.detailClass new];
        vc.title = item.title;
        //[self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -lazyload
- (NSMutableArray *)groups {
    if (nil == _groups) {
        _groups = [[NSMutableArray alloc] init];
    }
    return _groups;
}
@end
