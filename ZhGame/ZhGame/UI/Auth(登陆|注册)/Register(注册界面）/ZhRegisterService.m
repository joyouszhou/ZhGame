//
//  ZhRegisterService.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/24.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhRegisterService.h"
#import "ASIFormDataRequest.h"
#import "MMProgressHUD.h"
#import "SBJson.h"
#import "ZhPublicDef.h"
@implementation ZhRegisterService

#pragma mark - 注册－获取手机验证码功能
/*
 * 注册－获取手机验证码功能
 */
- (void)ZhRegisterGetPhoneCodeWithPhoneNum:(NSString *)username complete:(ZhRegisterResponse)completeBlock
{
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        BOOL success = YES;
        completeBlock(success);
    });
//    这里进行网络注册
}
#pragma mark -  注册 －  请求认证服务器进行注册
/**
 *  请求服务器，进行登录认证
 *
 *  @param username      用户名
 *  @param password      密码
 *  @param completeBlock 回调登录成功失败
 */
-(void)ZhRegisterCodeWithPhoneNum:(NSString *)username andPassword:(NSString *)password complete:(ZhRegisterResponse)completeBlock
{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:API_BASE_URL(@"register.do")];
    [request setPostValue:username forKey:@"mobile"];
    [request setPostValue:password forKey:@"uPass"];
    [request setPostValue:username forKey:@"nickName"];
    [request setPostValue:username forKey:@"description"];
    [request setPostValue:@"" forKey:@"userHead"];
    [MMProgressHUD showWithTitle:@"开始注册" status:@"注册中..." ];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc] init];
        NSLog(@"zhouhuan   %@",request.responseString);
        [MMProgressHUD dismissWithSuccess:@"哈哈哈" title:@"注册成功" afterDelay:0.75f];
        
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        int status=[[rootDic objectForKey:@"status"]intValue];
        if (status==1) {
            [MMProgressHUD dismissWithSuccess:[rootDic objectForKey:@"msg"] title:@"注册成功" afterDelay:0.75f];
            NSDictionary *userDic=[rootDic objectForKey:@"userInfo"];
            [[NSUserDefaults standardUserDefaults]setObject:[rootDic objectForKey:@"apiKey"] forKey:ZH_LOACL_API_KEY];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userId"] forKey:ZH_LOACL_USER_ID];
            [[NSUserDefaults standardUserDefaults]setObject:username forKey:ZH_LOACL_LOGIN_NAME];
            [[NSUserDefaults standardUserDefaults]setObject:password forKey:kMY_USER_PASSWORD];
            //立刻保存信息
            [[NSUserDefaults standardUserDefaults] synchronize];
            completeBlock(YES);
        }
        else
        {
            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"注册失败" afterDelay:0.75f];
            completeBlock(NO);
        }
    }];
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"注册失败" afterDelay:0.75f];
        completeBlock(NO);
    }];
    [request startAsynchronous];
}


@end
