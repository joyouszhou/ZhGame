//
//  Zh5TableViewController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "Zh5TableViewController.h"
#import "AppDelegate.h"
@interface Zh5TableViewController ()

@end

@implementation Zh5TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 200, 300);
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)doBack
{
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.tabBar showCenterViewController:NO animated:YES];
}

@end
