//
//  SXSSettingHeadCell.m
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSettingHeadCell.h"

@implementation SXSSettingHeadCell


{
    UILabel * _lineLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = RGB(255, 81, 83);
        UIImageView * headIconTemp  = [[UIImageView alloc]init];
        [self.contentView addSubview:headIconTemp];
        headIconTemp.layer.borderWidth = 0.5;
        headIconTemp.layer.cornerRadius = 5.0;
        headIconTemp.layer.masksToBounds = YES;
        self.headIcon = headIconTemp;
        
        UILabel * iphoneTemp = [[UILabel alloc]init];
        [self.contentView addSubview:iphoneTemp];
        iphoneTemp.font = [UIFont systemFontOfSize:14];
        self.iphoneLabel = iphoneTemp;
        
        UILabel * authenticationOrBindingTemp = [[UILabel alloc]init];
        [self.contentView addSubview:authenticationOrBindingTemp];
        self.authenticationOrBindingLabel = authenticationOrBindingTemp;
        
        UIButton * authenticationOrBindingTempButton = [[UIButton alloc]init];
        authenticationOrBindingTempButton.titleLabel.font = [UIFont systemFontOfSize:13];
        authenticationOrBindingTempButton.layer.cornerRadius = 8.0;
        authenticationOrBindingTempButton.layer.borderColor = [UIColor whiteColor].CGColor;
        authenticationOrBindingTempButton.layer.masksToBounds =YES;
        [self.contentView addSubview:authenticationOrBindingTempButton];
        
        self.authenticationOrBindingStateButton = authenticationOrBindingTempButton;
        
        
        
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_lineLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headIcon.frame = CGRectMake(10.0, (self.height-30.0)/2.0, 30.0, 30.0);
    
    [self.iphoneLabel sizeToFit];
    self.iphoneLabel.frame = CGRectMake(self.headIcon.x+self.headIcon.width+20.0, self.headIcon.y+10.0, self.iphoneLabel.width, self.headIcon.height);
    
    [self.authenticationOrBindingLabel sizeToFit];
    self.authenticationOrBindingLabel.frame = CGRectMake(self.iphoneLabel.x, self.iphoneLabel.y+self.iphoneLabel.height+10.0, self.authenticationOrBindingLabel.width, self.authenticationOrBindingLabel.height);
    
    [self.authenticationOrBindingStateButton sizeToFit];
    self.authenticationOrBindingStateButton.frame = CGRectMake(UI_SCREEN_WIDTH-10.0-self.authenticationOrBindingStateButton.width, self.authenticationOrBindingLabel.y, self.authenticationOrBindingStateButton.width, self.authenticationOrBindingStateButton.height);
    
    
    _lineLabel.frame = CGRectMake(10.0, self.height, UI_SCREEN_WIDTH-20.0, 1.0);
}



@end
