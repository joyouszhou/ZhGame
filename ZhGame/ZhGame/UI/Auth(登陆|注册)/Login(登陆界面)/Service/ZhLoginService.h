//
//  ZhLoginService.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/30.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ZhLoginResponse)(BOOL isFinish);
@interface ZhLoginService : NSObject

#pragma mark - 登录方法
/**
 *  登录方法
 *
 *  @param loginName 登录用户名
 *  @param pw        密码
 *  @param response  返回
 */
-(void)ZhLoginRequeset:(NSString*)loginName pw:(NSString*)pw complete:(ZhLoginResponse)response;

@end
