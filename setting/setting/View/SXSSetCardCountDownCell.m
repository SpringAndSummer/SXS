
//
//  SXSSetCardCountDownCell.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSetCardCountDownCell.h"
#import "UIButton+countDown.h"

@interface SXSSetCardCountDownCell()
@property(nonatomic,weak)UITextField * inputCode;
@property(nonatomic,weak)UIButton * countDown;
@property(nonatomic,weak)UILabel * line;
@end
@implementation SXSSetCardCountDownCell
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
    UITextField * inputCode = [UITextField new];
    inputCode.placeholder = @"短信验证码";
    inputCode.font = [UIFont systemFontOfSize:14];
    inputCode.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:inputCode];
    self.inputCode = inputCode;
    
    UIButton * countDown = [UIButton new];
    countDown.backgroundColor = [UIColor greenColor];
    [countDown setTitle:@"获取验证码" forState:UIControlStateNormal];
    [countDown addTarget:self action:@selector(countDownClick) forControlEvents:UIControlEventTouchUpInside];
    countDown.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:countDown];
    self.countDown = countDown;
    
    UILabel * line = [UILabel new];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.line = line;
}
- (void)countDownClick
{
    [self.countDown startWithTime:60 title:@"获取验证码" countDownTitle:@"等待" mainColor:[UIColor greenColor] countColor:[UIColor greenColor]];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.inputCode.frame = CGRectMake(10, 0, self.width-110, self.height);
    self.countDown.frame = CGRectMake(self.inputCode.right+10, (self.height-30)*0.5, 80, 30);
    self.line.frame = CGRectMake(0, self.contentView.height-1, self.width, 1);
}

@end
