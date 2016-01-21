//
//  SXSSettingSwitchCell.h
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSBaseTableViewCell.h"
#import "MBSwitch.h"
@protocol SXSSettingSwitchCellDelegate<NSObject>
- (void)setGesterPassword:(BOOL)isOn;
@end
//带开关的cell
@interface SXSSettingSwitchCell : SXSBaseTableViewCell
@property (nonatomic,weak)UILabel * descpritionLabel;//说明
@property (nonatomic,weak)MBSwitch * ifSwitch;//开关
@property(nonatomic,weak)id<SXSSettingSwitchCellDelegate>delegate;

@end
