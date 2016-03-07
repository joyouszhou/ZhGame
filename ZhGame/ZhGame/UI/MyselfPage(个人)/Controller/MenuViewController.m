//
//  MenuViewController.m
//  DrawerSample
//
//  Created by sYx. on 15/12/14.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import "MenuViewController.h"
//#import "MainViewController.h"

@interface MenuViewController ()

@property (strong, nonatomic) UIPanGestureRecognizer * backPan;

@end

@implementation MenuViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (instancetype)initWithViewController:(UIViewController *)vc {
    
    self = [super init];
    
    if (self) {
        
        _mainViewController = vc;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self refreshView];
}

// 刷新视图
- (void)refreshView{

    // 将外部传值的MainVC的跟视图添加到当前MenuVC的跟视图上
    [self.view addSubview:self.mainViewController.view];
    
//    [self.view setBackgroundColor:[UIColor magentaColor]];
    
    // 屏幕边缘滑动手势识别器
    UIScreenEdgePanGestureRecognizer * screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewSlid:)];
    
    [screenEdgePan setEdges:UIRectEdgeLeft];
    
    [self.mainViewController.view addGestureRecognizer:screenEdgePan];
    
    self.backPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewSlid:)];
    
    [self.mainViewController.view addGestureRecognizer:self.backPan];
    
    [self.backPan setEnabled:NO];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemPlay) target:self action:@selector(drawerShow)];

}

- (BOOL)isShowing {
    
    if (self.mainViewController.view.frame.origin.x == 0) {
        
        return NO;
    }
    return YES;
}

- (void)drawerShow {
    
    [self.backPan setEnabled:YES];
    self.mainViewController.view.backgroundColor = [UIColor redColor];
    [self.mainViewController.view setFrame:CGRectMake(kDrawerOffset, 0, self.view.frame.size.width, self.view.frame.size.height)];
}

- (void)drawerHide {
    
    [self.backPan setEnabled:NO];
    
    [self.mainViewController.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}

- (void)viewSlid:(UIPanGestureRecognizer *)sender {

    CGFloat senderX;
    
    if (![self.backPan isEnabled]) {
        
        senderX = [sender translationInView:sender.view].x;
        
    } else {
       
        senderX = kDrawerOffset + [sender translationInView:sender.view].x;
    }
    
    if (sender.state == UIGestureRecognizerStateEnded || senderX < 0) {
        
        if (senderX > kDrawerOffset / 2) {
            
            [self drawerShow];
            
        } else {
            
            [self drawerHide];
        }
        
        return;
    }
    
    [self.mainViewController.view setFrame:CGRectMake(senderX, 0, self.view.frame.size.width, self.view.frame.size.height)];

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
