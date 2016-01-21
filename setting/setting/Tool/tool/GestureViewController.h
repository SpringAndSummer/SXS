//
//  GestureViewController.h
//  Gesture
//
//  Created by 袁斌 on 15/11/7.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureView.h"

//手势页面
@interface GestureViewController : UIViewController

-(instancetype)initWithCaseMode:(CaseMode)caseMode;

/**
 *  情况：
 */
@property(nonatomic,assign)BOOL isFormer;

@end