//
//  AppDelegate.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "AppDelegate.h"
#import "Zh1ViewController.h"
#import "Zh2ViewController.h"
#import "Zh3ViewController.h"
#import "Zh4ViewController.h"
#import "ZhTabBarController.h"
#import "Zh5TableViewController.h"
#import "ZhRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSMutableArray * array = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tab_buddy_nor.png"],[UIImage imageNamed:@"tab_me_nor.png"],[UIImage imageNamed:@"tab_qworld_nor.png"],[UIImage imageNamed:@"tab_recent_nor.png"], nil];
    NSMutableArray * selectedArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tab_buddy_press.png"],[UIImage imageNamed:@"tab_me_press.png"],[UIImage imageNamed:@"tab_qworld_press.png"],[UIImage imageNamed:@"tab_recent_press.png"], nil];
    NSMutableArray * titles = [[NSMutableArray alloc]initWithObjects:@"首页",@"消息",@"发现",@"个人", nil];
    
    
    Zh1ViewController * vc1 = [[Zh1ViewController alloc]init];
    Zh2ViewController * vc2 = [[Zh2ViewController alloc]init];
    Zh3ViewController * vc3 = [[Zh3ViewController alloc]init];
    Zh4ViewController * vc4 = [[Zh4ViewController alloc]init];
    ZhRootViewController * nav1 = [[ZhRootViewController alloc]initWithRootViewController:vc1];
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    
    self.leftVc = [[MyselfListViewController alloc]initWithViewController:nav1];
    
    self.tabBar = [[ZhTabBarController alloc]initWithTabBarSelectedImages:selectedArray normalImages:array titles:titles];
    self.tabBar.showCenterItem = YES;
    self.tabBar.centerItemImage = [UIImage imageNamed:@"btn_release.png"];
    self.tabBar.viewControllers = @[_leftVc,nav2,nav3,vc4];
    self.tabBar.textColor = [UIColor redColor];
    [self.tabBar tabBarBadgeValue:500 item:2];
    [self.tabBar tabBarBadgeValue:3 item:1];
    
    self.tabBar.zh_centerViewController = [[Zh5TableViewController alloc] init];
    
    
    
    
    self.window.rootViewController = self.tabBar;
    
    [self.window makeKeyAndVisible];

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
