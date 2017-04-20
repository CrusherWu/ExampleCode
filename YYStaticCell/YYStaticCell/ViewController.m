//
//  ViewController.m
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "ViewController.h"
#import "YYTabelView.h"
//#import "YYStaticCell/YYStaticCell.h"
#import "YYStaticCell_h.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YYTabelView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    YYCommonGroup *group = [YYCommonGroup group];
    [self.tableView.groups addObject:group];
    
    YYCommonLabel *label = [YYCommonLabel itemWithTitle:@"我的信誉"];
    label.text = @"不良信誉可修改";
    label.icon = @"我的icon-选中";
    
    YYCommonLabel *label1 = [YYCommonLabel itemWithIcon:@"消息icon" title:@"动友" cellPressed:^{
        NSLog(@"label cell 被点击");
    }];
    label1.text = @"";
    group.items = @[label,label1];
    
    
    YYCommonGroup *group1 = [YYCommonGroup group];
    [self.tableView.groups addObject:group1];
    YYCommonSwitchItem *label2 = [YYCommonSwitchItem itemWithIcon:@"消息icon" title:@"推送" valueChange:^(BOOL isOn) {
        NSString *str = nil;
        
        isOn?(str=@"打开"):(str=@"关闭");
        NSLog(@"%@",str);
    }];
    
    group1.items = @[label2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
