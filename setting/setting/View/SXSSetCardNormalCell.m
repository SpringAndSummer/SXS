//
//  SXSSetCardNormalCell.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSetCardNormalCell.h"

@implementation SXSSetCardNormalCell
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
    UILabel * name = [UILabel new];
    name.font = [UIFont systemFontOfSize:14];
    name.textColor = [UIColor blackColor];
    [self.contentView addSubview:name];
    self.name = name;
    
    UILabel * detail = [UILabel new];
    detail.font = [UIFont systemFontOfSize:14];
    detail.textColor = [UIColor blackColor];
    [self.contentView addSubview:detail];
    self.detail = detail;

    UIImageView * arrow = [UIImageView new];
    arrow.backgroundColor = [UIColor redColor];
    arrow.image = [UIImage imageNamed:@""];
    [self.contentView addSubview:arrow];
    self.arrow = arrow;
    
    UILabel * line = [UILabel new];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    self.line = line;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self.name sizeToFit];
    self.name.frame = CGRectMake(10, (self.height-self.name.height)*0.5, self.name.width, self.name.height);
    [self.detail sizeToFit];
    self.detail.frame = CGRectMake(self.name.right + 20, self.name.y, self.detail.width, self.detail.height);
    self.arrow.frame = CGRectMake(self.width-24, (self.height - 14)*0.5, 14, 14);
    self.line.frame = CGRectMake(10, self.contentView.height-1, self.width-20, 1);
}
@end









