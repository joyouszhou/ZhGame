//
//  ZhMyselfService.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/28.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ZhMyselfInfo)(BOOL isLogin,NSString *title);

@interface ZhMyselfService : NSObject


-(void)ZhGetLoginStats:(ZhMyselfInfo)info;

/**
 *  读取用户信息
 */
-(void)ZhGetUserInfo:(ZhMyselfInfo)info;


@end
