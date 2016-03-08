//
//  ZhAuthUtilViewController.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/8.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhAuthUtilViewController : UIViewController
//账号的头像
@property (nonatomic, strong)UIImageView * ZhUserPortraitImageView;
//账号/密码输入框
@property (nonatomic, strong)UITextField *ZhtxtTextField;
//按钮－没有边框
@property (nonatomic, strong)UIButton * ZhAuthEditBtn;
//按钮－有边框
@property (nonatomic, strong)UIButton *ZhAuthBtn;

@end
