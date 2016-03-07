//
//  MenuViewController.h
//  DrawerSample
//
//  Created by sYx. on 15/12/14.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kDrawerOffset [UIScreen mainScreen].bounds.size.width / 3 * 2

@interface MenuViewController : UIViewController

// 只读
@property (strong, nonatomic, readonly) UIViewController * mainViewController;

@property (nonatomic, getter=isShowing) BOOL showing;

- (instancetype)initWithViewController:(UIViewController *)vc;

/**
 *  抽屉打开
 */
- (void)drawerShow;

/**
 *  抽屉消失
 */
- (void)drawerHide;

/**
 *  刷新界面
 */
- (void)refreshView;

@end
