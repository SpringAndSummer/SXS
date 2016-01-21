//
//  SXSSetCardImageCodeCell.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSetCardImageCodeCell.h"
#import "PooCodeView.h"

@interface SXSSetCardImageCodeCell()
@property(nonatomic,weak)UITextField * inputCode;
@property(nonatomic,weak)PooCodeView * imageCode;
@property(nonatomic,weak)UILabel * line;
@end
@implementation SXSSetCardImageCodeCell
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
    inputCode.placeholder = @"图形验证码";
    inputCode.font = [UIFont systemFontOfSize:14];
    inputCode.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:inputCode];
    self.inputCode = inputCode;
    
    PooCodeView * imageCode = [PooCodeView new];
    [self.contentView addSubview:imageCode];
    self.imageCode = imageCode;
    
    UILabel * line = [UILabel new];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.line = line;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.inputCode.frame = CGRectMake(10, 0, self.width-110, self.height);
    self.imageCode.frame = CGRectMake(self.inputCode.right+10, (self.height-30)*0.5, 80, 30);
    self.line.frame = CGRectMake(0, self.contentView.height-1, self.width, 1);
}

@end
