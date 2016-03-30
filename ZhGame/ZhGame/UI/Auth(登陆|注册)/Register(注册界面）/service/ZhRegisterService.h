//
//  ZhRegisterService.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/24.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

typedef void (^ZhRegisterResponse)(BOOL isFinish);
typedef void (^ZhRegisterUploadFileResponse)(BOOL isFinish,NSString *data);

@interface ZhRegisterService : NSObject

#pragma mark - 注册－获取手机验证码功能
/*
 * 注册－获取手机验证码功能
 */
- (void)ZhRegisterGetPhoneCodeWithPhoneNum:(NSString *)username complete:(ZhRegisterResponse)completeBlock;

#pragma mark -  注册 －  请求认证服务器进行注册
/**
 *  请求服务器，进行登录认证
 *
 *  @param username      用户名
 *  @param password      密码
 *  @param nickName      昵称
 *  @param headImage     头像
 *  @param completeBlock 回调登录成功失败
 */

-(void)ZhRegisterCodeWithPhoneNum:(NSString *)username andNickName:(NSString*)nickName andPassword:(NSString *)password andHeadImage:(NSString *)headImage complete:(ZhRegisterResponse)completeBlock;

#pragma mark -注册 － 上传 头像
/**
 *  上传头像到服务器
 *
 *  @param image     头像
 *  @param loginName 用户名称
 *  @param block     代理
 */
-(void)ZhRegisterUploadheadImage:(UIImage *)image andLoginName:(NSString*)loginName coplete:(ZhRegisterUploadFileResponse)block;


@end
