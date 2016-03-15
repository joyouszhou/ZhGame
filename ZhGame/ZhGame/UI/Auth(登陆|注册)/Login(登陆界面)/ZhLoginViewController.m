//
//  ZhLoginViewController.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/8.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhLoginViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"
#import "ZhRegisterViewController.h"


@interface ZhLoginViewController ()
@property (nonatomic, strong) UIImageView           *AccountLogo;                   //头像
@property (nonatomic, strong) UITextField           *txtUserId;                     //账号输入框
@property (nonatomic, strong) UITextField           *txtPassword;                   //密码输入框
@property (nonatomic, strong) UIButton              *ShowPasswordBtn;               //显示密码按钮
@property (nonatomic, strong) UIButton              *loginBtn;                      //登陆按钮
@property (nonatomic, strong) UIButton              *forgetPasswordBtn;             //忘记密码按钮
@property (nonatomic, strong) UILabel               *copyrightLabel;                //官网显示
@property (nonatomic, strong) UIView                *lineView;                      //官网显示上边的线
@property (nonatomic, strong) UIButton              *registerBtn;                   //注册按钮
@end

@implementation ZhLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =  [UIColor colorWithRed:221 green:211 blue:254 alpha:0.9];
    
    //设置关闭按钮
    UIBarButtonItem * itemRight = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeMySelf)];
    self.navigationItem.rightBarButtonItem =itemRight;
    self.navigationItem.title = @"登陆";
    
    /**
     *  设置登陆头像
     */
    [self.view addSubview:self.AccountLogo];
    [_AccountLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    /**
     *  设置账号输入框
     */
    [self.view addSubview:self.txtUserId];
    [self.txtUserId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.AccountLogo.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(50);
    }];
    
    /**
     *  设置密码输入框
     */
    [self.view addSubview:self.txtPassword];
    [self.txtPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.txtUserId.mas_bottom);
        make.left.equalTo(self.txtUserId.mas_left);
        make.width.equalTo(self.txtUserId.mas_width);
        make.height.mas_equalTo(self.txtUserId.mas_height);
    }];
    /**
     *  显示密码明文/密文
     */
    [self.view addSubview:self.ShowPasswordBtn];
    [_ShowPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_txtPassword.mas_right);
        make.top.equalTo(_txtPassword.mas_bottom).with.offset(5);
    }];
    /**
     *  登陆按钮
     */
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ShowPasswordBtn.mas_bottom).with.offset(20);
        make.left.equalTo(self.txtPassword.mas_left);
        make.width.equalTo(self.txtPassword.mas_width);
        make.height.mas_equalTo(self.txtPassword.mas_height);
    }];
    /**
     *  忘记密码
     */
    [self.view addSubview:self.forgetPasswordBtn];
    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loginBtn.mas_right);
        make.top.equalTo(self.loginBtn.mas_bottom).with.offset(5);
    }];
    
    /**
     *  公司证书说明
     */
    [self.view addSubview:self.copyrightLabel];
    [self.copyrightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-4);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    /**
     *  分割线
     */
    [self.view addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.copyrightLabel.mas_top).with.offset(-4);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.95);
        make.height.equalTo(@1);
    }];
    /**
     *  注册按钮
     */
    [self.view addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.lineView.mas_top).with.offset(-5);
    }];
}


#pragma mark - 控件
#pragma mark   AccountLogo
/**
 *  Getter 获取登陆头像
 *
 *  @return 返回当前控件的头像
 */
-(UIImageView *)AccountLogo
{
    if (_AccountLogo) {
        return _AccountLogo;
    }
    //设置当前头像，默认是一个圆角的欢
    _AccountLogo = [[UIImageView  alloc] init];
    UIImage * logoImage = [UIImage imageNamed:@"logo"];
    _AccountLogo.image =logoImage;
    _AccountLogo.layer.cornerRadius = 50;
    _AccountLogo.clipsToBounds = YES;
    return _AccountLogo;
}
#pragma mark txtUserId
/**
 *  Getter 获取当前用户名输入框
 *
 *  @return 返回当前用户输入框
 */
