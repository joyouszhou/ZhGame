//
//  ZhlabView.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/31.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhlabView.h"
#import "Masonry.h"
@interface ZhlabView()

@property (nonatomic, strong)  UILabel              *headView;
@property (nonatomic, strong)  UILabel              *msgView;

@end

@implementation ZhlabView

-(instancetype)init
{
    self = [super init];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 50;
    [self addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.8);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.2);
        make.left.mas_equalTo(self.mas_left).with.offset(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self addSubview:self.msgView];
    [self.msgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.8);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.6);
        make.right.mas_equalTo(self.mas_right).with.offset(10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    return self;
}

-(UILabel *)headView
{
    if (_headView) {
        return _headView;
    }
    _headView = [[UILabel alloc] init];
    _headView.backgroundColor = [UIColor blueColor];
    return _headView;
}
-(UILabel *)msgView
{
    if (_msgView) {
        return _msgView;
    }
    _msgView = [[UILabel alloc] init];
    _msgView.backgroundColor = [UIColor blueColor];
    return _msgView;
}

@end
