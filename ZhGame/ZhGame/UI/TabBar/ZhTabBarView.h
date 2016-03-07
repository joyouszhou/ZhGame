//
//  ZhTVViewController.h
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)



#pragma -mark 代理方法
@protocol ZhTVTabBarViewDelegate <NSObject>
-(void)ZhTVtabBarViewSelectedItem:(NSInteger)index;
-(void)ZhTVtabBarViewCenterItemClick:(UIButton *)button;
@end




@interface ZhTabBarView : UIView

@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIImage * backgroundImage;
@property (nonatomic, strong) UIImageView * backgroundImageView;

@property (nonatomic, strong) NSMutableArray * buttonArray;
@property (nonatomic, strong) NSMutableArray * titleLabels;


@property (nonatomic, strong) NSMutableArray * unSelectedImages;
@property (nonatomic, strong) NSMutableArray * selectedImages;
@property (nonatomic, strong) NSMutableArray * titles;
@property (nonatomic, strong) UIButton * centerButton;
@property (nonatomic, assign) NSInteger itemSelectedIndex;
@property (nonatomic, assign) BOOL showCenter;
@property (nonatomic, strong) UIImage * centerImage;
@property (nonatomic, strong) UIColor * textColor;

@property (nonatomic, weak) id<ZhTVTabBarViewDelegate>delegate;

- (id)initWithItemSelectedImages:(NSMutableArray *)selected
                    normalImages:(NSMutableArray *)normal
                          titles:(NSMutableArray *)titles;
-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index;


@end

