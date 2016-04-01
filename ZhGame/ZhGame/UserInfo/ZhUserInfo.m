//
//  ZhUserInfo.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/31.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserInfo.h"

@implementation ZhUserInfo

+(instancetype)shareInstance
{
    static ZhUserInfo *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZhUserInfo alloc] init];
    });
    return instance;
}




@end
