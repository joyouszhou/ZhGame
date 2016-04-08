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

@end
