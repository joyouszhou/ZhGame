//
//  ZhUserHeaderView.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserHeaderView.h"
#import "Masonry.h"
#import "ZhStringUtils.h"
@interface ZhUserHeaderView()

@property (nonatomic, strong)    UIImageView *backgroundImageView;
@property (nonatomic, strong)    UIImageView *headerImageView;
@property (nonatomic, strong)    UILabel     *userNickName;
@property (nonatomic, strong)    UIButton    *loginBtn;
@end

@implementation ZhUserHeaderView


-(void)setInfo:(ZhHeaderModel *)info
{
    _info = info;
    [self setupUI];
}
-(void)setupUI
{
    [self setupBackGroundImgView];
    
    if (self.info.bShowLogin) {
        [self setupLogin];
    }
    else
    {
        if (self.info.header) {
            [self setupHeaderImage];
        }
        if (self.info.UserInfo)
        {
            [self setupUserInfo];
        }
    }
}

-(void)setupBackGroundImgView
{
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back_header"]];
    [self addSubview:self.backgroundImageView];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}

-(void)setupLogin
{
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginBtn addTarget:self action:@selector(dologinClcik) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn setTitle:self.info.UserInfo forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.backgroundImageView.mas_bottom).with.offset(-5);
        make.right.mas_equalTo(self.backgroundImageView.mas_right).with.offset(-10);
        make.size.mas_equalTo([ZhStringUtils sizeForString:self.info.UserInfo withFont:self.loginBtn.titleLabel.font]);
    }];
    
}

-(void)setupHeaderImage
{
    self.headerImageView = [[UIImageView alloc] initWithImage:self.info.header];
    [self addSubview:self.headerImageView];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(60);
        make.right.mas_equalTo(self.backgroundImageView.mas_right).with.offset(-10);
        make.bottom.mas_equalTo(self.backgroundImageView.mas_bottom);
    }];
}

-(void)setupUserInfo
{
    self.userNickName = [[UILabel alloc] init];
    self.userNickName.text = self.info.UserInfo;
    self.userNickName.backgroundColor = [UIColor clearColor];
    self.userNickName.textColor = [UIColor whiteColor];
    self.userNickName.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.userNickName];
    [self.userNickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.headerImageView.mas_left).with.offset(-5);
        make.bottom.mas_equalTo(self.backgroundImageView.mas_bottom).with.offset(-5);
        make.size.mas_equalTo([ZhStringUtils sizeForString:self.info.UserInfo withFont:self.userNickName.font]);
    }];
}

-(void)dologinClcik
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZhUserHeaderShowLogin)]) {
        [self.delegate ZhUserHeaderShowLogin];
    }
}
@end
