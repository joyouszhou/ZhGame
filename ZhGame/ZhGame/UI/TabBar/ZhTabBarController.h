//
//  ZhTabBarController.h
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhTabBarView.h"

#pragma -mark TabBar代理方法
@protocol ZhTabBarControllerDelegate <NSObject>

@optional
-(void)zhTabBarselected:(UIViewController *)viewController;
@end


#pragma -mark TabBar 重写
@interface ZhTabBarController : UITabBarController
<
ZhTVTabBarViewDelegate
>

@property (nonatomic, assign) NSInteger selectedItem;

/** 是否显示中间按钮，默认为NO */
@property (nonatomic, assign) BOOL showCenterItem;

/** 中间按钮的图片 */
@property (nonatomic, strong) UIImage * centerItemImage;

/** 中间按钮控制的试图控制器 */
@property (nonatomic, strong) UIViewController * zh_centerViewController;

/** 文字颜色 */
@property (nonatomic, strong) UIColor * textColor;

@property (nonatomic, weak) id<ZhTabBarControllerDelegate>XMDelegate;

/** TabBarView **/
@property (nonatomic, strong)ZhTabBarView * tabBarView;

/**上次选择**/
@property (nonatomic, assign) NSUInteger lastIndex;
/**
 *  指定item设置badgeValue
 */
-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index;

/**
 *  隐藏或显示TabBar
 */
-(void)xmTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

/**
 *  隐藏或显示中间试图控制器
 */
-(void)showCenterViewController:(BOOL)show animated:(BOOL)animated;

- (id)initWithTabBarSelectedImages:(NSMutableArray *)selected
                      normalImages:(NSMutableArray *)normal
                            titles:(NSMutableArray *)titles;









@end
