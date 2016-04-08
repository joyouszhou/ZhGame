//
//  ZhUserDbManager.h
//  ZhGame
//
//  Created by zhouhuan on 16/4/8.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhUserDbManager : NSObject

#pragma mark - 单例方法
+(instancetype)shareInstance;

#pragma mark - 存储登录数据
/**
 *  存储当前登录信息
 *
 *  @param bLogin 1 登录 0 登出
 */
-(void)saveUserLoginMsg:(BOOL)bLogin;

#pragma mark -  查询当前登录用户信息
/**
 *  查询登录用户信息
 *
 *  @return 是否有值
 */
-(BOOL)getUserInfo;


@end
