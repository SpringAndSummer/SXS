//
//  SXSChangeBindingIphoneViewController.m
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSChangeBindingIphoneViewController.h"
#import "SXSChangeBindingIphoneStepTwoViewController.h"
#import "SXSSetTool.h"
#import "UIView+Extension.h"
#import "UIButton+countDown.h"

/** 屏幕宽度 */
#define ScreenWidth             ([[UIScreen mainScreen] bounds].size.width)
/** 屏幕高度 */
#define ScreenHeight            ([[UIScreen mainScreen] bounds].size.height)
/** 屏幕大小 */
#define UI_SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface SXSChangeBindingIphoneViewController ()
@property (nonatomic,weak)UILabel * bindingLabel;//绑定手机号说明
@property (nonatomic,weak)UITextField * verificationCodeTextField;//短信验证码
@property (nonatomic,weak)UIButton * verificationCodeButton;//获取短信验证码按钮
@property (nonatomic,weak)UILabel * explainLabel;//请输入验证码提示
@property (nonatomic,weak)UIButton * nextStepButton;//下一步按钮

@end

@implementation SXSChangeBindingIphoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更改绑定手机号";
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);
    [self initUI];
}
- (void)initUI
{
//    bindingLabel;//绑定手机号说明
//    d * verificationCodeTextField;//短信验证码
//    verificationCodeButton;//获取短信验证码按钮
//    explainLabel;//请输入验证码提示
//    nextStepButton;//下一步按钮
    UILabel * bindingTempLabel = [[UILabel alloc]init];
    bindingTempLabel.font = [UIFont systemFontOfSize:16];
#warning 需要获得真实的手机号码
    bindingTempLabel.text = @"您当前绑定的手机号为:11111111111";
    [self.view addSubview:bindingTempLabel];
    
    self.bindingLabel  = bindingTempLabel;
    
    [self.bindingLabel sizeToFit];
    self.bindingLabel.frame = CGRectMake(10.0, 20.0, self.bindingLabel.width, self.bindingLabel.height);
    
    UITextField * verificationCodeTempTextField = [[UITextField alloc]init];
    verificationCodeTempTextField.placeholder = @"短信验证";
    verificationCodeTempTextField.backgroundColor = [UIColor whiteColor];
    verificationCodeTempTextField.frame = CGRectMake(0, self.bindingLabel.y+self.bindingLabel.height+10.0, ScreenWidth, 44);
    UIView * leftNew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10.0, 44)];
    leftNew.backgroundColor = [UIColor whiteColor];
    verificationCodeTempTextField.leftView= leftNew;
    verificationCodeTempTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:verificationCodeTempTextField];
    self.verificationCodeTextField = verificationCodeTempTextField;
    
    UIButton * verificationCodeTempButton = [[UIButton alloc]init];
    verificationCodeTempButton.backgroundColor = [UIColor greenColor];
    [verificationCodeTempButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    verificationCodeTempButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [verificationCodeTempButton addTarget:self action:@selector(getMessageClick) forControlEvents:UIControlEventTouchUpInside];
    [self.verificationCodeTextField addSubview:verificationCodeTempButton];
    
    self.verificationCodeButton = verificationCodeTempButton;
    self.verificationCodeButton.frame = CGRectMake(ScreenWidth-120, (44-30)/2.0, 100, 30);
    
    UILabel * explainTempLabel = [[UILabel alloc]init];
    explainTempLabel.font = [UIFont systemFontOfSize:10];
    explainTempLabel.text = @"请输入短信收到的验证码";
    [self.view addSubview:explainTempLabel];
    self.explainLabel = explainTempLabel;
    [self.explainLabel sizeToFit];
    self.explainLabel.frame = CGRectMake(10.0, self.verificationCodeTextField.y+self.verificationCodeTextField.height+10.0, self.explainLabel.width, self.explainLabel.height);
    
    UIButton * nextStepTempButton = [[UIButton alloc]init];
    [nextStepTempButton setTitle:@"下一步" forState:UIControlStateNormal];
    nextStepTempButton.backgroundColor = RGB(255, 81, 83);
    nextStepTempButton.layer.cornerRadius = 10.0;
    
    nextStepTempButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:nextStepTempButton];
    self.nextStepButton = nextStepTempButton;
    self.nextStepButton.frame = CGRectMake(40.0, self.explainLabel.y+50.0, ScreenWidth-80.0, 44);
    [self.nextStepButton addTarget:self action:@selector(stepTwo) forControlEvents:UIControlEventTouchUpInside];

    
}

//修改第二步
- (void)stepTwo
{
    SXSChangeBindingIphoneStepTwoViewController * vc = [[SXSChangeBindingIphoneStepTwoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//获取验证码
- (void)getMessageClick
{
    [self.verificationCodeButton startWithTime:60 title:@"获取验证码" countDownTitle:@"等待" mainColor:[UIColor greenColor] countColor:[UIColor greenColor]];
#warning 调用请求接口
}

@end
