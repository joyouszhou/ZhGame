//
//  JxbScaleButton.m
//  JxbScaleButton
//
//  Created by Peter on 15/8/7.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "ZhCountBtn.h"

@implementation ZhCountBtnSetting
@end

@implementation ZhCountBtn

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)scale:(ZhCountBtnSetting*)setting {
    self.layer.cornerRadius =  10;
    [self setTitleColor:setting.colorTitle ? setting.colorTitle : [UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:setting.colorTitle ? setting.colorTitle : [UIColor whiteColor] forState:UIControlStateDisabled];
    if (setting.indexStart > 0)
    {
        self.backgroundColor = setting.colorDisable ? setting.colorDisable : [UIColor lightGrayColor];
        NSString* title = [NSString stringWithFormat:@"  %ds|%@ ",setting.indexStart,(setting.strSuffix ? setting.strSuffix : @"")];
        NSLog(@"%@",title);
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateDisabled];
        
        __block ZhCountBtn/*主控制器*/ *weakSelf = self;
        
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/*延迟执行时间*/ * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            setting.indexStart--;
            [weakSelf scale:setting];
        });
    }
    else {
        self.backgroundColor = setting.colorCommon ? setting.colorCommon : [UIColor redColor];
        [self setEnabled:YES];
        [self setTitle:setting.strCommon forState:UIControlStateNormal];
        if (self.delegate &&[self.delegate respondsToSelector:@selector(ZhCountBtnFinish)]) {
            [self.delegate ZhCountBtnFinish];
        }
    }
}

#pragma mark - 启动函数
/**
 *  开始技术
 *
 *  @param setting 参数
 */
- (void)startWithSetting:(ZhCountBtnSetting *)setting {
    [self scale:setting];
}

@end
