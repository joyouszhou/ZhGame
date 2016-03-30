//
//  ZhRegisterViewController.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/14.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhRegisterService.h"

@protocol ZhRegisterDelegate <NSObject>
@optional

/**
 *  注册成功
 */
-(void)ZhRegisterSuccessDelegate;


@end


@interface ZhRegisterViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) ZhRegisterService *RegisterService;

@property (nonatomic , strong)  id<ZhRegisterDelegate> delegae;

@end
