//
//  SXSCardListcell.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSCardListcell.h"
@interface SXSCardListcell()
@property(nonatomic,weak)UIImageView * cardBg;//背景
@property(nonatomic,weak)UILabel * cardName;//卡名字
@property(nonatomic,weak)UILabel * cardNumber;//卡号
@property(nonatomic,weak)UIImageView * unionPay;//银联标识

@end
@implementation SXSCardListcell
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
    self.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView * cardBg = [UIImageView new];
    cardBg.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:cardBg];
    self.cardBg = cardBg;
    
    UILabel * cardName = [UILabel new];
    cardName.text = @"曹操的银行卡";
    cardName.font = [UIFont systemFontOfSize:14];
    cardName.textColor = [UIColor whiteColor];
    [self.contentView addSubview:cardName];
    self.cardName = cardName;
    
    UILabel * cardNumber = [UILabel new];
    cardNumber.text = @"9999 9999 9999 9999";
    cardNumber.font = [UIFont systemFontOfSize:14];
    cardNumber.textColor = [UIColor whiteColor];
    [self.contentView addSubview:cardNumber];
    self.cardNumber = cardNumber;
    
    UIImageView * unionPay = [UIImageView new];
    unionPay.backgroundColor = [UIColor yellowColor];
    unionPay.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:unionPay];
    self.unionPay = unionPay;

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.cardBg.frame = CGRectMake(10, 10, self.contentView.width-20, self.contentView.height-20);
    
    [self.cardName sizeToFit];
    self.cardName.frame = CGRectMake(80, self.cardBg.y+20, self.cardName.width, self.cardName.height);
    
    [self.cardNumber sizeToFit];
    self.cardNumber.frame = CGRectMake(self.cardName.x, self.cardName.bottom+20, self.cardNumber.width, self.cardNumber.height);
    self.unionPay.frame = CGRectMake(self.cardBg.right-50, self.cardBg.bottom-50, 40, 40);
}
@end
