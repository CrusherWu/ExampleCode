//
//  YYStaticTableViewCellTableViewCell.m
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYStaticTableViewCell.h"
#import "YYBadgeValue.h"
#import "YYStaticDefineHeader.h"
#import "YYCommonArrowItem.h"
#import "YYCommonLabel.h"
#import "YYCommonSwitchItem.h"

@interface YYStaticTableViewCell ()

@property (nonatomic ,strong) UIImageView *rightArrow;

@property (nonatomic ,strong) UISwitch *rightSwitch;

@property (nonatomic ,strong) UILabel *rightLabel;

@property (nonatomic ,strong) YYBadgeValue *badgeView;

@end

@implementation YYStaticTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.detailTextLabel.x = CGRectGetMinX(self.accessoryView.frame) - self.detailTextLabel.width - 8;
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.textLabel.font         = [UIFont systemFontOfSize:15];
        self.detailTextLabel.font   = [UIFont systemFontOfSize:12];
        self.backgroundColor        = [UIColor whiteColor];
        self.selectedBackgroundView = [[UIImageView alloc] init];
        
        
    }
    
    return self;
    
}

- (YYBadgeValue *)badgeView {
    
    if (!_badgeView) {
        _badgeView = [[YYBadgeValue alloc] init];
    }
    
    return _badgeView;
}



- (UIImageView *)rightArrow {
    
    if (nil == _rightArrow) {
        _rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
        _rightArrow.size = CGSizeMake(self.height/4, self.height/2.5);
    }
    return _rightArrow;
    
}

- (UISwitch *)rightSwitch {
    
    if (nil == _rightSwitch) {
        _rightSwitch = [[UISwitch alloc] init];
        [_rightSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _rightSwitch;
}

- (void)valueChanged:(UISwitch *)rightSwitch {
    
    YYCommonSwitchItem *item = (YYCommonSwitchItem *)self.item;
    
    if (item.valueChange) {
        
        if (rightSwitch.isOn) {
            item.valueChange(YES);
        } else {
            item.valueChange(NO);
        }
    }
}


- (UILabel *)rightLabel {
    
    if (nil == _rightLabel) {
        _rightLabel               = [[UILabel alloc] init];
        _rightLabel.textColor     = [UIColor lightGrayColor];
        _rightLabel.numberOfLines = 0;
        _rightLabel.font          = YYLabelFont(12);
    }
    
    return _rightLabel;
    
}

- (void)setItem:(YYStaticItem *)item {
    
    _item = item;
    
    self.textLabel.text       = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    if (item.icon) {
        self.imageView.image  = [UIImage imageNamed:item.icon];
    }
    
    if (item.badgeValue) {
        
        self.badgeView.badgeValue = item.badgeValue;
        self.accessoryView = self.badgeView;
    } else if ([item isKindOfClass:[YYCommonArrowItem class]]) {
        
        self.accessoryView = self.rightArrow;
    } else if ([item isKindOfClass:[YYCommonSwitchItem class]]) {
        
        self.accessoryView = self.rightSwitch;
    } else if ([item isKindOfClass:[YYCommonLabel class]]) {
        
        YYCommonLabel *labelItem = (YYCommonLabel *)item;
        self.rightLabel.size     = [labelItem.text boundingRectWithSize:CGSizeMake(200, MAXFLOAT)
                                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                             attributes:@{
                                                                          NSFontAttributeName:YYLabelFont(12)}
                                                                context:nil].size;
        self.rightLabel.text     = labelItem.text;
        self.accessoryView       = self.rightLabel;
    }
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    [super setFrame:frame];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected == YES && [_item isKindOfClass:[YYCommonLabel class]]) {

        YYCommonLabel *item = (id)_item;
        if (item.block) {
            item.block();
        }
    }
    
}

@end
