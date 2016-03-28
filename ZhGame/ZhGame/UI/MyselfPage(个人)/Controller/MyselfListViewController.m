//
//  MyselfListViewController.m
//  AMomentDemo
//
//  Created by lanou3g on 15/12/17.
//  Copyright © 2015年 syx. All rights reserved.
//

#import "MyselfListViewController.h"
#import "ZhLoginViewController.h"
#import "LHCustomModalTransition.h"
#import "UIViewController+MMDrawerController.h"
#import "Zh1ViewController.h"
#import "MMDrawerController.h"
#import "ZhRootViewController.h"
#import "ZhPublicDef.h"
#import "Masonry.h"
#import "ZhUserInfoView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width / 3 * 2

@interface MyselfListViewController ()<UITableViewDelegate,UITableViewDataSource,ZhLoginDelegate>{

    UITableView * _menuTableView;
    NSArray * _menuArray;
    NSArray * _picArray;
    
    UIView * myselfView;
    UIImageView * headImageView ;
    UIButton * loginButton;
    UIView  *loginName;
    UIButton * logoutBtn;
    UIButton * likeButton;
    UIButton * talkButton;
    UIButton * writeButton;
    UISearchBar * searchBar;
    BOOL          isLoginSuccess;
    
}

@property (nonatomic, strong) LHCustomModalTransition *transition;
@end

@implementation MyselfListViewController


- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];

    _menuArray = [NSArray new];
    _picArray = [NSArray new];

    [self setupUI];
    
    [super viewDidLoad];

}

- (void)setupUI{
    
    _menuArray = @[@"我的纪录",@"充值"];
    _picArray = @[@"zhuye",@"diantai"];
    
    _menuTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    _menuTableView.separatorColor = [UIColor colorWithRed:74 / 256.0 green:74 / 256.0 blue:74 / 256.0 alpha:1];
    [self.view addSubview:_menuTableView];
    
    ZhUserInfoView *view = [[ZhUserInfoView alloc]  initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    view.delegate = self;
    view.backgroundColor = [UIColor whiteColor];
    [_menuTableView setTableHeaderView:view];

}

#pragma mark - ButtonAction
- (void)ZhStartlogin{
    
    Zh1ViewController * center = [[Zh1ViewController alloc] init];
    UINavigationController * nav = [[ZhRootViewController alloc] initWithRootViewController:center];
    [self.mm_drawerController setCenterViewController:nav
                               withFullCloseAnimation:YES
                                           completion:nil];
    ZhLoginViewController *modalVC = [ZhLoginViewController new];
    
    UINavigationController * nav1= [[UINavigationController alloc] initWithRootViewController:modalVC];
    
    [self presentViewController:nav1 animated:YES completion:nil];
}

# pragma mark - Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * const identifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _menuArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.imageView.image = [UIImage imageNamed:_picArray[indexPath.row]];
//    cell.backgroundColor = [UIColor colorWithRed:74 / 256.0 green:74 / 256.0 blue:74 / 256.0 alpha:1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    UIViewController * viewController = [UIViewController new];
//    switch (indexPath.row) {
//        case 0:{
//            
////            viewController = [HomeViewController new];
//            
//            break;
//        }
//        case 1:{
//            
//            break;
//        }
//        case 2:{
//            
//            break;
//        }
//        case 3:{
//            
//            break;
//        }
//        case 4:{
//            
//            break;
//        }
//        case 5:{
//            
//            break;
//        }
//        case 6:{
//            
//            break;
//        }
//        case 7:{
//            
//            break;
//        }
//            
//        default:
//            break;
//    }
    
//    RootViewController * rootNC = [[RootViewController alloc]initWithRootViewController:viewController];
//    
//    [self.mainViewController.view removeFromSuperview];
//    
//    [self setValue:rootNC forKey:@"mainViewController"];
//    
//    [self refreshView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
