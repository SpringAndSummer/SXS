//
//  SXSSetTool.h
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
// rgb颜色转换（16进制->10进制）
#define UIColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface SXSSetTool : NSObject
/**
 *  <#Description#>
 *
 *  @param color <#color description#>
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithColor:(UIColor *)color forFrame:(CGRect)frame;
/**
 *  <#Description#>
 *
 *  @param targetSize <#targetSize description#>
 *  @param image      <#image description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage*)thumbnailImage:(CGSize)targetSize withImage:(UIImage*)image;

@end
