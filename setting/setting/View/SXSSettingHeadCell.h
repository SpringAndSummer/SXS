//
//  SXSSettingHeadCell.h
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSBaseTableViewCell.h"
//头部cell
@interface SXSSettingHeadCell : SXSBaseTableViewCell
@property (nonatomic,weak)UIImageView * headIcon;//头像
@property (nonatomic,weak)UILabel * iphoneLabel;//电话号码
@property (nonatomic,weak)UILabel * authenticationOrBindingLabel;//认证成功后显示绑定提示
@property (nonatomic,weak)UIButton * authenticationOrBindingStateButton;//认证或者绑定提示按钮

@end
