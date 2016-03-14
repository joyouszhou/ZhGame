//
//  ZhRegisterViewController.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/14.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhRegisterViewController.h"
#import "Masonry.h"

@interface ZhRegisterViewController ()
@property (nonatomic, strong)   UITextField             *phoneNumTextField;             //手机号数据框

@end

@implementation ZhRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor colorWithRed:221 green:211 blue:254 alpha:0.9];

    
    [self.view addSubview:self.phoneNumTextField];
    [self.phoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(100);
    }];
    
    
}


#pragma mark - Getter
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

@end
