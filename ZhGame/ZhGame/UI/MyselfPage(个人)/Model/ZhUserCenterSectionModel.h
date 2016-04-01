//
//  ZhSettingSectionModel.h
//  ZhGame
//
//  Created by zhouhuan on 16/4/1.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZhUserCenterSectionModel : NSObject

@property (nonatomic,copy) NSString  *sectionHeaderName;            // 传空表示分组无名称

@property (nonatomic,assign) CGFloat  sectionHeaderHeight;          //分组header高度

@property (nonatomic,strong) NSArray  *itemArray;                   //item模型数组

@property (nonatomic,strong) UIColor  *sectionHeaderBgColor;        //背景色

@end
