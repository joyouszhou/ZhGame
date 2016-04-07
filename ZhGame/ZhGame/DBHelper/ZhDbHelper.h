//
//  ZhDbHelper.h
//  ZhGame
//
//  Created by zhouhuan on 16/4/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDb.h"
@interface ZhDbHelper : NSObject



#pragma mark - 实例化
/**
 *  实例化
 *
 *  @return 当前实例
 */
+(instancetype)shareInstance;
//
//#pragma mark - 函数
//
//#pragma mark - 添加列
///**
// *  添加列方法
// *
// *  @param colum 列名称
// */
//-(void)addUserTableColums:(NSString *)colum;
//
//#pragma mark - 保存登录信息
///**
// *  更新用户信息
// *
// *  @param blogin 是否是登录 
// *                true 需要重新更新字段
// *                false 则为登出方法
// */
//-(void)saveLoginInfo:(BOOL)blogin;
//
//#pragma mark - 更新用户信息
///**
// *  更新表操作
// *
// *  @param colume 更新表制定字段
// *  @param value  值
// */
//-(void)updateUserInfo:(NSString *)colume vale:(NSString *)value where:(NSString *)key wvalue:(NSString *)wvalue;
//
#pragma mark - 内部变量
/**
 *    检查是否初始化完成
 *    true 完成 
 *    false 失败
 */
@property (nonatomic, retain)   FMDatabaseQueue               *dbQueue;                      //数据库实例


@end
