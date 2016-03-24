//
//  ZhRegisterViewController.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/14.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhRegisterService.h"

@interface ZhRegisterViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) ZhRegisterService *RegisterService;

@end
