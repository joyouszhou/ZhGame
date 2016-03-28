//
//  ZhUserInfoView.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/28.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhMyselfService.h"

#pragma mark - 代理
@protocol ZhLoginDelegate <NSObject>
@optional
#pragma mark - 代理 － 显示登录界面
/**
 *  显示登录
 */
- (void)ZhStartlogin;

@end


@interface ZhUserInfoView : UIView



@property   (nonatomic, strong)             UIImageView*                BackgroundView; //背景图片
@property   (nonatomic, strong)             UIImageView*                headView;       //头像图片
@property   (nonatomic, strong)             UIButton   *                loginNameBtn;   //登录按钮
@property   (nonatomic, strong)             UITextView *                loginNameView;  //用户名称
@property   (nonatomic, strong)             UIButton   *                logoutBtn;      //注销按钮
@property   (nonatomic, strong)             id<ZhLoginDelegate>         delegate;       //代理方法
@property   (nonatomic, strong)             ZhMyselfService*            myinfoService;  //MVVM Service

@end
