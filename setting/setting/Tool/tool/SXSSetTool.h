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
 *  根据颜色创建一个图片
 *
 *  @param color 颜色
 *  @param frame 图片大小
 *
 *  @return 产生的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color forFrame:(CGRect)frame;
/**
 *  截取图片的某一部分
 *
 *  @param targetSize 区域大小
 *  @param image      图片对象
 *
 *  @return 生成的图片
 */
+ (UIImage*)thumbnailImage:(CGSize)targetSize withImage:(UIImage*)image;

/**
 *  快速创建一个返回按钮
 *
 *  @return 返回按钮
 */
+ (UIButton *)createBackItem;

@end











