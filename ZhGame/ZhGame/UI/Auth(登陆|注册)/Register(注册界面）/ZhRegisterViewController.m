//
//  ZhRegisterViewController.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/14.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhRegisterViewController.h"
#import "Masonry.h"
#import "ZhStringUtils.h"
#import "AppDelegate.h"

@interface ZhRegisterViewController ()
@property (nonatomic, strong)           UIImageView             *headImageView;                 //头像
@property (nonatomic, strong)  IBOutlet UITextField             *phoneNumTextField;             //手机号数据框
@property (nonatomic, strong)  IBOutlet UITextField             *phoneCodeTextField;            //手机验证码
@property (nonatomic, strong)  IBOutlet UIButton                *getPhoneCodeBtn;               //获取手机验证码按钮
@property (nonatomic, strong)  IBOutlet UITextField             *passwordTextField;             //密码输入框
@property (nonatomic, strong)  IBOutlet UIButton                *registBtn;                     //注册按钮

@property (nonatomic)          BOOL                             bPhoneNum;                      //手机号是否可以
@property (nonatomic)          BOOL                             bPhoneCode;                     //手机验证码是否可以
@property (nonatomic)          BOOL                             bPassword;                      //密码是否可以

@end

@implementation ZhRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor colorWithRed:221 green:211 blue:254 alpha:0.9];
    
    [self.view layoutIfNeeded];
    

    [self.view addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).with.offset(10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
    /**
     *  手机号输入框
     */
    [self.view addSubview:self.phoneNumTextField];
    [self.phoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headImageView.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(40);
    }];
    [self.phoneNumTextField addTarget:self action:@selector(usernameTextFieldChanged) forControlEvents:UIControlEventEditingChanged];
    
    /**
     *  手机验证码输入框
     */
    [self.view addSubview:self.phoneCodeTextField];
    [self.phoneCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneNumTextField.mas_bottom).with.offset(10);
        make.width.mas_equalTo(self.phoneNumTextField.mas_width).multipliedBy(0.5);
        make.left.mas_equalTo(self.phoneNumTextField.mas_left);
        make.height.mas_equalTo(self.phoneNumTextField.mas_height);
    }];
    [self.phoneCodeTextField addTarget:self action:@selector(codeTextFieldChanged) forControlEvents:UIControlEventEditingChanged];
    
    /**
     *  获取手机验证码接口
     */
    [self.view addSubview:self.getPhoneCodeBtn];
    [self.getPhoneCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneCodeTextField.mas_top);
        make.left.mas_equalTo(self.phoneCodeTextField.mas_right).with.offset(10);
        make.right.mas_equalTo(self.phoneNumTextField.mas_right);
        make.height.mas_equalTo(self.phoneCodeTextField.mas_height);
    }];
    
    /**
     *  密码输入框
     */
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneCodeTextField.mas_bottom).with.offset(10);
        make.width.mas_equalTo(self.phoneNumTextField.mas_width);
        make.centerX.mas_equalTo(self.phoneNumTextField.mas_centerX);
        make.height.mas_equalTo(self.phoneNumTextField.mas_height);
    }];
    [self.passwordTextField addTarget:self action:@selector(passwordTextFieldChanged) forControlEvents:UIControlEventEditingChanged];
    
    /**
     *  注册按钮
     */
    [self.view addSubview:self.registBtn];
    [self.registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).with.offset(15);
        make.right.mas_equalTo(self.passwordTextField.mas_right);
        make.left.mas_equalTo(self.passwordTextField.mas_left);
        make.height.mas_equalTo(self.passwordTextField.mas_height);
    }];
    [self UpdateUI];
    self.RegisterService  = [[ZhRegisterService alloc] init];
}

#pragma mark - 更新按钮状态
/**
 *  根据输入框的内容进行更新UI状态
 */
