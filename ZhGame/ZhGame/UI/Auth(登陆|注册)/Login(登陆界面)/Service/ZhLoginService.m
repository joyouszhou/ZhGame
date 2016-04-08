//
//  ZhLoginService.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/30.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhLoginService.h"
#import "ASIFormDataRequest.h"
#import "MMProgressHUD.h"
#import "SBJson.h"
#import "ZhPublicDef.h"
#import "ZhUserInfo.h"
#import "ZhUserDbManager.h"

@implementation ZhLoginService



#pragma mark - 登录方法
/**
 *  登录方法
 *
 *  @param loginName 登录用户名
 *  @param pw        密码
 *  @param response  返回
 */
-(void)ZhLoginRequeset:(NSString*)loginName pw:(NSString*)pw complete:(ZhLoginResponse)response
{
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"login.do")];
    [request setPostValue:loginName forKey:@"mobile"];
    [request setPostValue:pw forKey:@"uPass"];
    [request setPostValue:[NSString stringWithFormat:@"WeChat-V%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]] forKey:@"versionInfo"];
    [request setPostValue:[[[UIDevice currentDevice]systemName]stringByAppendingString:[[UIDevice currentDevice]systemVersion]] forKey:@"deviceInfo"];
    [MMProgressHUD showWithTitle:@"开始登陆" status:@"登陆中..." ];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        NSLog(@"%s",[request.responseString UTF8String]);
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        int status=[[rootDic objectForKey:@"status"]intValue];
        if (status==1) {
            [MMProgressHUD dismissWithSuccess:[rootDic objectForKey:@"msg"] title:@"登陆成功" afterDelay:1.0f];
            NSDictionary *userDic=[rootDic objectForKey:@"userInfo"];
            [[NSUserDefaults standardUserDefaults]setObject:[rootDic objectForKey:@"apiKey"] forKey:ZH_LOACL_API_KEY];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userId"] forKey:ZH_LOACL_USER_ID];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userHead"] forKey:ZH_LOACL_LOGIN_HEAD];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"nickName"] forKey:ZH_LOACL_LOGIN_NICKNAME];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"description"] forKey:ZH_LOACL_LOGIN_DESC];
            [[NSUserDefaults standardUserDefaults]setObject:loginName forKey:ZH_LOACL_LOGIN_NAME];
            //立刻保存信息
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
            [ZhUserInfo shareInstance].userId =[userDic objectForKey:@"userId"];
            [ZhUserInfo shareInstance].userLoginName =loginName;
            [ZhUserInfo shareInstance].userNickName =[userDic objectForKey:@"nickName"];
            [ZhUserInfo shareInstance].userSex =@"未知";
            [ZhUserInfo shareInstance].userCreatetime =[userDic objectForKey:@"registerDate"];
            [ZhUserInfo shareInstance].userHead =[userDic objectForKey:@"userHead"];
            [ZhUserInfo shareInstance].userDes= @"";
            [ZhUserInfo shareInstance].userToken =[rootDic objectForKey:@"apiKey"];
            [[ZhUserDbManager shareInstance] saveUserLoginMsg:YES];
            
            
            response(true);
            
        }
        else{
            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"登陆失败" afterDelay:1.0f];
            response(NO);
        }
        
    }];
    [request setFailedBlock:^{
        response(NO);
        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"登陆失败" afterDelay:1.0f];
    }];
    [request startAsynchronous];

}


@end
