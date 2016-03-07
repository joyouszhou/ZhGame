//
//  ZhRootViewController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhRootViewController.h"
#import "AppDelegate.h"
#import "MyselfListViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface ZhRootViewController ()
{
    NSArray * _viewControllArr;  // 存放所有视图控制器数组
    NSArray * _titleArr;
}

@end

@implementation ZhRootViewController

-(UIStatusBarStyle)preferredStatusBarStyle{
    if(self.mm_drawerController.showsStatusBarBackgroundView){
        return UIStatusBarStyleLightContent;
    }
    else {
        return UIStatusBarStyleDefault;
    }
    
}
@end
