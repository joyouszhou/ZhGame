//
//  Zh1ViewController.m
//  LearnDemo
//
//  Created by zhouhuan on 16/3/5.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "Zh1ViewController.h"
#include "Masonry.h"

@interface Zh1ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign)CGFloat width;
@property (nonatomic ,strong)NSArray *dataSource;
@end

@implementation Zh1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    _backTableView=[[UITableView alloc]init];
    _backTableView.delegate=self;
    _backTableView.dataSource=self;
    [self.view addSubview:_backTableView];
    [_backTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(self.view.bounds.size.width);
        make.height.mas_equalTo(self.view.bounds.size.height);
    }];
    _dataSource=@[@[@"back_sss.png"],
                  @[@"back_sss.png"]];
    
    UIImage *image=[UIImage imageNamed:@"male_001"];
    _width=image.size.width/5;
    
    
}
-(void)didTapNextButton
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_backTableView)
        return 1;
    else return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //    cell.imageView.image = [UIImage imageNamed:@"back_sss.png"];
    _secondTableView=[[UIImageView alloc]init];
    _secondTableView.image = [UIImage imageNamed:@"back_sss.png"];

    [cell addSubview:_secondTableView];
    [_secondTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cell.mas_top);
        make.left.mas_equalTo(cell.mas_left);
        make.width.mas_equalTo(self.view.bounds.size.width);
        make.height.mas_equalTo(cell.bounds.size.height);
        make.bottom.mas_equalTo(cell.mas_bottom);
    }];
    
//    if(indexPath.row+1<10)
//    {
//        cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"male_00%ld",indexPath.row+1]];
//    }
//    else
//        cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"male_0%ld",indexPath.row+1]];
    
    cell.selectionStyle=UITableViewCellSelectionStyleDefault;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_backTableView)
    {
        return 150;
    }
    else
    {return 25;}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
