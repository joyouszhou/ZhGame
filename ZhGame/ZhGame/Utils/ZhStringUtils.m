//
//  ZhStringUtils.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/15.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhStringUtils.h"

@implementation ZhStringUtils

#pragma mark - 检查手机号有效性
/**
 *  检查是否满足手机号验证
 *
 *  @param phone 手机号
 *
 *  @return YES 手机号 NO 非手机号
 */
+(BOOL)isPhone:(NSString *)phone
{
    NSString *regex = @"1[0-9]{10}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL bRet =  [pred evaluateWithObject:phone];
    return bRet;
}
#pragma mark － 检查手机验证码有效性
/**
 *  检查手机验证码有效性
 *
 *  @param code 手机验证码
 *
 *  @return YES 手机验证码  NO 非手机验证码
 */
+(BOOL)isPhoneCode:(NSString *)code
{
    NSString *regex = @"1[0-9]{5}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL bRet =  [pred evaluateWithObject:code];
    return bRet;
}
#pragma mark - 检查密码有效性
/**
 *  检查密码有效性
 *
 *  @param passwrod 密码
 *
 *  @return YES 密码有效 NO 密码无效
 */
+(BOOL)isPassword:(NSString *)passwrod
{
    NSRange _range = [passwrod rangeOfString:@" "] ;
    if (passwrod==nil|| passwrod.length<6 || _range.location != NSNotFound) {
        return false;
    }
    return YES;
}
@end
