//
//  ZhAuthUtilViewController.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/8.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhAuthUtilViewController.h"

@interface ZhAuthUtilViewController ()

@end

@implementation ZhAuthUtilViewController


#pragma mark - 获取头像
/**
 *  获取账号头像
 *
 *  @return 返回头像实例
 */
-(UIImageView *)ZhUserPortraitImageView
{
    _ZhUserPortraitImageView= [[UIImageView  alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIImage * logoImage = [UIImage imageNamed:@"logo"];
    _ZhUserPortraitImageView.image =logoImage;
    _ZhUserPortraitImageView.layer.cornerRadius = _ZhUserPortraitImageView.frame.size.width / 2;
    _ZhUserPortraitImageView.clipsToBounds = YES;
    return _ZhUserPortraitImageView;
}


#pragma mark - 获取账号密码输入框
/**
 *  获取账号密码输入框
 *
 *  @return 返回账号密码输入框实例
 */
-(UITextField *)ZhtxtTextField
{
    
    _ZhtxtTextField = [[UITextField alloc] init ];
    //输入框右侧，清楚输入内容，显示时机
    [_ZhtxtTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    //输入框键盘类型
    [_ZhtxtTextField setKeyboardType:UIKeyboardTypeDefault];
    //自动大写－取消
    [_ZhtxtTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    //不自动纠错
    [_ZhtxtTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    //字体对齐方式
    [_ZhtxtTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    //输入框字体大小
    [_ZhtxtTextField setFont:[UIFont systemFontOfSize:15]];
    [_ZhtxtTextField setBackgroundColor:[UIColor whiteColor]];
    //输入框边框颜色
    _ZhtxtTextField.layer.borderColor = [[UIColor blackColor] CGColor];
    //输入框边框宽度
    _ZhtxtTextField.layer.borderWidth = 0.2;
    //输入框圆角
    _ZhtxtTextField.layer.cornerRadius =2.0;
    return _ZhtxtTextField;
}



#pragma mark - 按钮有边框
/**
 *  获取有边框的按钮
 *
 *  @return 返回按钮实例
 */
-(UIButton *)ZhAuthBtn
{
    
    return _ZhAuthBtn;
}



#pragma mark － 获取没有边框的按钮
/**
 *  获取没有边框的按钮
 *
 *  @return 返回没有边框的按钮
 */
-(UIButton *)ZhAuthEditBtn
{
    _ZhAuthEditBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_ZhAuthEditBtn setFrame:CGRectMake(0, 0, 100, 100)];
    [_ZhAuthEditBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _ZhAuthEditBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    return _ZhAuthEditBtn;
}

@end
