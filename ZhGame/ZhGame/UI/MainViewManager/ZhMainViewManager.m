//
//  ZhMainViewManager.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/30.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhMainViewManager.h"
#import "ZhRootViewController.h"
@interface ZhMainViewManager()

@property (nonatomic, strong)   UINavigationController * navFirst;
@property (nonatomic, strong)   UINavigationController * nav2;
@property (nonatomic, strong)   UINavigationController * nav3;
@property (nonatomic, strong)   UINavigationController * navmyself;
@property (nonatomic, strong)   UINavigationController * navtabBar;
@property (nonatomic, strong)   ZhTabBarController      *tabBar;
@end


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

    [[UIApplication sharedApplication].delegate window].rootViewController =self.tabBar;
    
    [[[UIApplication sharedApplication].delegate window] makeKeyAndVisible];
}

-(UINavigationController *)navFirst
{
    if (_navFirst ) {
        return _navFirst;
    }
    Zh1ViewController *vc = [[Zh1ViewController alloc] init];
    _navFirst = [[UINavigationController alloc] initWithRootViewController:vc];
    return _navFirst;
}
-(UINavigationController *)nav2
{
    if (_nav2) {
        return _nav2;
    }
    _nav2 = [[UINavigationController alloc] initWithRootViewController:[[Zh2ViewController alloc] init]];
    return _nav2;
}
-(UINavigationController *)nav3
{
    if (_nav3) {
        return _nav3;
    }
    _nav3 = [[UINavigationController alloc] initWithRootViewController:[[Zh3ViewController alloc] init]];
    return _nav3;
}
-(UINavigationController *)navmyself
{
    if (_navmyself) {
        return _navmyself;
    }
    _navmyself = [[UINavigationController alloc] initWithRootViewController:[[ZhUserCenterViewController alloc] init]];
    
    return _navmyself;
}
-(ZhTabBarController *)tabBar
{
    if (_tabBar) {
        return _tabBar;
    }
    
    NSMutableArray * array = [[NSMutableArray alloc]initWithObjects:
                              [UIImage imageNamed:@"tab_buddy_nor.png"],
                              [UIImage imageNamed:@"tab_me_nor.png"],
                              [UIImage imageNamed:@"tab_qworld_nor.png"],
                              [UIImage imageNamed:@"tab_recent_nor.png"],
                              nil];
    NSMutableArray * selectedArray = [[NSMutableArray alloc]initWithObjects:
                                      [UIImage imageNamed:@"tab_buddy_press.png"],
                                      [UIImage imageNamed:@"tab_me_press.png"],
                                      [UIImage imageNamed:@"tab_qworld_press.png"],
                                      [UIImage imageNamed:@"tab_recent_press.png"],
                                      nil];
    NSMutableArray * titles = [[NSMutableArray alloc]initWithObjects:@"首页",@"消息",@"发现",@"个人", nil];

    _tabBar = [[ZhTabBarController alloc]initWithTabBarSelectedImages:selectedArray normalImages:array titles:titles];
    _tabBar.showCenterItem = NO;
    _tabBar.viewControllers = @[self.navFirst,self.nav2,self.nav3,self.navmyself];
    _tabBar.textColor = [UIColor redColor];
    return _tabBar;
}

@end
