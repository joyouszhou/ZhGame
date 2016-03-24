//
//  ZhRegisterService.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/24.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ZhRegisterResponse)(BOOL);

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
 *  @param completeBlock 回调登录成功失败
 */
-(void)ZhRegisterCodeWithPhoneNum:(NSString *)username andPassword:(NSString *)password complete:(ZhRegisterResponse)completeBlock;

@end
