//
//  YYBadgeValue.m
//  YYStaticCell
//
//  Created by 1hhd on 17/4/20.
//  Copyright © 2017年 1hhd. All rights reserved.
//

#import "YYBadgeValue.h"
#import "YYStaticDefineHeader.h"

@implementation YYBadgeValue

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = YYLabelFont(11);
        [self setBackgroundImage:[self resizableImage:[UIImage imageNamed:@""]] forState:UIControlStateNormal];
        self.height = self.currentBackgroundImage.size.height;
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = [badgeValue copy];
    [self setTitle:badgeValue forState:UIControlStateNormal];
    CGSize titleSize = [badgeValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: YYLabelFont(11)} context:nil].size;
    
    CGFloat bgW = self.currentBackgroundImage.size.width;
    if (titleSize.width > bgW) {
        self.width = titleSize.width + 10;
    }else {
        self.width = bgW;
    }
}


- (UIImage *)resizableImage:(UIImage *)image {
    //    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.5, image.size.height * 0.5 + 1, image.size.width * 0.5 + 1) resizingMode:UIImageResizingModeStretch];
}

@end
