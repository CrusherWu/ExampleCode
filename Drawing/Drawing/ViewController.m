//
//  ViewController.m
//  Drawing
//
//  Created by 1hhd on 17/4/18.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "ViewController.h"
#import "DrawingVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [UITableViewCell new];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DrawingVC *vc = [DrawingVC new];
    vc.viewClassString = _dataSource[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[@"DrawingLineView",@"DrawingTextView",@"DrawingImageView",@"DrawPathView"];
    }
    return  _dataSource;
}

@end
