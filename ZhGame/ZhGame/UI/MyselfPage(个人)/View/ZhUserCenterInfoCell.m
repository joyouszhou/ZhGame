//
//  XBSettingCell.m
//  ZhGame
//
//  Created by zhouhuan on 16/4/1.
//  Copyright © 2016年 zhouhuan. All rights reserved.
//

#import "ZhUserCenterInfoCell.h"
#import "ZhUserCenterItemModel.h"
#import "Masonry.h"
@interface ZhUserCenterInfoCell()
@property (strong, nonatomic) UILabel *TitleLabel;
@property (nonatomic,strong) UIImageView *titleImageView;

@property (nonatomic,strong) UIImageView *indicator;

@property (nonatomic,strong) UISwitch *aswitch;

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UIImageView *detailImageView;

@end
@implementation ZhUserCenterInfoCell

- (void)setItem:(ZhUserCenterItemModel *)item
{
    _item = item;
    [self updateUI];
}
#pragma mark -  初始化UI
//初始化UI
- (void)updateUI
{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
    
    [self.contentView addGestureRecognizer:tapGesture];
    
    self.contentView.layer.cornerRadius = 5;
    
    //如果有图片
    if (self.item.titleImage) {
        [self setupTitleImageView];
    }
    //功能名称
    if (self.item.titleName) {
        [self setupTitleLabel];
    }
    
    //accessoryType
    if (self.item.accessoryType) {
        [self setupAccessoryType];
    }
    //detailView
    if (self.item.detailText) {
        [self setupDetailText];
    }
    if (self.item.detailImage) {
        [self setupDetailImage];
    }
    
    //bottomLine
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 1, [UIScreen mainScreen].bounds.size.width, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
}
-(void)Actiondo:(id)sender{

    NSLog(@"点击了点击了");
    if (self.item.events == ZhUserCenterItemEventClick) {
        [self.item.target performSelector:self.item.action];
    }
}

//添加图片资源
- (void)setupTitleImageView
{
    self.titleImageView = [[UIImageView alloc] initWithImage:self.item.titleImage];
    
    [self.contentView addSubview:self.titleImageView];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
//        make.height.mas_equalTo(self.contentView.mas_height).multipliedBy(0.8);
//        make.width.mas_equalTo(self.contentView.mas_height).multipliedBy(0.8);
    }];
}

-(void)setupDetailImage
{
    self.detailImageView = [[UIImageView alloc] initWithImage:self.item.detailImage];
    
    switch (self.item.accessoryType) {
        case ZhSettingAccessoryTypeNone:
            
//            self.detailImageView.frame.origin.x = ([UIScreen mainScreen].bounds.size.width - self.detailImageView.frame.size.width - 13 - 2);
            break;
        case ZhSettingAccessoryTypeDisclosureIndicator:
//            self.detailImageView.frame.origin.x = self.indicator.frame.origin.x - self.detailImageView.frame.size.width - 13;
            break;
        case ZhSettingAccessoryTypeSwitch:
//            self.detailImageView.x = self.aswitch.x - self.detailImageView.width - XBDetailViewToIndicatorGap;
            break;
        default:
            break;
    }
//    [self.contentView addSubview:self.detailImageView];
}

- (void)setupDetailText
{
    self.detailLabel = [[UILabel alloc]init];
    self.detailLabel.text = self.item.detailText;
    self.detailLabel.textColor = [UIColor blackColor];
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    
    [self.contentView addSubview:self.detailLabel];
    switch (self.item.accessoryType) {
        case ZhSettingAccessoryTypeNone:
        {
            [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.contentView.mas_right).with.offset(-20);
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.size.mas_equalTo([self sizeForTitle:self.item.detailText withFont:self.detailLabel.font]);
            }];
        }
            break;
        case ZhSettingAccessoryTypeDisclosureIndicator:
        {
            [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.indicator.mas_left).with.offset(-15);
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.size.mas_equalTo([self sizeForTitle:self.item.detailText withFont:self.detailLabel.font]);
            }];
        }
            break;
        case ZhSettingAccessoryTypeSwitch:
        {
            [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.aswitch.mas_left).with.offset(-15);
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.size.mas_equalTo([self sizeForTitle:self.item.detailText withFont:self.detailLabel.font]);
            }];
            break;
        }
        default:
            break;
    }
}


- (void)setupAccessoryType
{
    switch (self.item.accessoryType) {
        case ZhSettingAccessoryTypeNone:
            break;
        case ZhSettingAccessoryTypeDisclosureIndicator:
            [self setupIndicator];
            break;
        case ZhSettingAccessoryTypeSwitch:
            [self setupSwitch];
            break;
        default:
            break;
    }
}

- (void)setupSwitch
{
    [self.contentView addSubview:self.aswitch];
    [_aswitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-5);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (void)setupIndicator
{
    [self.contentView addSubview:self.indicator];
    [_indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).with.offset(-5);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}



- (void)setupTitleLabel
{
    self.TitleLabel = [[UILabel alloc]init];
    self.TitleLabel.text = self.item.titleName;
    self.TitleLabel.textColor = [UIColor blackColor];
    self.TitleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.TitleLabel];
    [self.TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.titleImageView.mas_right).with.offset(15);
        make.size.mas_equalTo([self sizeForTitle:self.item.titleName withFont:self.TitleLabel.font]);
    }];
}

- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}

- (UIImageView *)indicator
{
    if (!_indicator) {
        _indicator = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-arrow1"]];
       
    }
    return _indicator;
}

- (UISwitch *)aswitch
{
    if (!_aswitch) {
        _aswitch = [[UISwitch alloc]init];
        [_aswitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
    }
    return _aswitch;
}

- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    NSString * str  = [NSString stringWithFormat:@"%d",weakSelf.aswitch.isOn];
    if (self.item.events == ZhUserCenterItemEventSwitch) {
        [self.item.target performSelector:self.item.action withObject:str];
    }
}

@end
