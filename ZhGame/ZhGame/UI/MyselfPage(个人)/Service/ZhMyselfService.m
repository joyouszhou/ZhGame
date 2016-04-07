//
//  ZhMyselfService.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/28.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhMyselfService.h"
#import "ZhPublicDef.h"
#import "ASIFormDataRequest.h"
#import "ZhUserInfo.h"
#import "SBJson.h"

@implementation ZhMyselfService

#pragma mark - 获取当前用户状态
-(void)ZhGetLoginStats:(ZhMyselfInfo)info
{
    NSString * loginName  = [[NSUserDefaults standardUserDefaults] objectForKey:ZH_LOACL_LOGIN_NICKNAME];
    if (loginName == nil || loginName.length<=0) {
        info(false,@"登录|注册");
    }
    else{
        info(true,loginName);
    }
    //读取当前用户信息
}

#pragma mark -获取用户信息
/**
 *  读取用户信息
 */
-(void)ZhGetUserInfo:(ZhMyselfInfo)info
{
    NSLog(@"获取用户信息，从服务器");
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"getUserDetail.do")];
    [request setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:ZH_LOACL_API_KEY] forKey:@"apiKey"];
    [request setPostValue:[[NSUserDefaults standardUserDefaults]objectForKey:ZH_LOACL_USER_ID] forKey:@"userId"];
//    [MMProgressHUD showWithTitle:@"读取好友资料" status:@"读取中..." ];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        NSLog(@"%@",request.responseString);
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        int status=[[rootDic objectForKey:@"status"]intValue];
        if (status==1) {
            NSDictionary *userDic=[rootDic objectForKey:@"userDetail"];
            //如果是我自己的资料
//            if ([userId isEqualToString:[[NSUserDefaults standardUserDefaults]objectForKey:ZH_LOACL_USER_ID]]) {
                [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userHead"] forKey:ZH_LOACL_LOGIN_HEAD];
                [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"nickName"] forKey:ZH_LOACL_LOGIN_NICKNAME];
                [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"description"] forKey:ZH_LOACL_LOGIN_DESC];
                //立刻保存信息
                [[NSUserDefaults standardUserDefaults]synchronize];
//            }
            int sex=[[userDic objectForKey:@"sex"] class]==[NSNull class]?-1:[[userDic objectForKey:@"sex"]intValue];
            
            NSString *sexStr=nil;
            switch (sex) {
                case 1:
                    sexStr=@"男";
                    break;
                case 0:
                    sexStr=@"女";
                    break;
                default:
                    sexStr=@"暂无资料";
                    break;
            }
            
            
            [ZhUserInfo shareInstance].userHead     = [userDic objectForKey:@"userHead"];
            [ZhUserInfo shareInstance].userNickName = [userDic objectForKey:@"nickName"];
            [ZhUserInfo shareInstance].userDes      = [userDic objectForKey:@"description"];
            [ZhUserInfo shareInstance].userSex      = sexStr;
            [ZhUserInfo shareInstance].userDes      = [userDic objectForKey:@"registerDate"];
            info(true,nil);
        }
        else{
//            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"登陆失败" afterDelay:0.75f];
            NSLog(@"登录失败");
            info(false,nil);
        }
        
    }];
    
    [request setFailedBlock:^{
//        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"登陆失败" afterDelay:0.75f];
        NSLog(@"链接服务器失败");
        info(false,nil);
    }];
    [request startAsynchronous];
}


@end
