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

@interface ZhStartViewController ()<ZhCountBtnDeleget>
@property (nonatomic, strong)           UIImageView             *backgroundImageView;       //背景图片
@property (nonatomic, strong)           ZhCountBtn              *CloseBtn;                  //关闭按钮

@end

@implementation ZhStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        make.left.mas_equalTo(self.view.mas_right).with.offset(-60);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    ZhCountBtnSetting* setting = [[ZhCountBtnSetting alloc] init];
    setting.strPrefix = @"";
    setting.strSuffix = @"";
    setting.strCommon = @"关闭";
    setting.indexStart = 4;
    setting.colorDisable = [UIColor whiteColor];
    setting.colorTitle =[UIColor blackColor];
    [_CloseBtn startWithSetting:setting];
}

-(UIImageView *)backgroundImageView
{
    if (_backgroundImageView) {
        return _backgroundImageView;
    }
    _backgroundImageView = [[UIImageView alloc] init];
    UIImage *image = [[UIImage alloc] initWithData:[self loadImageData]];
    _backgroundImageView.image = image;
    
    return _backgroundImageView;
}

-(ZhCountBtn *)CloseBtn
{
    if (_CloseBtn) {
        return _CloseBtn;
    }
    _CloseBtn = [[ZhCountBtn alloc] init];
    _CloseBtn.layer.cornerRadius = 5;
    _CloseBtn.layer.masksToBounds = YES;
    _CloseBtn.delegate = self;
    [_CloseBtn addTarget:self action:@selector(doCloseView) forControlEvents:UIControlEventTouchUpInside];
    return _CloseBtn;
}

-(void)doCloseView
{
    [[ZhMainViewManager shareInstance] showMainView];
}

-(NSData *)loadImageData
{
    //查询是否有catch目录
    NSString *catchDir = [self getCatchDir];
    if (catchDir  == nil && catchDir.length<=0) {
        return nil;
    }
    //判断当前catch目录下是否有文件
    NSString * imageFile = [catchDir stringByAppendingPathComponent:@"startimage.png"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageFile]) {
        _imgaeDate = [NSData dataWithContentsOfFile:imageFile];
    }
    else
    {
        UIImage *imageloacl =[UIImage imageNamed:@"startImage.png"];
        _imgaeDate = UIImagePNGRepresentation(imageloacl);//如果本地缓存没有，保存图片
        if (_imgaeDate) {
            [[NSFileManager defaultManager] createFileAtPath:imageFile contents:_imgaeDate attributes:nil];
            [_imgaeDate writeToFile:imageFile atomically:YES];
        }
    }
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:imageFile];
    [operationQueue addOperation:op];
    return _imgaeDate;
}
//下载图片
- (void)downloadImage:(NSString *)imageDir;
{

    NSData *imagedata = [NSData dataWithContentsOfURL:API_IMAGER_URL]; //如果本地缓存没有，保存图片
    if (imagedata) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:imageDir])
        {
            [[NSFileManager defaultManager] removeItemAtPath:imageDir error:nil];
            [imagedata writeToFile:imageDir atomically:YES];
        }
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
     // 完成，需要进行显示主页
    [[ZhMainViewManager shareInstance] showMainView];
}

@end
