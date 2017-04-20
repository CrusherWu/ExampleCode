//
//  masoryVC.m
//  autoLayout
//
//  Created by 1hhd on 17/4/12.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "masoryVC.h"
#import "Masonry.h"
#import "MASExampleUpdateView.h"
#import "MASExampleScrollView.h"
#import "MASExampleMarginView.h"
#import "MASExampleDistributeView.h"
#import "MASExampleAttributeChainingView.h"
#import "MASExampleArrayView.h"
#import "MASExampleAttributeChainingView.h"

static UIEdgeInsets const kPadding = {10, 10, 10, 10};

@interface masoryVC ()

@property UIView *topView;
@property UIView *topInnerView;
@property UIView *bottomView;
@property UIView *bottomInnerView;

@property (nonatomic, strong) UILabel *shortLabel;
@property (nonatomic, strong) UILabel *longLabel;

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGSize buttonSize;

@end

@implementation masoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    //[self one];
    [self two];
    //[self three];
    //[self four];
    //[self five];
    //[self six];
    //[self seven];
//    [self eight];
    //[self nine];
    
}
-(void)seven
{
    MASExampleScrollView *view = [MASExampleScrollView new];
    view.frame = self.view.frame;
    [self.view addSubview:view];
    
}
-(void)eight
{
    MASExampleMarginView *view = [MASExampleMarginView new];
    view.frame = self.view.frame;
    [self.view addSubview:view];
}
-(void)nine
{
    MASExampleAttributeChainingView *view = [MASExampleAttributeChainingView new];
    view.frame = self.view.frame;
    [self.view addSubview:view];
}

-(void)six
{
    MASExampleUpdateView *view = [MASExampleUpdateView new];
    view.frame = self.view.frame;
    [self.view addSubview:view];
}




- (void)layoutSubviews {
    
    CGFloat width = CGRectGetMinX(self.shortLabel.frame) - kPadding.left;
    width -= CGRectGetMinX(self.longLabel.frame);
    self.longLabel.preferredMaxLayoutWidth = width;
    
}

-(void)five
{
    self.shortLabel = UILabel.new;
    self.shortLabel.numberOfLines = 1;
    self.shortLabel.textColor = [UIColor purpleColor];
    self.shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.shortLabel.text = @"Bacon";
    [self.view addSubview:self.shortLabel];
    
    self.longLabel = UILabel.new;
    self.longLabel.numberOfLines = 8;
    self.longLabel.textColor = [UIColor darkGrayColor];
    self.longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.longLabel.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    [self.view addSubview:self.longLabel];
    
    [self.longLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).insets(kPadding);
        make.top.equalTo(self.view.mas_top).insets(kPadding);
    }];
    
    [self.shortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.longLabel.mas_lastBaseline);
        make.top.equalTo(self.view.mas_top).insets(kPadding);
        make.right.equalTo(self.view.mas_right).insets(kPadding);
    }];
}
-(void)four
{
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    UILabel *blueView = UILabel.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.numberOfLines = 3;
    blueView.textAlignment = NSTextAlignmentCenter;
    blueView.font = [UIFont systemFontOfSize:24];
    blueView.textColor = UIColor.whiteColor;
    blueView.text = @"this should look broken! check your console!";
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    
    UIView *superview = self.view;
    int padding = 10;
    
    //you can attach debug keys to views like so:
    //    greenView.mas_key = @"greenView";
    //    redView.mas_key = @"redView";
    //    blueView.mas_key = @"blueView";
    //    superview.mas_key = @"superview";
    
    //OR you can attach keys automagically like so:
    MASAttachKeys(greenView, redView, blueView, superview);
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        //you can also attach debug keys to constaints
        make.edges.equalTo(@1).key(@"ConflictingConstraint"); //composite constraint keys will be indexed
        make.height.greaterThanOrEqualTo(@5000).key(@"ConstantConstraint");
        
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding).key(@"BottomConstraint");
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.height.equalTo(greenView.mas_height);
        make.height.equalTo(redView.mas_height).key(@340954); //anything can be a key
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(redView.mas_left).offset(-padding);
        make.width.equalTo(redView.mas_width);
        
        make.height.equalTo(redView.mas_height);
        make.height.equalTo(blueView.mas_height);
    }];
    
    //with is semantic and option
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding);
        make.left.equalTo(greenView.mas_right).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(greenView.mas_width);
        
        make.height.equalTo(@[greenView, blueView]);
    }];

}
-(void)three
{
    // Create views
    self.topView = [[UIView alloc] initWithFrame:CGRectZero];
    self.topInnerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bottomInnerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Set background colors
    UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
    [self.topView setBackgroundColor:blueColor];
    
    UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
    [self.topInnerView setBackgroundColor:lightGreenColor];
    
    UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
    [self.bottomView setBackgroundColor:pinkColor];
    
    UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
    [self.bottomInnerView setBackgroundColor:darkGreenColor];
    
    // Layout top and bottom views to each take up half of the window
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.equalTo(self.view);
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom);
        make.height.equalTo(self.topView);
    }];
    
    // Inner views are configured for aspect fit with ratio of 3:1
    [self.topView addSubview:self.topInnerView];
    [self.topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.topInnerView.mas_height).multipliedBy(3);
        
        make.width.and.height.lessThanOrEqualTo(self.topView);
        make.width.and.height.equalTo(self.topView).with.priorityLow();
        
        make.center.equalTo(self.topView);
    }];
    
    [self.bottomView addSubview:self.bottomInnerView];
    [self.bottomInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.bottomInnerView.mas_width).multipliedBy(3);
        
        make.width.and.height.lessThanOrEqualTo(self.bottomView);
        make.width.and.height.equalTo(self.bottomView).with.priorityLow();
        
        make.center.equalTo(self.bottomView);
    }];
}
-(void)one
{
    UIView *lastView = self.view;
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self.view addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(5, 10, 15, 20));
        }];
        
        lastView = view;
    }
}

-(void)two{
    UIView *purpleView = UIView.new;
    purpleView.backgroundColor = UIColor.purpleColor;
    purpleView.layer.borderColor = UIColor.blackColor.CGColor;
    purpleView.layer.borderWidth = 2;
    [self.view addSubview:purpleView];
    
    UIView *orangeView = UIView.new;
    orangeView.backgroundColor = UIColor.orangeColor;
    orangeView.layer.borderColor = UIColor.blackColor.CGColor;
    orangeView.layer.borderWidth = 2;
    [self.view addSubview:orangeView];
    
    //example of using constants
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@20);
        make.bottom.equalTo(@-20);
        make.right.equalTo(@-20);
    }];
    
    // auto-boxing macros allow you to simply use scalars and structs, they will be wrapped automatically
    
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.mas_equalTo(CGPointMake(0, 0));//中心与屏幕中心重合
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(-200);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
}


- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
