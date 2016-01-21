//
//  PasswordAccount.h
//  Gesture
//
//  Created by 袁斌 on 15/11/8.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordAccount : NSObject

/**
 *  保存密码
 *
 *  @param password NNSring
 */
+(void)setPassword:(NSString *)password;
+(NSString *)password;
+(void)deletePassword;
/**
 *  需不需要设置密码
 *
 *  @return BOOL
 */
+(BOOL)isOnWithNeedPassword;
+(void)needPasswordIsOn:(BOOL)isOn;

/**
 *  是否显示轨迹
 *
 *  @return BOOL
 */
+(BOOL)isOnWithShowTrack;
+(void)showTrackIsOn:(BOOL)isOn;


@end