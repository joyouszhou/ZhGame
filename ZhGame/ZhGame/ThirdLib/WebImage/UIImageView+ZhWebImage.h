//
//  UIImageView+ZhWebImage.h
//  ZhGame
//
//  Created by zhouhuan on 16/3/31.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImageView (ZhWebImage)

-(void)setWebImage:(NSURL *)aUrl placeHolder:(UIImage *)placeHolder downloadFlag:(int)flag;

@end
