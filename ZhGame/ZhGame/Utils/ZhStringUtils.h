//
//  ZhStringUtils.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/15.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface ZhStringUtils : NSObject

#pragma mark - 检查手机号有效性
/**
 *  检查是否满足手机号验证
 *
 *  @param phone 手机号
 *
 *  @return YES 手机号 NO 非手机号
 */
+(BOOL)isPhone:(NSString *)phone;

#pragma mark － 检查手机验证码有效性
/**
 *  检查手机验证码有效性
 *
 *  @param code 手机验证码
 *
 *  @return YES 手机验证码  NO 非手机验证码
 */
+(BOOL)isPhoneCode:(NSString *)code;


#pragma mark - 检查密码有效性
/**
 *  检查密码有效性
 *
 *  @param passwrod 密码
 *
 *  @return YES 密码有效 NO 密码无效
 */
+(BOOL)isPassword:(NSString *)passwrod;

#pragma mark － 检查昵称的有效性
/**
 *  检查昵称的有效性
 *
 *  @param code 昵称
 *
 *  @return YES 合法昵称  NO 非昵称
 */
+(BOOL)isNickName:(NSString *)nickname;


#pragma mark - 获取字体的大小
/**
 *  获取文字的大小
 *
 *  @param str  字符串
 *  @param font 字体大小
 *
 *  @return 字体的大小
 */

+(CGSize)sizeForString:(NSString *)str withFont:(UIFont *)font;

@end
