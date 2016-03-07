//
//  ZhTVViewController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhTabBarView.h"
#import "ZhTabBarButton.h"
@interface ZhTabBarView ()

@end

@implementation ZhTabBarView

-(id)initWithItemSelectedImages:(NSMutableArray *)selected
                   normalImages:(NSMutableArray *)normal
                         titles:(NSMutableArray *)titles{
    if ([super init]) {
        self.frame = CGRectMake(0, SCREENHEIGHT - 49, SCREENWIDTH, 49);
        self.buttonArray = [NSMutableArray array];
        self.titleLabels = [NSMutableArray array];
        self.unSelectedImages = normal;
        self.selectedImages = selected;
        self.titles = titles;
        [self createUI];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
    }
    return self;
}

-(void)createUI{
    
    self.line = [[UIView alloc]init];
    self.line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.line];
    
    self.backgroundImageView = [[UIImageView alloc]init];
    self.backgroundImageView.image = self.backgroundImage;
    [self addSubview:self.backgroundImageView];
    
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.centerButton addTarget:self action:@selector(centerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.centerButton];
    
    
    
    for (int i = 0; i < self.unSelectedImages.count; i ++) {
        
        ZhTabBarButton * button = [ZhTabBarButton sharedInstance];
        [button setImage:self.unSelectedImages[i] forState:UIControlStateNormal];
        [button setImage:self.selectedImages[i] forState:UIControlStateSelected];
        
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonArray addObject:button];
        
        
    }
    
}

-(void)tabBarBadgeValue:(NSUInteger)value item:(NSInteger)index{
    ZhTabBarButton * button = self.buttonArray[index];
    button.badgeValue = value;
}


-(void)setItemSelectedIndex:(NSInteger)itemSelectedIndex{
    _itemSelectedIndex = itemSelectedIndex;
    for (ZhTabBarButton * item in self.buttonArray) {
        item.selected = NO;
        if (item.tag == itemSelectedIndex)  item.selected = YES;
    }
}

-(void)setShowCenter:(BOOL)showCenter{
    _showCenter = showCenter;
}
-(void)setCenterImage:(UIImage *)centerImage{
    _centerImage = centerImage;
    [self.centerButton setImage:_centerImage forState:UIControlStateNormal];
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    for (ZhTabBarButton * button in self.buttonArray) {
        [button setTitleColor:textColor forState:UIControlStateSelected];
    }
}

-(void)buttonClick:(ZhTabBarButton *)button{
    for (ZhTabBarButton * item in self.buttonArray) item.selected = NO;
    /**
     *  选中哪一个item将上面的badgeValue清零
     */
    [self tabBarBadgeValue:0 item:button.tag];
    
    button.selected = !button.selected;
    [self.delegate ZhTVtabBarViewSelectedItem:button.tag];
}

-(void)centerButtonClick:(UIButton *)button{
    [self.delegate ZhTVtabBarViewCenterItemClick:button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.line.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
    self.backgroundImageView.frame = CGRectMake(0, 0.5, self.frame.size.width, self.frame.size.height - 0.5);
    
    NSUInteger count = self.buttonArray.count%2 == 0 ? self.buttonArray.count:self.buttonArray.count+1;
    
    /** 中间按钮的宽高 */
    CGFloat centerButtonWH = 60;
    /** 普通按钮的高度 */
    CGFloat buttonHeight = 48.5;
    /** 普通按钮的宽度 */
    CGFloat buttonWidth = self.frame.size.width/count;
    CGFloat centerButtonX = (self.frame.size.width - centerButtonWH)*0.5;
    
    if (_showCenter) {
        self.centerButton.frame = CGRectMake(centerButtonX, self.frame.size.height - centerButtonWH, centerButtonWH, centerButtonWH);
        buttonWidth = (self.frame.size.width- centerButtonWH - 20)/count;
    }
    
    CGFloat buttonX = 0;
    
    for (int i = 0; i < self.buttonArray.count;i ++) {
        ZhTabBarButton * button = self.buttonArray[i];
        if (_showCenter && button.tag == count/2) {
            buttonX += centerButtonWH + 20;
        }
        button.frame = CGRectMake(buttonX, 0.5, buttonWidth, buttonHeight);
        buttonX += buttonWidth;
    }
    
}
@end