-(void)UpdateUI
{
    if (self.bPhoneNum) {
        self.getPhoneCodeBtn.enabled = YES;
        self.getPhoneCodeBtn.backgroundColor = [UIColor blueColor];
    }
    else{
        self.getPhoneCodeBtn.enabled = NO;
        self.getPhoneCodeBtn.backgroundColor = [UIColor grayColor];
    }
    if (self.bPhoneCode&& self.bPhoneNum&&self.bPassword) {
        self.registBtn.enabled = YES;
        self.registBtn.backgroundColor = [UIColor blueColor];
    }
    else
    {
        self.registBtn.enabled = NO;
        self.registBtn.backgroundColor = [UIColor grayColor];
    }
}

#pragma mark - Getter
#pragma mark  headImageView
-(UIImageView *)headImageView
{
    if (_headImageView) {
        return _headImageView;
    }
    _headImageView = [[UIImageView  alloc] init];
    UIImage * logoImage = [UIImage imageNamed:@"logo"];
    _headImageView.image =logoImage;
    _headImageView.layer.cornerRadius = 40;
    _headImageView.clipsToBounds = YES;
    _headImageView.userInteractionEnabled = YES;
    [_headImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnLoadHeadImage:)]];
    return _headImageView;
}

#pragma mark phoneNumTextField
/**
 *  Getter  手机号编辑框
 *
 *  @return 内部变量 phoneNumTextField
 */
