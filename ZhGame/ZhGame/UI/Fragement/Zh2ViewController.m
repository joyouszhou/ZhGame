//
//  Zh2ViewController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "Zh2ViewController.h"
#import "Masonry.h"

@interface Zh2ViewController ()

@end

@implementation Zh2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor =  [UIColor colorWithRed:221 green:211 blue:254 alpha:0.9];
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    b.backgroundColor = [UIColor blueColor];
    b.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:b];
    
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
