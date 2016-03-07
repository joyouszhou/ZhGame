//
//  ZhUCView.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUCView.h"

@implementation ZhUCView


-(instancetype)initWithSize:(CGRect)rect
{
//    CGRect leftFrme =rect;
//    leftFrme.origin.y = 100;
//    UITableView *tableView = [[UITableView alloc]initWithFrame:leftFrme style:UITableViewStylePlain];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    NSArray *array = @[@"menu1",@"menu2",@"menu3",@"menu4",@"menu5",@"menu6",@"menu7",@"menu8",@"menu9",@"menu10"];
//    [self.dataSource addObjectsFromArray:array];
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}



@end