-(UITextField *)txtUserId
{
    if (_txtUserId) {
        return _txtUserId;
    }
    //账号输入
   _txtUserId= [[UITextField alloc] init ];
    //输入框右侧，清楚输入内容，显示时机
    [_txtUserId setClearButtonMode:UITextFieldViewModeWhileEditing];
    //输入框键盘类型
    [_txtUserId setKeyboardType:UIKeyboardTypeDefault];
    //自动大写－取消
    [_txtUserId setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //不自动纠错
    [_txtUserId setAutocorrectionType:UITextAutocorrectionTypeNo];
    //字体对齐方式
    [_txtUserId setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    //输入框默认显示
    [_txtUserId setPlaceholder:@"账号"];
    //输入框字体大小
    [_txtUserId setFont:[UIFont systemFontOfSize:15]];
    [_txtUserId setBackgroundColor:[UIColor whiteColor]];
    //输入框边框颜色
    _txtUserId.layer.borderColor = [[UIColor blackColor] CGColor];
    //输入框边框宽度
    _txtUserId.layer.borderWidth = 0.2;
    _txtUserId.layer.cornerRadius =2.0;
    //账号输入框左边的图片
    UIImageView * PasswordView = [[ UIImageView  alloc]initWithImage:[UIImage imageNamed:@"login_regner_phone"]];
    _txtUserId.leftView = PasswordView;//UITextField 的左边view
    //设置左边图片显示时机
    _txtUserId.leftViewMode = UITextFieldViewModeAlways;
    return _txtUserId;
}
#pragma mark txtPassword
/**
 *  Getter   获取密码输入框
 *
 *  @return 返回对象实例
 */
-(UITextField *)txtPassword
{
    if (_txtPassword) {
        return _txtPassword;
    }
    _txtPassword= [[UITextField alloc] init ];
    [_txtPassword setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_txtPassword setKeyboardType:UIKeyboardTypeDefault];
    _txtPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;//不自动大写
    _txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;//不自动纠错
    _txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _txtPassword.returnKeyType =UIReturnKeyDone;
    [_txtPassword setPlaceholder:@"密码"];
    [_txtPassword setSecureTextEntry:YES];
    _txtPassword.font = [UIFont systemFontOfSize:15];
    _txtPassword.backgroundColor = [UIColor whiteColor];
    _txtPassword.layer.cornerRadius = 2.0;
    _txtPassword.layer.borderColor =  [[UIColor blackColor] CGColor];
    _txtPassword.layer.borderWidth = 0.2;
    UIImageView * imageViewPhonecoude = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pd_sdk_dialog_pwd"]];
    [_txtPassword setLeftView:imageViewPhonecoude];
    _txtPassword.leftViewMode=UITextFieldViewModeAlways;
    return _txtPassword;
}
#pragma mark ShowPasswordBtn
/**
 *  Getter  显示密码明文/密文
 *
 *  @return 按钮实例
 */
-(UIButton *)ShowPasswordBtn
{
    if (_ShowPasswordBtn) {
        return _ShowPasswordBtn;
    }
    _ShowPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_ShowPasswordBtn setTitle:@"显示密码" forState:UIControlStateNormal];
    [_ShowPasswordBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    _ShowPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_ShowPasswordBtn addTarget:self action:@selector(doShowPasswordType) forControlEvents:UIControlEventTouchUpInside];
    return _ShowPasswordBtn;
}
#pragma mark loginBtn
/**
 *  Getter  登陆按钮
 *
 *  @return 按钮
 */
-(UIButton *)loginBtn
{
    if (_loginBtn) {
        return _loginBtn;
    }
    //登陆按钮
    _loginBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.layer.cornerRadius =5;
    _loginBtn .backgroundColor = [UIColor blueColor];
    _loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    return _loginBtn;
}

#pragma mark forgetPasswordBtn
/**
 *  Getter  忘记密码按钮
 *
 *  @return 按钮
 */
-(UIButton *)forgetPasswordBtn
{
    if (_forgetPasswordBtn) {
        return _forgetPasswordBtn;
    }
   _forgetPasswordBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [_forgetPasswordBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [_forgetPasswordBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    _forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_forgetPasswordBtn addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    return _forgetPasswordBtn;
}
#pragma mark copyrightLabel
/**
 *  Getter  最下面写公司信息
 *
 *  @return 文字控件
 */
-(UILabel *)copyrightLabel
{
    if (_copyrightLabel) {
        return _copyrightLabel;
    }
    _copyrightLabel = [[UILabel alloc] init];
    _copyrightLabel.text = @"Copyright (C) zhouhuan AllRights Reserved";
    _copyrightLabel.font = [UIFont systemFontOfSize:15];
    _copyrightLabel.textColor = [UIColor grayColor];
    _copyrightLabel.backgroundColor= [UIColor clearColor];
    return _copyrightLabel;
}

#pragma mark lineView
/**
 *  Getter  公司简介上边的分割线
 *
 *  @return 一条线
 */
-(UIView *)lineView
{
    if (_lineView) {
        return _lineView;
    }
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor =  [UIColor grayColor];
    return _lineView;
}
#pragma mark  registerBtn
/**
 *  Getter  注册按钮
 *
 *  @return 注册按钮
 */
-(UIButton *)registerBtn
{
    if (_registerBtn) {
        return _registerBtn;
    }
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    _registerBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_registerBtn addTarget:self action:@selector(registByServer) forControlEvents:UIControlEventTouchUpInside];
    return _registerBtn;
}
//在点击其他位置时，去掉焦点
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtUserId resignFirstResponder];
    [_txtPassword resignFirstResponder];
}
#pragma mark - Event
#pragma mark 显示密码（明文/密文）
/**
 *  显示密码（明文/密文）
 */
-(void)doShowPasswordType
{
    NSLog(@"显示密码");
    BOOL secureType = _txtPassword.isSecureTextEntry;
    if (!secureType) {
        [_ShowPasswordBtn setTitle:@"显示密码" forState:UIControlStateNormal];
    }
    else
    {
        [_ShowPasswordBtn setTitle:@"隐藏密码" forState:UIControlStateNormal];
    }
    _txtPassword.secureTextEntry=!secureType;
}
#pragma mark 关闭当前ui
/**
 *  关闭当前UI，切换到主界面
 */
-(void)closeMySelf
{
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.tabBar showCenterViewController:NO animated:YES];
}
#pragma mark 登陆按钮click
/**
 *  登陆按钮事件
 */
-(void)doLogin
{
    NSLog(@"登陆");
}
#pragma mark 忘记密码click
/**
 *  忘记密码
 */
-(void)forgetPassword
{
    NSLog(@"忘记密码");
}
#pragma mark 注册按钮
/**
 *  注册按钮事件
 */
-(void)registByServer
{
    NSLog(@"注册");
    ZhRegisterViewController *View = [[ZhRegisterViewController alloc] init];
    View.navigationItem.title = @"注册";
    
    View.edgesForExtendedLayout = UIRectEdgeNone;
    View.extendedLayoutIncludesOpaqueBars =NO;
    View.modalPresentationCapturesStatusBarAppearance =NO;
    View.navigationController.navigationBar.translucent =NO;

    [self.navigationController pushViewController:View animated:YES];
    
}


@end
