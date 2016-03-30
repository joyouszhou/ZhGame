//
//  ZhMainViewManager.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/30.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyselfListViewController.h"
#import "ZhLoginViewController.h"
#import "Zh1ViewController.h"
#import "Zh2ViewController.h"
#import "Zh3ViewController.h"
#import "Zh4ViewController.h"
#import "ZhTabBarController.h"
#import "ZhRootViewController.h"
#import "MMDrawerController.h"
#import "Zh5TableViewController.h"
#import "ZhPublicDef.h"

@interface ZhMainViewManager : NSObject


@property (nonatomic,strong)            MMDrawerController      *drawerController;
@property (nonatomic, strong)           ZhTabBarController      *tabBar;

#pragma mark - 实例化
+(instancetype)shareInstance;

#pragma mark - 显示主页
/**
 *  根据当前信息，判断显示主页还是登录页
 */
-(void)showMainView;

#pragma mark - 显示登录界面
/**
 *  显示登录界面，进行登录和注册
 */
-(void)doShowLoginView;

#pragma mark - 显示tabbar的主界面
/**
 *  显示主界面。主界面上可以不进行登录
 */
-(void)doShowTabbarView;

@end
