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
@interface ZhLoginViewController ()
@property (nonatomic, strong) UIImageView *AccountLogo;
@property (nonatomic, strong) UITextField *txtUserId;
@property (nonatomic, strong) UITextField *txtPassword;
@property (nonatomic, strong) UIButton    *isShowPasswordBtn;
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
    
    
    
    //设置注册的头像
    [self.view addSubview:self.AccountLogo];
    
    //设置账号输入框
    [self.view addSubview:self.txtUserId];
    
    //显示密码
    UITextField *txtPassword = [[UITextField alloc] init ];
    [txtPassword setClearButtonMode:UITextFieldViewModeWhileEditing];
    [txtPassword setKeyboardType:UIKeyboardTypeDefault];
    txtPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;//不自动大写
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;//不自动纠错
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassword.returnKeyType =UIReturnKeyDone;
    [txtPassword setPlaceholder:@"密码"];
    [txtPassword setSecureTextEntry:YES];
    txtPassword.font = [UIFont systemFontOfSize:15];
    txtPassword.backgroundColor = [UIColor whiteColor];
    txtPassword.layer.cornerRadius = 2.0;
    txtPassword.layer.borderColor =  [[UIColor blackColor] CGColor];
    txtPassword.layer.borderWidth = 0.2;
    UIImageView * imageViewPhonecoude = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pd_sdk_dialog_pwd"]];
    [txtPassword setLeftView:imageViewPhonecoude];
    txtPassword.leftViewMode=UITextFieldViewModeAlways;
   	[self.view addSubview:txtPassword];
    _txtPassword = txtPassword;
    [txtPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_txtUserId.mas_bottom);
        make.left.equalTo(_txtUserId.mas_left);
        make.width.equalTo(_txtUserId.mas_width);
        make.height.mas_equalTo(_txtUserId.mas_height);
    }];

    
    UIButton *showPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [showPassword setTitle:@"显示密码" forState:UIControlStateNormal];
    [showPassword setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    showPassword.titleLabel.font = [UIFont systemFontOfSize:15];
    [showPassword addTarget:self action:@selector(showPassword) forControlEvents:UIControlEventTouchUpInside];
    _isShowPasswordBtn = showPassword;
    [showPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_txtPassword.mas_right);
        make.top.equalTo(_txtPassword.mas_bottom).with.offset(5);
    }];
    
    //登陆按钮
    UIButton *loginBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.layer.cornerRadius =5;
    loginBtn .backgroundColor = [UIColor blueColor];
    loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(showPassword.mas_bottom).with.offset(20);
        make.left.equalTo(txtPassword.mas_left);
        make.width.equalTo(txtPassword.mas_width);
        make.height.mas_equalTo(txtPassword.mas_height);
    }];
    
    UIButton *forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPassword setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    forgetPassword.titleLabel.font = [UIFont systemFontOfSize:15];
    [forgetPassword addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPassword];
    
    [forgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(loginBtn.mas_right);
        make.top.equalTo(loginBtn.mas_bottom).with.offset(5);
    }];
    //在界面最下面写一个coypright
    UILabel* titleL = [[UILabel alloc] init];
    titleL.text = @"Copyright (C) zhouhuan AllRights Reserved";
    titleL.font = [UIFont systemFontOfSize:15];
    titleL.textColor = [UIColor grayColor];
    titleL.backgroundColor= [UIColor clearColor];
    [self.view addSubview:titleL];
    
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-4);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    //画条线
    UIView *labline = [[UIView alloc] init];
    labline.backgroundColor =  [UIColor grayColor];
    [self.view addSubview:labline];
    [labline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(titleL.mas_top).with.offset(-4);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.95);
        make.height.equalTo(@1);
    }];
    //注册
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [registerBtn addTarget:self action:@selector(registByServer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(labline.mas_top).with.offset(-5);
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)closeMySelf
{
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.tabBar showCenterViewController:NO animated:YES];
}
-(void)doLogin
{
    NSLog(@"登陆");
}
-(void)showPassword
{
    NSLog(@"显示密码");
    BOOL secureType = _txtPassword.isSecureTextEntry;
    if (!secureType) {
        [_isShowPasswordBtn setTitle:@"显示密码" forState:UIControlStateNormal];
    }
    else
    {
        [_isShowPasswordBtn setTitle:@"隐藏密码" forState:UIControlStateNormal];
    }
    _txtPassword.secureTextEntry=!secureType;
}
-(void)forgetPassword
{
    NSLog(@"忘记密码");
}
-(void)registByServer
{
    NSLog(@"注册");
}

#pragma mark - Getter
#pragma mark 头像Getter
-(UIImageView *)AccountLogo
{
    if (_AccountLogo) {
        return _AccountLogo;
    }
    //设置当前头像，默认是一个圆角的欢
    UIImageView *authLogo = [[UIImageView  alloc] init];
    UIImage * logoImage = [UIImage imageNamed:@"logo"];
    authLogo.image =logoImage;
    authLogo.layer.cornerRadius = 50;
    authLogo.clipsToBounds = YES;
    [self.view addSubview:authLogo];
    [authLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    _AccountLogo = authLogo;
    return _AccountLogo;
}
#pragma mark 账号
-(UITextField *)txtUserId
{
    if (_txtUserId) {
        return _txtUserId;
    }
    //账号输入
    UITextField *txtUser = [[UITextField alloc] init ];
    //输入框右侧，清楚输入内容，显示时机
    [txtUser setClearButtonMode:UITextFieldViewModeWhileEditing];
    //输入框键盘类型
    [txtUser setKeyboardType:UIKeyboardTypeDefault];
    //自动大写－取消
    [txtUser setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //不自动纠错
    [txtUser setAutocorrectionType:UITextAutocorrectionTypeNo];
    //字体对齐方式
    [txtUser setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    //输入框默认显示
    [txtUser setPlaceholder:@"账号"];
    //输入框字体大小
    [txtUser setFont:[UIFont systemFontOfSize:15]];
    [txtUser setBackgroundColor:[UIColor whiteColor]];
    //输入框边框颜色
    txtUser.layer.borderColor = [[UIColor blackColor] CGColor];
    //输入框边框宽度
    txtUser.layer.borderWidth = 0.2;
    
    txtUser.layer.cornerRadius =2.0;
    //账号输入框左边的图片
    UIImageView * PasswordView = [[ UIImageView  alloc]initWithImage:[UIImage imageNamed:@"login_regner_phone"]];
    txtUser.leftView = PasswordView;//UITextField 的左边view
    txtUser.leftViewMode = UITextFieldViewModeAlways;
    //设置左边图片显示时机
    _txtUserId = txtUser;
    [txtUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_AccountLogo.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(50);
    }];
    return _txtUserId;
}



#pragma mark 显示密码
-(UIButton *)isShowPasswordBtn
{
    UIButton *showPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    [showPassword setTitle:@"显示密码" forState:UIControlStateNormal];
    [showPassword setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    showPassword.titleLabel.font = [UIFont systemFontOfSize:15];
    [showPassword addTarget:self action:@selector(showPassword) forControlEvents:UIControlEventTouchUpInside];
    _isShowPasswordBtn = showPassword;
    [showPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_txtPassword.mas_right);
        make.top.equalTo(_txtPassword.mas_bottom).with.offset(5);
    }];
    return _isShowPasswordBtn;
}

//在点击其他位置时，去掉焦点
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_txtUserId resignFirstResponder];
    [_txtPassword resignFirstResponder];
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
