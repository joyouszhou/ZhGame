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

@interface ZhUserCenterViewController ()
@property (nonatomic,strong) NSArray  *sectionArray;                    //section模型数组
@end

@implementation ZhUserCenterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"个人";
    self.view.backgroundColor = [UIColor colorWithRed:221 green:211 blue:254 alpha:0.9];
    [self setupItem];
    UIView * viewHead = [[UIView alloc] init];
    viewHead.backgroundColor= [UIColor whiteColor];
    viewHead.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    self.tableView.tableHeaderView= viewHead;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupItem
{
    ZhUserCenterItemModel *item1 = [[ZhUserCenterItemModel alloc]init];
    item1.titleName = @"用户昵称";
    [item1 addTarget:self action:@selector(item1click) forControlEvents:ZhUserCenterItemEventClick];
    item1.titleImage = [UIImage imageNamed:@"icon-list01"];
    item1.detailText = @"1112221122";
    item1.accessoryType = ZhSettingAccessoryTypeDisclosureIndicator;
    
    ZhUserCenterItemModel *item2 = [[ZhUserCenterItemModel alloc]init];
    item2.titleName = @"我的任务2";
    item2.titleImage = [UIImage imageNamed:@"icon-list01"];
    item2.accessoryType = ZhSettingAccessoryTypeDisclosureIndicator;
    ZhUserCenterSectionModel *section1 = [[ZhUserCenterSectionModel alloc]init];
    section1.sectionHeaderHeight = 18;
    section1.itemArray = @[item1,item2];
    
    ZhUserCenterItemModel *item3 = [[ZhUserCenterItemModel alloc]init];
    item3.titleName = @"设置";
    item3.titleImage = [UIImage imageNamed:@"icon-list01"];
   
    item3.accessoryType = ZhSettingAccessoryTypeDisclosureIndicator;
    
    ZhUserCenterSectionModel *section2 = [[ZhUserCenterSectionModel alloc]init];
    section2.sectionHeaderHeight = 18;
    section2.itemArray = @[item3];
    
    self.sectionArray = @[section1,section2];

    
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

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    ZhUserCenterSectionModel *sectionModel = self.sectionArray[indexPath.section];
//    ZhUserCenterItemModel *itemModel = sectionModel.itemArray[indexPath.row];
//    if (itemModel.events == ZhUserCenterItemEventClick) {
//         [itemModel.target performSelector:itemModel.action];
//    }
//}

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

@end
