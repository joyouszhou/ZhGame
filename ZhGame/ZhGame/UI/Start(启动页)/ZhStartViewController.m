//
//  ZhStartViewController.m
//  ZhGame
//
//  Created by zhouhuan on 16/3/30.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhStartViewController.h"
#import "ZhPublicDef.h"
#import "Masonry.h"
#import "ZhCountBtn.h"
#import "ZhMainViewManager.h"
#import "ZhUserDbManager.h"
#import "UIImageView+ZhWebImage.h"
#import "ZhStartService.h"



@interface ZhStartViewController ()<ZhCountBtnDeleget>
@property (nonatomic, strong)           UIImageView             *backgroundImageView;       //背景图片
@property (nonatomic, strong)           ZhCountBtn              *CloseBtn;                  //关闭按钮
@property (nonatomic, assign)           BOOL                    bDBUserFlag;                //数据库初始化方法结果
@property (nonatomic, strong)           ZhStartService          *service;                   //服务
@end

@implementation ZhStartViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.service = [[ZhStartService alloc] init];
    if ([[ZhUserDbManager shareInstance] getUserInfo]) {
        self.bDBUserFlag = true;
        [self.service ZhStartLogin];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backgroundImageView];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(self.view.mas_height);
    }];
    
    [self.view addSubview:self.CloseBtn];
    [self.CloseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).with.offset(40);
        make.left.mas_equalTo(self.view.mas_right).with.offset(-90);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    ZhCountBtnSetting* setting = [[ZhCountBtnSetting alloc] init];
    setting.strPrefix = @"";
    setting.strSuffix = @"跳过";
    setting.strCommon = @"";
    setting.indexStart = 4;
    setting.colorDisable = [UIColor whiteColor];
    setting.colorTitle =[UIColor blackColor];
    self.bDBUserFlag = false;
    [_CloseBtn startWithSetting:setting];
    self.service = [[ZhStartService alloc] init];
    if ([[ZhUserDbManager shareInstance] getUserInfo]) {
        self.bDBUserFlag = true;
        [self.service ZhStartLogin];
    }
}

-(UIImageView *)backgroundImageView
{
    if (_backgroundImageView) {
        return _backgroundImageView;
    }
    _backgroundImageView = [[UIImageView alloc] init];
    UIImageView * imagehead = [[UIImageView alloc] init];
    [imagehead setWebImage:API_IMAGER_URL(@"start.png") placeHolder:[UIImage imageNamed:@"startImage.png"] downloadFlag:100];
    _backgroundImageView.image = imagehead.image;
    
    return _backgroundImageView;
}

-(ZhCountBtn *)CloseBtn
{
    if (_CloseBtn) {
        return _CloseBtn;
    }
    _CloseBtn = [[ZhCountBtn alloc] init];
    _CloseBtn.layer.cornerRadius = 0.4;
    _CloseBtn.layer.masksToBounds = YES;
    _CloseBtn.delegate = self;
    [_CloseBtn addTarget:self action:@selector(doCloseView) forControlEvents:UIControlEventTouchUpInside];
    return _CloseBtn;
}

-(void)doCloseView
{
    if (self.bDBUserFlag) {
        [[ZhMainViewManager shareInstance] doShowTabbarView];
    }
    else
    {
        [[ZhMainViewManager shareInstance] doShowLoginView];
    }
}

#pragma mark - 获取图片存储目录
/**
 *  获取当前
 *
 *  @return 当前catch目录，如果没有目录则返回nil
 */
-(NSString *)getCatchDir
{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * diskCachePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"imageCache"];
    //如果目录imageCache不存在，创建目录
    if (![[NSFileManager defaultManager] fileExistsAtPath:diskCachePath]) {
        NSError *error=nil;
        if (![[NSFileManager defaultManager] createDirectoryAtPath:diskCachePath withIntermediateDirectories:YES attributes:nil error:&error]) {
            return nil;
        };
    }
    return diskCachePath;
}
-(void)ZhCountBtnFinish
{
    if (self.bDBUserFlag) {
        [[ZhMainViewManager shareInstance] doShowTabbarView];
    }
    else
    {
        [[ZhMainViewManager shareInstance] doShowLoginView];
    }
}

@end
