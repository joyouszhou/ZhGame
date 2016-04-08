//
//  ZhUserDbModel.h
//  ZhGame
//
//  Created by zhouhuan on 16/4/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ZhDBModel.h"

@interface ZhUserDbModel : ZhDBModel


@property (nonatomic, copy)     NSString                    *user_Id;                   //用户id

@property (nonatomic, copy)     NSString                    *user_token;                //用户token

@property (nonatomic, copy)     NSString                    *login_name;                //用户登录名称

@property (nonatomic, copy)     NSString                    *user_head;                 //用户头像

@property (nonatomic, copy)     NSString                    *user_sex;                  //用户性别

@property (nonatomic, copy)     NSString                    *user_create_time;          //创建时间

@property (nonatomic, copy)     NSString                    *user_nick_name;            //用户昵称

@property (nonatomic, assign)   int                         user_status;                //用户登录状态 1 表示登录，0表是登出

@end
