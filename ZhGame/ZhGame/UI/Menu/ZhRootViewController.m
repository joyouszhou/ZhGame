//
//  ZhRootViewController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhRootViewController.h"
#import "AppDelegate.h"
#import "MyselfListViewController.h"

@interface ZhRootViewController ()
{
    NSArray * _viewControllArr;  // 存放所有视图控制器数组
    NSArray * _titleArr;
}

@end

@implementation ZhRootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupLeftUI];
    
    [self setupRightUI];
    
    
}

- (void)setupLeftUI{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 44, 44)];
    [self.view addSubview:view];
    
    UIImageView * menuImage = [[UIImageView alloc]initWithFrame:CGRectMake(8, 6, 28, 28)];
    menuImage.image = [UIImage imageNamed:@"RightButton"];
    menuImage.userInteractionEnabled = YES;
    [view addSubview:menuImage];
    
    UIButton * menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [menuButton setFrame:CGRectMake(0, 0, 44, 64)];
    [menuButton addTarget:self action:@selector(didBarButtonItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:menuButton];
    
    UIView * borderView = [[UIView alloc]initWithFrame:CGRectMake(44, 20, 1, 44)];
    borderView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:borderView];
    
    UILabel * dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, 80, 44)];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.text = @"日期";
    [self.view addSubview:dateLabel];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)setupRightUI{
    
    
    
}

- (void)didBarButtonItemClicked:(id)sender {
    
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
    
    MyselfListViewController * menuVC = appDelegate.leftVc;
    
    if (menuVC.showing) {
        
        [menuVC drawerHide];
        
        return;
    }
    
    [menuVC drawerShow];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
