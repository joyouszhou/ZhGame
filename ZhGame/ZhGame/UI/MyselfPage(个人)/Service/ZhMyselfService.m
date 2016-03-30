//
//  ZhMyselfService.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/28.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhMyselfService.h"
#import "ZhPublicDef.h"


@implementation ZhMyselfService


-(void)ZhGetLoginStats:(ZhMyselfInfo)info
{
    NSString * loginName  = [[NSUserDefaults standardUserDefaults] objectForKey:ZH_LOACL_LOGIN_NICKNAME];
    if (loginName == nil || loginName.length<=0) {
        info(false,@"登录|注册");
    }
    else{
        info(true,loginName);
    }
}

@end
