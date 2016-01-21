//
//  SXSSettingSwitchCell.m
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSSettingSwitchCell.h"
#import "UIView+Extension.h"
@interface SXSSettingSwitchCell()<MBSwitchDelegate>
@end
@implementation SXSSettingSwitchCell
{
    UILabel * _lineLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel * descpritionTempLabel  = [[UILabel alloc]init];
        descpritionTempLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:descpritionTempLabel];
        self.descpritionLabel = descpritionTempLabel;
        
        MBSwitch * ifSwitchTemp = [[MBSwitch alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
        ifSwitchTemp.delegate = self;
        ifSwitchTemp.onTintColor = [[UIColor redColor]colorWithAlphaComponent:0.7];//打开时候的颜色
        ifSwitchTemp.tintColor = [[UIColor blueColor]colorWithAlphaComponent:0.9];//边框
        
    
        [ifSwitchTemp setOnImageNamed:@"on"];
        [ifSwitchTemp setOffImageNamed:@"off"];
        [self.contentView addSubview:ifSwitchTemp];
        self.ifSwitch = ifSwitchTemp;
        
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_lineLabel];
        
        //
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.descpritionLabel sizeToFit];
    self.descpritionLabel.frame = CGRectMake(10.0, (self.height-self.descpritionLabel.height)/2.0, self.descpritionLabel.width, self.descpritionLabel.height);
    
    self.ifSwitch.frame = CGRectMake(UI_SCREEN_WIDTH-10.0-50, (self.contentView.height - 30) * 0.5, 50, 30);
    _lineLabel.frame = CGRectMake(10.0, self.height-1.0, UI_SCREEN_WIDTH-20.0, 1.0);
}

//switch的响应事件
- (void)mbSwitchChange:(BOOL)isOn
{
    [self.delegate setGesterPassword:isOn];
}
@end
