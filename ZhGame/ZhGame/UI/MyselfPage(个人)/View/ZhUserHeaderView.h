//
//  ZhUserHeaderView.h
//  ZhGame
//
//  Created by zhouhuan on 16/4/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhHeaderModel.h"

@protocol ZhUserHeaderDelegate <NSObject>
@optional

-(void)ZhUserHeaderShowLogin;


@end


@interface ZhUserHeaderView : UIView


@property (nonatomic, strong)ZhHeaderModel              *info;
@property (nonatomic, strong) id<ZhUserHeaderDelegate>  delegate;


@end
