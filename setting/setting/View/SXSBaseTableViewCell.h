//
//  SXSBaseTableViewCell.h
//  SXS
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 屏幕宽度 */
#define UI_SCREEN_WIDTH             ([[UIScreen mainScreen] bounds].size.width)
/** 屏幕高度 */
#define UI_SCREEN_HEIGHT            ([[UIScreen mainScreen] bounds].size.height)
/** 屏幕大小 */
#define UI_SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

#import "UIView+Extension.h"

@interface SXSBaseTableViewCell : UITableViewCell

@end
