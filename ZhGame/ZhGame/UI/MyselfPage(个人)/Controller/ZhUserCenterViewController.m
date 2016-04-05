//
//  ZhUserCenterViewController.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/1.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserCenterViewController.h"
#import "ZhUserCenterItemModel.h"
#import "ZhUserCenterSectionModel.h"
#import "ZhUserCenterInfoCell.h"
#import "ZhUserHeaderView.h"
#import "ZhHeaderModel.h"
#import "ZhMainViewManager.h"
#import "ZhUserInfo.h"
#import "UIImageView+ZhWebImage.h"
#import "ZhMyselfService.h"
@interface ZhUserCenterViewController ()<ZhUserHeaderDelegate>
@property (nonatomic, strong) NSArray               *sectionArray;                    //section模型数组
@property (nonatomic, strong) ZhUserHeaderView      *userHeaderView;
@property (nonatomic, strong) ZhMyselfService       *infoService;
@end

@implementation ZhUserCenterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"个人";
    self.view.backgroundColor = [UIColor colorWithRed:223 green:223 blue:223 alpha:1];
    [self setupItem];
    
    self.tableView.tableHeaderView= _userHeaderView;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupItem
{
    ZhUserCenterItemModel *item1 = [[ZhUserCenterItemModel alloc]init];
    item1.titleName = @"用户昵称";
    [item1 addTarget:self action:@selector(item1click) forControlEvents:ZhUserCenterItemEventClick];
//    item1.titleImage = [UIImage imageNamed:@"icon-list01"];
    
    item1.accessoryType = ZhSettingAccessoryTypeNone;
    
    ZhUserCenterSectionModel *section1 = [[ZhUserCenterSectionModel alloc]init];
    section1.sectionHeaderHeight = 5;
    section1.itemArray = @[item1];
    
    ZhUserCenterItemModel *item2 = [[ZhUserCenterItemModel alloc]init];
    item2.titleName = @"性别";
//    item2.titleImage = [UIImage imageNamed:@"icon-list01"];
    item2.accessoryType = ZhSettingAccessoryTypeNone;
    
    ZhUserCenterSectionModel *section2 = [[ZhUserCenterSectionModel alloc]init];
    section2.sectionHeaderHeight = 5;
    section2.itemArray = @[item2];
    
    ZhUserCenterItemModel *item3 = [[ZhUserCenterItemModel alloc]init];
    item3.titleName = @"地区";
//    item3.titleImage = [UIImage imageNamed:@"icon-list01"];
    
    item3.accessoryType = ZhSettingAccessoryTypeNone;

    ZhUserCenterSectionModel *section3 = [[ZhUserCenterSectionModel alloc]init];
    section3.sectionHeaderHeight = 5;
    section3.itemArray = @[item3];
    
    ZhUserCenterItemModel *item4 = [[ZhUserCenterItemModel alloc]init];
    item4.titleName = @"注册时间";
    item4.accessoryType = ZhSettingAccessoryTypeNone;

    ZhUserCenterSectionModel *section4 = [[ZhUserCenterSectionModel alloc]init];
    section4.sectionHeaderHeight = 5;
    section4.itemArray = @[item4];
    self.sectionArray = @[section1,section2,section3,section4];

    if (!self.infoService) {
        self.infoService = [[ZhMyselfService alloc] init];
    }
    
    
    
    ZhHeaderModel *info =  [[ZhHeaderModel alloc] init];
    
   
    _userHeaderView= [[ZhUserHeaderView alloc] init];
    _userHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    _userHeaderView.info = info;
    _userHeaderView.delegate = self;
    [self.infoService ZhGetLoginStats:^(BOOL isLogin, NSString *title) {
        if (isLogin) {
            [self.infoService ZhGetUserInfo:^(BOOL isLogin, NSString *title) {
                if (isLogin) {
                    item1.detailText = [ZhUserInfo shareInstance].userNickName;
                    item2.detailText = [ZhUserInfo shareInstance].userSex;
                    item3.detailText = [ZhUserInfo shareInstance].userDes;
                    item4.detailText = [ZhUserInfo shareInstance].userCreatetime;
                    //        info.header = [UIImage setweb:@"logo"];
                    UIImageView * imagehead = [[UIImageView alloc] init];
                    [imagehead setWebImage:API_IMAGER_URL(@"start.png") placeHolder:[UIImage imageNamed:@"logo"] downloadFlag:100];
                    info.header = imagehead.image;
                    info.UserInfo = [ZhUserInfo shareInstance].userNickName;
                    info.bShowLogin = NO;
                }
                else
                {
                    info.UserInfo = @"登陆｜注册";
                    info.bShowLogin = YES;
                }
            }];
        }
        else
        {
            info.UserInfo = @"登陆｜注册";
            info.bShowLogin = YES;
        }
    }];
}

-(void)item1click
{
    NSLog(@"1111");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZhUserCenterSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    ZhUserCenterSectionModel *sectionModel = self.sectionArray[indexPath.section];
    ZhUserCenterItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    ZhUserCenterInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ZhUserCenterInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    ZhUserCenterSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZhUserCenterSectionModel *sectionModel = self.sectionArray[indexPath.section];
    ZhUserCenterItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.events == ZhUserCenterItemEventClick) {
         [itemModel.target performSelector:itemModel.action];
    }
}

//uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    ZhUserCenterSectionModel *sectionModel = [self.sectionArray firstObject];
    CGFloat sectionHeaderHeight = sectionModel.sectionHeaderHeight;
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

-(void)ZhUserHeaderShowLogin
{
    [[ZhMainViewManager shareInstance] doShowLoginView];
}
@end
