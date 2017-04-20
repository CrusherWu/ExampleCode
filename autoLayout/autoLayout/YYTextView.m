//
//  YYTextView.m
//  autoLayout
//
//  Created by 1hhd on 17/4/15.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYTextView.h"
#import "Masonry.h"


@interface YYTextView ()<UITextViewDelegate>
{
    UILabel *_label;
}

@end

@implementation YYTextView

-(instancetype)init
{
    if (self = [super init]) {

        _label = [UILabel new];
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor lightGrayColor];
        _label.contentMode = UIViewContentModeTop;
        [self addSubview:_label];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange:)
                                                    name:UITextViewTextDidChangeNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange:)
                                                    name:UITextViewTextDidBeginEditingNotification
                                                  object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange:)
                                                    name:UITextViewTextDidEndEditingNotification
                                                  object:nil];
 
    }
    return self;
}

-(void)layoutSubviews
{
    UIEdgeInsets padding =  UIEdgeInsetsMake(4, 2, 2, 2);
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat width = self.frame.size.width - padding.left * 2;
        make.width.equalTo(@(width));
        make.right.equalTo(self.mas_right).with.offset(-padding.right);
        make.left.mas_equalTo(padding.left);
        make.top.mas_equalTo(padding.top);
    }];
}

- (void)textDidChange:(NSNotification *)notification
{
    if (self.hasText) {
        _label.hidden = YES;
        return;
    }
    _label.hidden = NO;
}

-(void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
    _label.text = placeHolder;
}



@end
