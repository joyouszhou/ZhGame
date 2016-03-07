//
//  ZhUCView.h
//  LearnDemo
//
//  Created by zhouhuan on 16/3/7.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhUCView : UIView
<
UITableViewDataSource,UITableViewDelegate
>
@property (nonatomic,strong)NSMutableArray *dataSource;

-(instancetype)initWithSize:(CGRect)rect;

@end
