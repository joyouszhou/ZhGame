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

#define kMY_USER_PASSWORD @"myUserPassword"
#define kMY_USER_DESC @"myUserDescription"




#define API_BASE_URL(_URL_) [NSURL URLWithString:[@"http://10.0.0.32:8080/wechat/api/" stringByAppendingString:_URL_]]


@end
