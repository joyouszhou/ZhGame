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
#import "ZhUserInfo.h"
#import "ZhDbHelper.h"
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
 *  @param nickName      昵称
 *  @param headImage     头像
 *  @param completeBlock 回调登录成功失败
 */

-(void)ZhRegisterCodeWithPhoneNum:(NSString *)username andNickName:(NSString*)nickName andPassword:(NSString *)password andHeadImage:(NSString *)headImage complete:(ZhRegisterResponse)completeBlock
{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:API_BASE_URL(@"register.do")];
    [request setPostValue:username forKey:@"mobile"];
    [request setPostValue:password forKey:@"uPass"];
    [request setPostValue:nickName forKey:@"nickName"];
    [request setPostValue:nickName forKey:@"description"];
    [request setPostValue:headImage forKey:@"userHead"];
    [MMProgressHUD showWithTitle:@"开始注册" status:@"注册中..." ];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc] init];
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        int status=[[rootDic objectForKey:@"status"]intValue];
        if (status==1) {
            [MMProgressHUD dismissWithSuccess:[rootDic objectForKey:@"msg"] title:@"注册成功" afterDelay:1.0f];
            NSDictionary *userDic=[rootDic objectForKey:@"userInfo"];
            [[NSUserDefaults standardUserDefaults]setObject:[rootDic objectForKey:@"apiKey"] forKey:ZH_LOACL_API_KEY];
            [[NSUserDefaults standardUserDefaults]setObject:[userDic objectForKey:@"userId"] forKey:ZH_LOACL_USER_ID];
            [[NSUserDefaults standardUserDefaults]setObject:username forKey:ZH_LOACL_LOGIN_NAME];
            [[NSUserDefaults standardUserDefaults]setObject:nickName forKey:ZH_LOACL_LOGIN_NICKNAME];
            //立刻保存信息
            [[NSUserDefaults standardUserDefaults] synchronize];
            [ZhUserInfo shareInstance].userId =[rootDic objectForKey:@"userId"];
            [ZhUserInfo shareInstance].userLoginName =username;
            [ZhUserInfo shareInstance].userNickName =nickName;
            [ZhUserInfo shareInstance].userSex =@"未知";
            [ZhUserInfo shareInstance].userCreatetime =[rootDic objectForKey:@"registerDate"];
            [ZhUserInfo shareInstance].userHead =headImage;
            [ZhUserInfo shareInstance].userDes= @"";
            [ZhUserInfo shareInstance].userToken =[rootDic objectForKey:@"apiKey"];
            [[ZhDbHelper shareInstance] saveLoginInfo:YES];
            completeBlock(YES);
        }
        else
        {
            [MMProgressHUD dismissWithError:[rootDic objectForKey:@"msg"] title:@"注册失败" afterDelay:1.0f];
            completeBlock(NO);
        }
    }];
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"链接服务器失败！" title:@"注册失败" afterDelay:1.0f];
        completeBlock(NO);
    }];
    [request startAsynchronous];
}

#pragma mark -注册 － 上传 头像
/**
 *  上传头像到服务器
 *
 *  @param image     头像
 *  @param loginName 用户名称
 *  @param block     代理
 */
-(void)ZhRegisterUploadheadImage:(UIImage *)image andLoginName:(NSString*)loginName coplete:(ZhRegisterUploadFileResponse)block
{
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:API_BASE_URL(@"uploadFile.do")];
    [request setData:UIImageJPEGRepresentation(image,0.01) withFileName:[loginName stringByAppendingString:@"-head.jpg"] andContentType:@"image/jpeg" forKey:@"file"];
    [request setTimeOutSeconds:1000];
    __block NSString *fileId=@"";
    [MMProgressHUD showWithTitle:@"上传头像" status:@"头像上传中，请耐心等待"];
    [request setCompletionBlock:^{
        SBJsonParser *paser=[[SBJsonParser alloc]init];
        NSDictionary *rootDic=[paser objectWithString:request.responseString];
        NSArray *files=[rootDic objectForKey:@"files"];
        if ([files count]>0) {
            fileId=[[files objectAtIndex:0] objectForKey:@"fileId"];
        }
        [MMProgressHUD dismissWithSuccess:@"上传头像成功" title:fileId afterDelay:1.0f];
        block(true,fileId);
    }];
    [request setFailedBlock:^{
        [MMProgressHUD dismissWithError:@"上传头像失败" afterDelay:1.0f];
        block(NO,fileId);
    }];
    [request startAsynchronous];
    

}

@end
