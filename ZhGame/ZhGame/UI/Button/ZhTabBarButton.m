//
//  ZhTabBarButton.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhTabBarButton.h"
#define BUTTON_TOP_RADIO  0.7




@implementation ZhTabBarButton


+ (instancetype)sharedInstance
{
    return [[self alloc] init];
}


-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.badgeValueLabel = [[UILabel alloc]init];
        self.badgeValueLabel.backgroundColor = [UIColor redColor];
        self.badgeValueLabel.textAlignment = NSTextAlignmentCenter;
        self.badgeValueLabel.font = [UIFont systemFontOfSize:11];
        self.badgeValueLabel.textColor = [UIColor whiteColor];
        self.badgeValueLabel.layer.masksToBounds = YES;
        self.badgeValueLabel.layer.cornerRadius = 6.5;
        [self addSubview:self.badgeValueLabel];
    }
    
    return self;
}
-(void)setBadgeValue:(NSUInteger)badgeValue{
    _badgeValue = badgeValue;
    self.badgeValueLabel.text = [NSString stringWithFormat:@"%lu | 继续",(unsigned long)_badgeValue];
}
- (void)alignmentTop{
    
    // 获得按钮的大小
    CGFloat btnWidth = self.bounds.size.width;
    CGFloat btnHeight = self.bounds.size.height;
    // 获得按钮中UILabel文本的大小
    CGFloat labelWidth = self.titleLabel.bounds.size.width;
    CGFloat labelHeight = self.titleLabel.bounds.size.height;
    // 获得按钮中image图标的大小
    CGFloat imageWidth = self.imageView.bounds.size.width;
    CGFloat imageHeight = self.imageView.bounds.size.height;
    
    /** 没有文字，返回普通按钮 */
    if (self.titleLabel.text == nil) return;
    
    
    /** 设置button上的图片或文字 */
    
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGFloat imageX = (btnWidth - imageWidth) * 0.5;
    self.imageView.frame = CGRectMake(imageX, btnHeight * 0.5 - imageHeight * BUTTON_TOP_RADIO, imageWidth, imageHeight);
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, btnHeight * 0.5 + labelHeight * BUTTON_TOP_RADIO, labelWidth, labelHeight);
    
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
    
    
}

- (CGSize)sizeWithFont:(UIFont *)font string:(NSString *)text
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(self.frame.size.width * 0.35, MAXFLOAT);
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self alignmentTop];
    
    /** 设置badgeValue */
    CGSize size = [self sizeWithFont:[UIFont systemFontOfSize:12] string:self.badgeValueLabel.text];
    
    if (self.badgeValue == 0) {
        self.badgeValueLabel.frame = CGRectMake(self.frame.size.width*0.65, 3, 0, 0);
        return;
    }
    if (size.width < 10) size.width = 10;
    self.badgeValueLabel.frame = CGRectMake(self.frame.size.width*0.65, 3, size.width + 3, 13);
    
}

@end