-(UITextField *)phoneNumTextField
{
    if (_phoneNumTextField) {
        return _phoneNumTextField;
    }
    _phoneNumTextField= [[UITextField alloc] init ];
    //输入框右侧，清楚输入内容，显示时机
    [_phoneNumTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    //输入框键盘类型
    [_phoneNumTextField setKeyboardType:UIKeyboardTypeDefault];
    //自动大写－取消
    [_phoneNumTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //不自动纠错
    [_phoneNumTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    //字体对齐方式
    [_phoneNumTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    //输入框默认显示
    [_phoneNumTextField setPlaceholder:@"账号"];
    //输入框字体大小
    [_phoneNumTextField setDelegate:self];
    [_phoneNumTextField setFont:[UIFont systemFontOfSize:15]];
    [_phoneNumTextField setBackgroundColor:[UIColor whiteColor]];
    //输入框边框颜色
    _phoneNumTextField.layer.borderColor = [[UIColor blackColor] CGColor];
    //输入框边框宽度
    _phoneNumTextField.layer.borderWidth = 0.2;
    _phoneNumTextField.layer.cornerRadius =2.0;
    //账号输入框左边的图片
    UIImageView * leftImageView = [[ UIImageView  alloc]initWithImage:[UIImage imageNamed:@"login_regner_phone"]];
    _phoneNumTextField.leftView = leftImageView;//UITextField 的左边view
    //设置左边图片显示时机
    _phoneNumTextField.leftViewMode = UITextFieldViewModeAlways;
    return _phoneNumTextField;
}
#pragma mark phoneCodeTextField
/**
 *  Getter  手机验证码输入框
 *
 *  @return 手机验证码输入框
 */
-(UITextField *)phoneCodeTextField
{
    if (_phoneCodeTextField) {
        return _phoneCodeTextField;
    }
    _phoneCodeTextField= [[UITextField alloc] init ];
    //输入框右侧，清楚输入内容，显示时机
    [_phoneCodeTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    //输入框键盘类型
    [_phoneCodeTextField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    //自动大写－取消
    [_phoneCodeTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //不自动纠错
    [_phoneCodeTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    //字体对齐方式
    [_phoneCodeTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    //输入框默认显示
    [_phoneCodeTextField setPlaceholder:@"验证码"];
    //输入框字体大小
    [_phoneCodeTextField setFont:[UIFont systemFontOfSize:15]];
    [_phoneCodeTextField setBackgroundColor:[UIColor whiteColor]];
    [_phoneCodeTextField setDelegate:self];
    //输入框边框颜色
    _phoneCodeTextField.layer.borderColor = [[UIColor blackColor] CGColor];
    //输入框边框宽度
    _phoneCodeTextField.layer.borderWidth = 0.2;
    _phoneCodeTextField.layer.cornerRadius =2.0;
    //账号输入框左边的图片
    UIImageView * leftImageView = [[ UIImageView  alloc]initWithImage:[UIImage imageNamed:@"login_regner_phone"]];
    _phoneCodeTextField.leftView = leftImageView;//UITextField 的左边view
    //设置左边图片显示时机
    _phoneCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    return _phoneCodeTextField;
}
#pragma mark getPhoneCodeBtn
/**
 *  Getter  获取手机验证码接口
 *
 *  @return 按钮
 */
-(UIButton *)getPhoneCodeBtn
{
    if (_getPhoneCodeBtn) {
        return _getPhoneCodeBtn;
    }
    _getPhoneCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _getPhoneCodeBtn.layer.cornerRadius =5;
    _getPhoneCodeBtn .backgroundColor = [UIColor blueColor];
    _getPhoneCodeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [_getPhoneCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getPhoneCodeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_getPhoneCodeBtn addTarget:self action:@selector(getphonecode:) forControlEvents:UIControlEventTouchUpInside];

    return _getPhoneCodeBtn;
}

#pragma mark passwordTextField
/**
 *  Getter  密码输入框
 *
 *  @return 密码输入框
 */
-(UITextField *)passwordTextField
{
    if (_passwordTextField) {
        return _passwordTextField;
    }
    _passwordTextField= [[UITextField alloc] init ];
    [_passwordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [_passwordTextField setKeyboardType:UIKeyboardTypeDefault];
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;//不自动大写
    _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;//不自动纠错
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passwordTextField.returnKeyType =UIReturnKeyDone;
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.layer.cornerRadius = 2.0;
    [_passwordTextField setPlaceholder:@"密码"];
    [_passwordTextField setSecureTextEntry:YES];
    _passwordTextField.font = [UIFont systemFontOfSize:15];
    [_passwordTextField setDelegate:self];
    _passwordTextField.layer.borderColor = [[UIColor blackColor] CGColor];
    _passwordTextField.layer.borderWidth = 0.2;
    UIImageView * PasswordView = [[ UIImageView  alloc]initWithImage:[UIImage imageNamed:@"pd_sdk_dialog_pwd.png"]];
    _passwordTextField.leftView = PasswordView;//UITextField 的左边view
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    

    return _passwordTextField;
}

#pragma mark registBtn
/**
 *  Getter  注册按钮
 *
 *  @return 返回注册按钮
 */
-(UIButton *)registBtn
{
    if (_registBtn) {
        return _registBtn;
    }
    _registBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    _registBtn.layer.cornerRadius =5;
    _registBtn .backgroundColor = [UIColor blueColor];
    _registBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registBtn addTarget:self action:@selector(doRegist:) forControlEvents:UIControlEventTouchUpInside];
    return _registBtn;
}

#pragma mark - Event 
#pragma mark 获取验证码按钮 click
/**
 *  获取手机验证码 click事件
 */
-(void)getphonecode:(id)sender
{
    self.getPhoneCodeBtn.enabled = NO;
    [self.RegisterService ZhRegisterGetPhoneCodeWithPhoneNum:[self.phoneNumTextField text] complete:^(BOOL bFinish) {
        if (bFinish) {
            self.getPhoneCodeBtn.enabled = YES;
            [self startTime];
        };
    }];
    NSLog(@"获取验证码");
}
#pragma mark 注册按钮Click  
/**
 *  注册按钮click事件
 *
 *  @param sender 发送者
 */
-(void)doRegist:(id)sender
{
    NSLog(@"注册");
    [self.registBtn setEnabled:NO];
    [self.registBtn setBackgroundColor:[UIColor purpleColor]];
    [self.RegisterService ZhRegisterCodeWithPhoneNum:[self.phoneNumTextField text] andPassword:[self.passwordTextField text] complete:^(BOOL bFinish) {
        NSLog(@"注册回调完成");
        [self.registBtn setEnabled:YES];
        [self.registBtn setBackgroundColor:[UIColor blueColor]];
        self.getPhoneCodeBtn.enabled = YES;
        if (bFinish) {
            [self closeMySelf];
        };
    }];
}

#pragma mark - UIActionSheet 的监听事件
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"用户点击的是第%ld个按钮",(long)buttonIndex);
    switch (buttonIndex) {
        case 0:
            //照一张
        {
            UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [imgPicker setDelegate:self];
            [imgPicker setAllowsEditing:YES];
            [self.navigationController presentViewController:imgPicker animated:YES completion:^{
            }];
            
            
            
        }
            break;
        case 1:
            //搞一张
        {
            UIImagePickerController *imgPicker=[[UIImagePickerController alloc]init];
            [imgPicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [imgPicker setDelegate:self];
            [imgPicker setAllowsEditing:YES];
            [self.navigationController presentViewController:imgPicker animated:YES completion:^{
            }];
            
            
            
            break;
        }
        default:
            break;
    }
    
    
}
#pragma mark ----------图片选择完成-------------
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage  * userHeadImage=[info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
        CATransition *trans=[CATransition animation];
        [trans setDuration:0.25f];
        [trans setType:@"flip"];
        [trans setSubtype:kCATransitionFromLeft];
        [self.headImageView.layer addAnimation:trans forKey:nil];
        
        [self.headImageView setImage:userHeadImage];
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

#pragma mark 监听Event
/**
 *  点击更换照片
 *
 *  @param imaget 照片
 */
-(void)btnLoadHeadImage:(UIImageView*)imaget
{
    //打开本地相册
    UIActionSheet *as=[[UIActionSheet alloc]initWithTitle:@"上传头像" delegate:self
                                        cancelButtonTitle:@"取消"
                                   destructiveButtonTitle:@"马上照一张"
                                        otherButtonTitles:@"从相册中搞一张",
                       nil ];
    [as showInView:self.view];
}
/**
 *  监听 用户输入框变化
 */
-(void)usernameTextFieldChanged
{
    if ([ZhStringUtils isPhone:[self.phoneNumTextField text]]) {
        self.bPhoneNum = true;
    }
    else{
        self.bPhoneNum = NO;
    }
    [self UpdateUI];

}
-(void)codeTextFieldChanged
{
    if ([ZhStringUtils isPhoneCode:[self.phoneCodeTextField text]]) {
        self.bPhoneCode = true;
    }
    else
    {
        self.bPhoneCode = NO;
    }
    [self UpdateUI];
}

-(void)passwordTextFieldChanged
{
    NSString * password = [self.passwordTextField text];
    if (password == nil|| password.length<6) {
        self.bPassword = NO;
    }
    else{
        self.bPassword = YES;
    }
    [self UpdateUI];
}

#pragma mark - 定义获取验证的按钮
static int timeout_int=59;
-(void)startTime{
    // 【填写验证码页】点击【重新获取】按钮
    timeout_int=59;
    //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout_int<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.getPhoneCodeBtn.userInteractionEnabled = YES;
                [self.getPhoneCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            });
        }else{
            //            int minutes = timeout_int / 60;
            int seconds = timeout_int % 61;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                self.getPhoneCodeBtn.userInteractionEnabled = NO;
                [self.getPhoneCodeBtn setTitle:[NSString stringWithFormat:@"%@%ds",@"重新获取验证码",seconds] forState:UIControlStateNormal];
            });
            timeout_int--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark - 设置输入框，失去焦点后关闭键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phoneCodeTextField resignFirstResponder];
    [self.phoneNumTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
-(void)closeMySelf
{
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.tabBar showCenterViewController:NO animated:YES];
}
@end
