//
//  AppDelegate.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "AppDelegate.h"
#import "ZhStartViewController.h"
#import "Zh1ViewController.h"
#import "Zh2ViewController.h"
#import "Zh3ViewController.h"
#import "Zh4ViewController.h"
#import "ZhTabBarController.h"
#import "Zh5TableViewController.h"
#import "ZhRootViewController.h"
#import "MMDrawerController.h"
#import "ZhPublicDef.h"
#import "ZhLoginViewController.h"

@interface AppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //读取本地存储，查看是否有登录成功
    //启动页
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    ZhStartViewController *startVc=[[ZhStartViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:startVc];
    [nav setNavigationBarHidden:YES];
    self.window.rootViewController = nav;
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
