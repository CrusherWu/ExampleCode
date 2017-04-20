//
//  ViewController.m
//  autoLayout
//
//  Created by 1hhd on 17/3/24.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myLabelBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.myLabel.text = @"sjkksjdfksdfksdkfshdkjfhhjhdjkhfkjsdh";
    self.myLabel.numberOfLines = 0;
    self.myLabel.font = [UIFont systemFontOfSize:15];
    //self.myLabelBottom.constant = 10;
    
    //self.scrollViewHeight.constant = 100;
}

@end
