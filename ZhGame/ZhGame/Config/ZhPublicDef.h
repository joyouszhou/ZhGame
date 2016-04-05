//
//  ZhPublicDef.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/24.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhPublicDef : NSObject

#define ZH_LOACL_API_KEY                @"com.zhouhuan.api.key"
#define ZH_LOACL_USER_ID                @"com.zhouhuan.user.id"
#define ZH_LOACL_LOGIN_NAME             @"com.zhouhuan.login.name"
#define ZH_LOACL_LOGIN_NICKNAME         @"com.zhouhuan.login.nickname"
#define ZH_LOACL_LOGIN_DESC             @"com.zhouhuan.login.desc"
#define ZH_LOACL_LOGIN_HEAD             @"com.zhouhuan.login.head"


#define ZH_SERVER_DOMIAN                    @"http://joyouszhou.vicp.cc:20735"


#define API_BASE_URL(_URL_) [NSURL URLWithString:[NSString stringWithFormat:@"%@/wechat/api/%@",ZH_SERVER_DOMIAN,_URL_]]
#define API_IMAGER_URL(_IMG_)      [NSURL URLWithString:[NSString stringWithFormat:@"%@/iosimage/%@",ZH_SERVER_DOMIAN,_IMG_]]



#define NOTIFICATION_USER_LOGIN_SUCCESS                     @"com.zh.user.login.success"

@end
