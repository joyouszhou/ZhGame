//
//  AppDelegate.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhTabBarController.h"
#import "MyselfListViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ZhTabBarController * tabBar;
@property (nonatomic, strong) MyselfListViewController *leftVc;

@end

