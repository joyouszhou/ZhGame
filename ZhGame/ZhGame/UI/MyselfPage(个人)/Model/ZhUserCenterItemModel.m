//
//  ZhUserCenterSettingItemModel.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/1.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserCenterItemModel.h"

@implementation ZhUserCenterItemModel


- (void)addTarget:(id)target action:(SEL)action forControlEvents:(ZhUserCenterItemEvents)Events
{
    self.target = target;
    self.action = action;
    self.events = Events;
}

@end
