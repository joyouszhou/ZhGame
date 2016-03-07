//
//  ZhTabBarController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhTabBarController.h"

@interface ZhTabBarController ()

@end

@implementation ZhTabBarController

#pragma -mark 初始化代理方法

- (id)initWithTabBarSelectedImages:(NSMutableArray *)selected
                      normalImages:(NSMutableArray *)normal
                            titles:(NSMutableArray *)titles{
    if ([super init]) {
        
        self.tabBarView = [[ZhTabBarView alloc]initWithItemSelectedImages:selected normalImages:normal titles:titles];
        self.tabBarView.backgroundColor = [UIColor whiteColor];
        self.tabBarView.delegate = self;
        [self.view addSubview:self.tabBarView];
        self.tabBarView.itemSelectedIndex = 0;
        
    }
    return self;
}

-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index{
    [self.tabBarView tabBarBadgeValue:value item:index];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar removeFromSuperview];
}


#pragma mark - 初始化数据
-(void)setShowCenterItem:(BOOL)showCenterItem{
    _showCenterItem = showCenterItem;
    self.tabBarView.showCenter = _showCenterItem;
}
-(void)setCenterItemImage:(UIImage *)centerItemImage{
    _centerItemImage = centerItemImage;
    self.tabBarView.centerImage = centerItemImage;
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.tabBarView.textColor = _textColor;
}

-(void)setSelectedItem:(NSInteger)selectedItem{
    _selectedItem = selectedItem;
    self.selectedIndex = _selectedItem;
    self.tabBarView.itemSelectedIndex = _selectedItem;
}

-(void)setcenterViewController:(UIViewController *)zh_centerViewController{
    _zh_centerViewController = zh_centerViewController;
}

#pragma mark - 共有方法
-(void)showCenterViewController:(BOOL)show animated:(BOOL)animated{
    
    if (show) {
        [self presentViewController:_zh_centerViewController animated:animated completion:nil];
        return;
    }
    [self xmTabBarHidden:NO animated:YES];
    [self dismissViewControllerAnimated:animated completion:nil];
}

-(void)xmTabBarHidden:(BOOL)hidden animated:(BOOL)animated{
    
    NSTimeInterval duration;
    
    animated == YES?duration = 0.24:0;
    
    [UIView animateWithDuration:duration animations:^{
        if (hidden) {
            self.tabBarView.frame = CGRectMake(0, SCREENHEIGHT + 50, SCREENWIDTH, 49);
        }else{
            self.tabBarView.frame = CGRectMake(0, SCREENHEIGHT-49, SCREENWIDTH, 49);
        }
    } completion:^(BOOL finished) {
        
    }];
}

#pragma -mark TabBar代理方法实现
-(void)ZhTVtabBarViewSelectedItem:(NSInteger)index
{
    self.lastIndex = index;
    self.selectedIndex = index;

}
-(void)ZhTVtabBarViewCenterItemClick:(UIButton *)button
{
    [self presentViewController:_zh_centerViewController animated:YES completion:nil];
}



@end
