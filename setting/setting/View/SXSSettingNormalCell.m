//
//  SXSSettingNormalCell.m
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSettingNormalCell.h"
#import "UIView+Extension.h"
@implementation SXSSettingNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel * descpritionTempLabel  = [[UILabel alloc]init];
        [self.contentView addSubview:descpritionTempLabel];
        descpritionTempLabel.font = [UIFont systemFontOfSize:16];
        self.descpritionLabel = descpritionTempLabel;
        
        UIImageView * arrowTempImage = [[UIImageView alloc]init];
        arrowTempImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:arrowTempImage];
        self.arrowImage = arrowTempImage;
        
        UILabel * lineTempLabel = [[UILabel alloc]init];
        lineTempLabel.backgroundColor = [UIColor lightGrayColor];

        [self.contentView addSubview:lineTempLabel];
        self.lineLabel = lineTempLabel;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.descpritionLabel sizeToFit];
    self.descpritionLabel.frame = CGRectMake(10.0, (self.height-self.descpritionLabel.height)/2.0, self.descpritionLabel.width, self.descpritionLabel.height);
//    [self.arrowImage sizeToFit];
    self.arrowImage.frame = CGRectMake(UI_SCREEN_WIDTH-10.0-20, (self.height-20)/2.0, 20, 20);
    _lineLabel.frame = CGRectMake(10.0, self.height-1.0, UI_SCREEN_WIDTH-20.0, 1.0);
}
@end
