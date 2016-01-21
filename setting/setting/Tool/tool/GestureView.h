//
//  GestureView.h
//  Gesture
//
//  Created by 袁斌 on 15/11/6.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, CaseMode) {
    VerifyMode = 0,/*校验密码*/
    ResetMode,     /*重置密码*/
};
@protocol caseDelegate <NSObject>
/**
 *  重置密码
 *
 *  @param result YES或NO
 *
 *  @return BOOL
 */
- (BOOL)resetPassword:(NSString *)result;
/**
 *  校验密码
 *
 *  @param result YES或NO
 *
 *  @re9turn BOOL
 */
- (BOOL)verification:(NSString *)result;


@end

@interface GestureView : UIView

@property (nonatomic,strong) NSArray *buttonArray;

/**
 *  各种情况
 */
@property(assign,nonatomic)CaseMode style;

@property (nonatomic,assign) id<caseDelegate> caseDelegate;



- (void)enterArgin;


@end