//
//  SXSChooseBankCardCell.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSChooseBankCardCell.h"
@interface SXSChooseBankCardCell()
@property(nonatomic,weak)UIImageView * bank;
@property(nonatomic,weak)UILabel * bigTitle;
@property(nonatomic,weak)UILabel * smallTitle;
@property(nonatomic,weak)UILabel * line;
@property(nonatomic,weak)UIButton * choose;
@end
@implementation SXSChooseBankCardCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self configCell];
    }
    return self;
}
- (void)configCell
{
    UIImageView * bank = [UIImageView new];
    bank.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:bank];
    self.bank = bank;
    
    UILabel *bigTitle = [UILabel new];
    bigTitle.text = @"中国人民银行";
    bigTitle.textColor = [UIColor blackColor];
    bigTitle.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:bigTitle];
    self.bigTitle = bigTitle;
    
    UILabel *smallTitle = [UILabel new];
    smallTitle.text = @"你在这存了10亿";
    smallTitle.textColor = [UIColor lightGrayColor];
    smallTitle.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:smallTitle];
    self.smallTitle = smallTitle;
   
    UILabel * line = [UILabel new];
    line.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    [self.contentView addSubview:line];
    self.line = line;
    
    UIButton * choose = [UIButton new];
    choose.backgroundColor = [UIColor yellowColor];
    [choose setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];//未选中标记
    [choose setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];//选中标记
    [self.contentView addSubview:choose];
    self.choose = choose;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bank.frame = CGRectMake(10, (self.contentView.height - 50)*0.5, 50, 50);
    
    [self.bigTitle sizeToFit];
    self.bigTitle.frame = CGRectMake(self.bank.right+10, 15, self.bigTitle.width, self.bigTitle.height);
    
    [self.smallTitle sizeToFit];
    self.smallTitle.frame = CGRectMake(self.bigTitle.x, self.bigTitle.bottom+15, self.smallTitle.width, self.smallTitle.height);
    if(_isLast)
    {
         self.line.frame = CGRectMake(0, self.contentView.height-1, self.contentView.width, 1);
    }
    else
    {
        self.line.frame = CGRectMake(self.bank.right+10, self.height-1, self.width-(self.bank.right+10+10), 1);

    }
    
    self.choose.frame = CGRectMake(self.contentView.right-25, (self.contentView.height - 15) * 0.5, 15, 15);
}
@end
