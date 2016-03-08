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

#define WIDTH [UIScreen mainScreen].bounds.size.width / 3 * 2

@interface MyselfListViewController ()<UITableViewDelegate,UITableViewDataSource>{

    UITableView * _menuTableView;
    NSArray * _menuArray;
    NSArray * _picArray;
    
    UIView * myselfView;
    UIImageView * headImageView ;
    UIButton * loginButton;
    UIButton * downloadButton;
    UIButton * likeButton;
    UIButton * talkButton;
    UIButton * writeButton;
    UISearchBar * searchBar;
    
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
    
    
    
    UIView * view = ({
        
        // 背景
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:view.frame];
        imageView.image = [UIImage imageNamed:@"GrayBackView"];
        [view addSubview:imageView];
        
        // 放个人信息的view
        myselfView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 100)];
        [view addSubview:myselfView];
        
        headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 80, 80)];
        headImageView.layer.cornerRadius = headImageView.frame.size.width / 2;
        headImageView.image = [UIImage imageNamed:@"logo"];
        [myselfView addSubview:headImageView];
        
        loginButton = [[UIButton alloc]initWithFrame:CGRectMake(85, 30, WIDTH - 90, 40)];
        [loginButton setTitle:@"登录 | 注册" forState:UIControlStateNormal];
        [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [myselfView addSubview:loginButton];
//      
//        downloadButton = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH - 80) / 5, 130, 20, 20)];
//        [downloadButton setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
//        [downloadButton addTarget:self action:@selector(downloadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:downloadButton];
//        
//        likeButton = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH - 80) / 5 * 2 + 20, 130, 20, 20)];
//        [likeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
//        [likeButton addTarget:self action:@selector(likeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:likeButton];
//        
//        talkButton = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH - 80) / 5 * 3 + 40, 130, 20, 20)];
//        [talkButton setImage:[UIImage imageNamed:@"talk"] forState:UIControlStateNormal];
//        [talkButton addTarget:self action:@selector(talkButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:talkButton];
//        
//        writeButton = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH - 80) / 5 * 4 + 60, 132, 18, 18)];
//        [writeButton setImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
//        [writeButton addTarget:self action:@selector(writeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//        [view addSubview:writeButton];
//        
//        searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 170, WIDTH , 30)];
//        searchBar.searchBarStyle = UISearchBarStyleProminent;
//        [view addSubview:searchBar];
        
        view;
    });
    
    [_menuTableView setTableHeaderView:view];

}

#pragma mark - ButtonAction
- (void)loginButtonAction:(UIButton *)button{

    NSLog(@"登录 | 注册");
    Zh1ViewController * center = [[Zh1ViewController alloc] init];
    
    UINavigationController * nav = [[ZhRootViewController alloc] initWithRootViewController:center];
    [self.mm_drawerController
     setCenterViewController:nav
     withFullCloseAnimation:YES
     completion:nil];
    
    ZhLoginViewController *modalVC = [ZhLoginViewController new];
    
    UINavigationController * nav1= [[UINavigationController alloc] initWithRootViewController:modalVC];
    
    [self presentViewController:nav1 animated:YES completion:nil];
    
    
}

- (void)downloadButtonAction:(UIButton *)button{

    NSLog(@"下载");
}

- (void)likeButtonAction:(UIButton *)button{

    NSLog(@"喜欢");
}

- (void)talkButtonAction:(UIButton *)button{

    NSLog(@"会话");
}

- (void)writeButtonAction:(UIButton *)button{

    NSLog(@"书写");
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
    UIViewController * viewController = [UIViewController new];
    switch (indexPath.row) {
        case 0:{
            
//            viewController = [HomeViewController new];
            
            break;
        }
        case 1:{
            
            break;
        }
        case 2:{
            
            break;
        }
        case 3:{
            
            break;
        }
        case 4:{
            
            break;
        }
        case 5:{
            
            break;
        }
        case 6:{
            
            break;
        }
        case 7:{
            
            break;
        }
            
        default:
            break;
    }
    
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
