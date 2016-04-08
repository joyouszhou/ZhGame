//
//  ZhUserDbModel.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserDbModel.h"

@interface ZhUserDbModel ()

@property (nonatomic, copy) NSString *duty;

@end

@implementation ZhUserDbModel


+(NSArray *)transients
{
    return [NSArray arrayWithObjects:@"field1",@"field2",nil];
}

@end
