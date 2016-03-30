//
//  ZhMainViewManager.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/30.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhMainViewManager.h"

@implementation ZhMainViewManager

+(instancetype)shareInstance
{
    static ZhMainViewManager *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZhMainViewManager alloc] init];
    });
    return instance;
}

#pragma mark - 显示主页
/**
 *  根据当前信息，判断显示主页还是登录页
 */
-(void)showMainView
{
    NSString * loginName  = [[NSUserDefaults standardUserDefaults] objectForKey:ZH_LOACL_LOGIN_NICKNAME];
    if (loginName == nil || loginName.length<=0) {
        [self doShowLoginView];
    }
    else
    {
        [self doShowTabbarView];
    }
}

#pragma mark - 显示登录界面
/**
 *  显示登录界面，进行登录和注册
 */
-(void)doShowLoginView
{
    ZhLoginViewController *loginvc = [[ZhLoginViewController alloc] init];
    UINavigationController *nav =  [[UINavigationController alloc] initWithRootViewController:loginvc];
    [[UIApplication sharedApplication].delegate window].rootViewController = nav;
    [[[UIApplication sharedApplication].delegate window] makeKeyAndVisible];
}
#pragma mark - 显示tabbar的主界面
/**
 *  显示主界面。主界面上可以不进行登录
 */
-(void)doShowTabbarView
{
    NSMutableArray * array = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tab_buddy_nor.png"],[UIImage imageNamed:@"tab_me_nor.png"],[UIImage imageNamed:@"tab_qworld_nor.png"],[UIImage imageNamed:@"tab_recent_nor.png"], nil];
    NSMutableArray * selectedArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tab_buddy_press.png"],[UIImage imageNamed:@"tab_me_press.png"],[UIImage imageNamed:@"tab_qworld_press.png"],[UIImage imageNamed:@"tab_recent_press.png"], nil];
    NSMutableArray * titles = [[NSMutableArray alloc]initWithObjects:@"首页",@"消息",@"发现",@"个人", nil];
    
    
    Zh1ViewController * vc1 = [[Zh1ViewController alloc]init];
    Zh2ViewController * vc2 = [[Zh2ViewController alloc]init];
    Zh3ViewController * vc3 = [[Zh3ViewController alloc]init];
    Zh4ViewController * vc4 = [[Zh4ViewController alloc]init];
    MyselfListViewController *vc5 = [[MyselfListViewController alloc] init];
    
    
    ZhRootViewController * navigationController = [[ZhRootViewController alloc]initWithRootViewController:vc1];
    ZhRootViewController * leftSideNavController = [[ZhRootViewController alloc]initWithRootViewController:vc5];
    
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    
    [leftSideNavController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    
    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:navigationController
                             leftDrawerViewController:leftSideNavController
                             rightDrawerViewController:nil];
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningNavigationBar];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
    
    [self.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        //         MMDrawerControllerDrawerVisualStateBlock block;
        //         block = [[MMExampleDrawerVisualStateManager sharedManager]
        //                  drawerVisualStateBlockForDrawerSide:drawerSide];
        //         if(block){
        //             block(drawerController, drawerSide, percentVisible);
        //         }
    }];
    
    
    
    
    self.tabBar = [[ZhTabBarController alloc]initWithTabBarSelectedImages:selectedArray normalImages:array titles:titles];
    self.tabBar.showCenterItem = YES;
    self.tabBar.centerItemImage = [UIImage imageNamed:@"btn_release.png"];
    self.tabBar.viewControllers = @[self.drawerController,nav2,nav3,vc4];
    self.tabBar.textColor = [UIColor redColor];
    [self.tabBar tabBarBadgeValue:500 item:2];
    [self.tabBar tabBarBadgeValue:3 item:1];
    
    self.tabBar.zh_centerViewController = [[Zh5TableViewController alloc] init];
    
    [[UIApplication sharedApplication].delegate window].rootViewController = self.tabBar;
    
    [[[UIApplication sharedApplication].delegate window] makeKeyAndVisible];
}

@end
