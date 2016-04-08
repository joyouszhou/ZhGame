//
//  ZhUserDbManager.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/8.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserDbManager.h"
#import "ZhUserDbModel.h"
#import "ZhUserInfo.h"
@implementation ZhUserDbManager

#pragma mark - 单例方法
+(instancetype)shareInstance
{
    static ZhUserDbManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZhUserDbManager alloc] init];
    });
    return instance;
}




#pragma mark - 存储登录数据
/**
 *  存储当前登录信息
 *
 *  @param bLogin 1 登录 0 登出
 */
-(void)saveUserLoginMsg:(BOOL)bLogin
{
    ZhUserDbModel *user = [[ZhUserDbModel alloc] init];
    user.login_name = [ZhUserInfo shareInstance].userLoginName;
    user.user_Id = [ZhUserInfo shareInstance].userId;
    user.user_token = [ZhUserInfo shareInstance].userToken;
    user.user_head = [ZhUserInfo shareInstance].userHead;
    user.user_sex = [ZhUserInfo shareInstance].userSex;
    user.user_create_time = [ZhUserInfo shareInstance].userCreatetime;
    user.user_nick_name = [ZhUserInfo shareInstance].userNickName;
    user.user_status = 1;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [user saveOrUpdateByColumnName:@"user_Id" AndColumnValue:user.user_Id];
    });

}

#pragma mark -  查询当前登录用户信息
/**
 *  查询登录用户信息
 *
 *  @return 是否有值
 */
-(BOOL)getUserInfo
{
    NSArray * userlist = [ZhUserDbModel findAll];
    if (userlist.count>0) {
        ZhUserDbModel *model = (ZhUserDbModel*)[userlist objectAtIndex:0];
        NSLog(@"查询用户信息成功，内容为 %@" ,model);
        if (model.user_status == 1) {
            [ZhUserInfo shareInstance].userId = model.user_Id;
            [ZhUserInfo shareInstance].userLoginName = model.login_name;
            [ZhUserInfo shareInstance].userNickName = model.user_nick_name;
            [ZhUserInfo shareInstance].userCreatetime = model.user_create_time;
            [ZhUserInfo shareInstance].userSex =  model.user_sex;
            [ZhUserInfo shareInstance].userHead = model.user_head;
            [ZhUserInfo shareInstance].userToken = model.user_token;
            return true;
        }
    }
    return false;
}



@end
