//
//  ZhUserCenterSettingItemModel.h
//  ZhGame
//
//  Created by zhouhuan on 16/4/1.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZhUserCenterItemModel : NSObject

typedef NS_ENUM(NSInteger, ZhDetailType)
{
    ZhSettingAccessoryTypeNone,                   // don't show any accessory view
    ZhSettingAccessoryTypeDisclosureIndicator,    // the same with system DisclosureIndicator
    ZhSettingAccessoryTypeSwitch,                 //  swithch
};

typedef NS_ENUM(NSInteger,ZhUserCenterItemEvents)
{
    ZhUserCenterItemEventClick,                     //点击了整个事件
    ZhUserCenterItemEventSwitch,                    //点击了切换方法
};



@property (nonatomic,copy)   NSString                       *titleName;                 //按钮标题
@property (nonatomic,strong) UIImage                        *titleImage;                //按钮左图片
@property (nonatomic,copy)   NSString                       *detailText;                //更多信息-提示文字
@property (nonatomic,strong) UIImage                        *detailImage;               //更多信息-提示图片

@property (nonatomic,assign) ZhDetailType                   accessoryType;              //右侧按钮类型


@property (nonatomic, strong) id                            target;
@property (nonatomic, assign) SEL                           action;
@property (nonatomic, assign) ZhUserCenterItemEvents        events;

/**
 *  添加注册事件
 *
 *  @param target 目标
 *  @param action 行为
 *  @param Events 时机
 */
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(ZhUserCenterItemEvents)Events;


@end


