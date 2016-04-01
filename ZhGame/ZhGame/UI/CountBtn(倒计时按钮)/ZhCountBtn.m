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
    self.titleLabel.transform = CGAffineTransformMakeScale(1, 1);
    self.titleLabel.alpha     = 1;
    [self setTitleColor:setting.colorTitle ? setting.colorTitle : [UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:setting.colorTitle ? setting.colorTitle : [UIColor whiteColor] forState:UIControlStateDisabled];
    if (setting.indexStart > 0)
    {
        self.backgroundColor = setting.colorDisable ? setting.colorDisable : [UIColor lightGrayColor];
//        [self setEnabled:NO];
        NSString* title = [NSString stringWithFormat:@"   %@%d%@   ",(setting.strPrefix ? setting.strPrefix : @"关闭"),setting.indexStart,(setting.strSuffix ? setting.strSuffix : @"")];
        NSLog(@"%@",title);
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateDisabled];

        __weak typeof (self) wSelf = self;
        [UIView animateWithDuration:1 animations:^{
            self.titleLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
            self.titleLabel.alpha     = 0.0;
        } completion:^(BOOL b){
            setting.indexStart--;
            [wSelf scale:setting];
        }];
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
