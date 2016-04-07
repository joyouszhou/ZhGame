//
//  ZhDbHelper.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhDbHelper.h"
#import "ZhUserInfo.h"


#define ZHQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); abort(); } }

#define _ZH_USER_DB_CREATE_SQL   @"CREATE TABLE IF NOT EXISTS ZH_GAME_USER_LIST (ID INTEGER PRIMARY KEY AUTOINCREMENT,  user_id TEXT,  user_token TEXT, login_name TEXT, user_head TEXT, user_sex TEXT,  user_create_time TEXT,  user_nick_name TEXT user_status integer)"

@implementation ZhDbHelper

/**
 *  获取DB的存储文件名称
 *
 *  @return 全路径
 */
+ (NSString *)dbPath
{
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *filemanage = [NSFileManager defaultManager];
    docsdir = [docsdir stringByAppendingPathComponent:@"ZHGameBD"];
    BOOL isDir;
    BOOL exit =[filemanage fileExistsAtPath:docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [filemanage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbpath = [docsdir stringByAppendingPathComponent:@"zhGamedb.sqlite"];
    return dbpath;
}


#pragma mark - 实例化
/**
 *  实例化
 *
 *  @return 当前实例
 */
+(instancetype)shareInstance
{
    static ZhDbHelper *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZhDbHelper alloc] init];
    });
    return instance;
}


 -(FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
    }
    return _dbQueue;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [ZhDbHelper shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [ZhDbHelper shareInstance];
}

#if ! __has_feature(objc_arc)
- (oneway void)release
{
    
}

- (id)autorelease
{
    return _instance;
}

- (NSUInteger)retainCount
{
    return 1;
}
#endif

//
//
//-(void)createUserTable
//{
//    [self.db open];
//    [self.db executeUpdate:_ZH_USER_DB_CREATE_SQL];
//    [self.db close];
//}
//
//
//#pragma mark - 添加列
///**
// *  添加列方法
// *
// *  @param colum 列名称
// */
//
//-(void)addUserTableColums:(NSString *)colum
//{
//    [self.db open];
//    if (![self.db columnExists:colum inTableWithName:@"ZH_GAME_USER_LIST"]) {
//        NSString *sql = [NSString stringWithFormat:@"ALTER TABLE %@ ADD %@ text",@"ZH_GAME_USER_LIST",colum];
//        [self.db executeUpdate:sql];
//    }
//    [self.db close];
//}
//#pragma mark - 保存登录信息
///**
// *  更新用户信息
// *
// *  @param blogin 是否是登录
// *                true 需要重新更新字段
// *                false 则为登出方法
// */
//-(void)saveLoginInfo:(BOOL)blogin
//{
//    [self.db open];
//    if (blogin) {
//        [self cleanUserInfoTable];
//        //todo insert info to user table
//        NSMutableDictionary *dictionaryArgs = [NSMutableDictionary dictionary];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userId forKey:@"user_id"];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userToken forKey:@"user_token"];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userLoginName forKey:@"login_name"];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userHead forKey:@"user_head"];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userSex forKey:@"user_sex"];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userCreatetime forKey:@"user_create_time"];
//        [dictionaryArgs setValue:[ZhUserInfo shareInstance].userNickName forKey:@"user_nick_name"];
//        [dictionaryArgs setValue:@1 forKey:@"user_status"];
//        
//        ZHQuickCheck([self.db executeUpdate:@"INSERT INTO ZH_GAME_USER_LIST values (:user_id :login_name :user_head :user_sex :user_create_time :user_nick_name :user_status :user_token) " withParameterDictionary:dictionaryArgs]);
//    }
//    else
//    {
//        //todo update userTable
//       ZHQuickCheck(([self.db executeUpdate:@"update ZH_GAME_USER_LIST set user_status = 0 where user_id = ?",[ZhUserInfo shareInstance].userId]));
//    }
//    [self.db close];
//}
//
//#pragma mark - 更新用户信息
///**
// *  更新表操作
// *
// *  @param colume 更新表制定字段
// *  @param value  值
// */
//-(void)updateUserInfo:(NSString *)colume vale:(NSString *)value where:(NSString *)key wvalue:(NSString *)wvalue
//{
//    
//    if (colume  == nil || colume.length<=0 || value==nil|| value.length<=0) {
//        return;
//    }
//    [self.db open];
//    ZHQuickCheck(([self.db executeUpdate:@"update ZH_GAME_USER_LIST set ? = ? where ? = ?",colume,value,key,wvalue]));
//    [self.db close];
//}
//
//
//-(void)cleanUserInfoTable
//{
//    //delete info with user table
//    [self.db open];
//    [self.db executeUpdate:@"DELETE from ZH_GAME_USER_LIST"];
//    [self.db close];
//}
//
//
@end
