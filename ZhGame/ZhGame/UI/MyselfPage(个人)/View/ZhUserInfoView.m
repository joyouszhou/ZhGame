//
//  ZhUserInfoView.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/28.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserInfoView.h"
#import "Masonry.h"
#import "Zh1ViewController.h"
#import "ZhRootViewController.h"
#import "ZhLoginViewController.h"
#import "MMDrawerController.h"
#import "UIViewController+MMDrawerController.h"
@implementation ZhUserInfoView

-(void)drawRect:(CGRect)rect
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.BackgroundView];
    [self.BackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height);
        make.left.mas_equalTo(self.mas_left);
        make.top.mas_equalTo(self.mas_top);
    }];
    
    /**
     *  添加头像图片
     */
    [self addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).with.offset(20);
        make.left.mas_equalTo(self.mas_left).with.offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    /**
     *  登录｜注册按钮
     */
    [self addSubview:self.loginNameBtn];
    [self.loginNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView.mas_top).with.offset(10);
        make.left.mas_equalTo(self.headView.mas_right).with.offset(5);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.6);
        make.height.mas_equalTo(30);
    }];
    /**
     *  登录成功后的帐号名字
     */
    [self addSubview:self.loginNameView];
    [self.loginNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginNameBtn.mas_top);
        make.left.mas_equalTo(self.loginNameBtn);
        make.width.mas_equalTo(self.loginNameBtn);
        make.height.mas_equalTo(self.loginNameBtn);
    }];
    /**
     *  等出按钮
     */
    [self addSubview:self.logoutBtn];
    [self.logoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginNameBtn.mas_bottom).with.offset(2);
        make.left.mas_equalTo(self.loginNameBtn.mas_left);
        make.width.mas_equalTo(self.loginNameBtn.mas_width);
        make.height.mas_equalTo(self.loginNameBtn.mas_height);
    }];
    
    [self.myinfoService ZhGetLoginStats:^(BOOL isLogin, NSString *title) {
        if (!isLogin) {
            self.loginNameView.hidden = YES;
            self.loginNameBtn.hidden = NO;
            self.logoutBtn.hidden = YES;
            [self.loginNameBtn setTitle:title forState:UIControlStateNormal];
        }
        else
        {
            self.loginNameBtn.hidden = YES;
            self.logoutBtn.hidden = NO;
            self.loginNameView.hidden =NO;
            [self.loginNameView setText:title];
        }
    }];
}
#pragma mark - 背景图片 Getter
/**
 *  背景图片
 *
 *  @return BackgroundView
 */
-(UIImageView *)BackgroundView
{
    if (_BackgroundView) {
        return _BackgroundView;
    }
    self.BackgroundView = [[UIImageView alloc] init];
    self.BackgroundView.image = [UIImage imageNamed:@"back_user_info"];
    return self.BackgroundView;
}
#pragma mark- 头像
/**
 *  头像
 *
 *  @return headView
 */
-(UIImageView *)headView
{
    if (_headView) {
        return _headView;
    }
    _headView = [[UIImageView alloc] init];
    _headView.image = [UIImage imageNamed:@"logo"];
    _headView.layer.cornerRadius = 40;
    
    return _headView;
}
#pragma mark - 登录用户 Getter
/**
 *  登录用户
 *
 *  @return loginNameBtn
 */
-(UIButton *)loginNameBtn
{
    if (_loginNameBtn) {
        return _loginNameBtn;
    }
    _loginNameBtn = [[UIButton alloc] init];
    [_loginNameBtn setTitle:@"登录 | 注册" forState:UIControlStateNormal];
    [_loginNameBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_loginNameBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [_loginNameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loginNameBtn addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return _loginNameBtn;
}
#pragma mark - 登录用户名(文字)
/**
 *  登录用户名，只是文字
 *
 *  @return loginNameView
 */
-(UITextView *)loginNameView
{
    if (_loginNameView) {
        return _loginNameView;
    }
    _loginNameView  = [[UITextView alloc] init];
    [_loginNameView setFont:[UIFont fontWithName:@"Arial" size:18]];
    _loginNameView.editable = NO;
    return _loginNameView;
}
#pragma mark - 获取个人信息服务
/**
 *  获取个人信息服务
 *
 *  @return 返回服务的信息
 */
-(ZhMyselfService *)myinfoService
{
    if (_myinfoService) {
        return _myinfoService;
    }
    _myinfoService = [[ZhMyselfService alloc] init];
    return _myinfoService;
}
-(UIButton *)logoutBtn
{
    if (_logoutBtn) {
        return _logoutBtn;
    }
    _logoutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
    [_logoutBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_logoutBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [_logoutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_logoutBtn addTarget:self action:@selector(logouButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    return _logoutBtn;
}
#pragma mark - loginBtn click
/**
 *  登录按钮事件
 *
 *  @param button button
 */
- (void)loginButtonAction:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(ZhStartlogin)]) {
        [_delegate ZhStartlogin];
    };
}
-(void)logouButtonAction:(UIButton*)button
{
    self.loginNameBtn.hidden = NO;
    self.logoutBtn.hidden = YES;
    self.loginNameView.hidden =YES;
    [self.loginNameBtn setTitle:@"登录|注册" forState:UIControlStateNormal];
}
@end
