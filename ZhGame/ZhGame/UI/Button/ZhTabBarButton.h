//
//  ZhTabBarButton.h
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhTabBarButton : UIButton

@property (nonatomic, strong) UILabel * badgeValueLabel;
@property (nonatomic, assign) NSUInteger badgeValue;

+ (instancetype)sharedInstance;

@end
