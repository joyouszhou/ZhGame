//
//  ZhLoginViewController.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/8.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhRegisterViewController.h"
#import "ZhLoginService.h"
@protocol ZhLoginDelegate <NSObject>
@optional
/**
 *  登录成功
 */
-(void)ZhLoginSuccessDelegate;


@end

@interface ZhLoginViewController : UIViewController<UITextFieldDelegate,ZhRegisterDelegate>

@property (nonatomic , strong)  id<ZhLoginDelegate> delegae;

@property (strong, nonatomic) ZhLoginService *loginService;

@end
