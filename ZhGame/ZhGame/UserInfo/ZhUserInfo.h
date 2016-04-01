//
//  ZhUserInfo.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/31.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhUserInfo : NSObject

#pragma mark - 实例化
+(instancetype)shareInstance;


#pragma mark - 内部成员

@property (nonatomic, strong)   NSString                    *userNickName;
@property (nonatomic, strong)   NSString                    *userLoginName;
@property (nonatomic, strong)   NSString                    *userHead;
@property (nonatomic, strong)   NSString                    *userSex;
@property (nonatomic, strong)   NSString                    *userDes;
@property (nonatomic, strong)   NSString                    *userCreatetime;


@end
