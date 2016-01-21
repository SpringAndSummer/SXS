//
//  SXSChangeLogINPasswordViewController.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSChangeLogINPasswordViewController.h"
#import "SXSSetTool.h"
@interface SXSChangeLogINPasswordViewController ()
@property (nonatomic,weak)UITextField * oldSecretTextFiled;//当前登录密码
@property (nonatomic,weak)UITextField * secretNewTextFiled;//新登录密码
@property (nonatomic,weak)UILabel * line;//分隔线
@property (nonatomic,weak)UILabel * secretCodeExplain;//密码组成说明
@property (nonatomic,weak)UIButton * nextStepButton;//下一步点击按钮

@end

@implementation SXSChangeLogINPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更改登录密码";
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);
    [self initUI];
}
- (void)initUI
{
    UIImageView * test = [[UIImageView alloc]initWithFrame:CGRectMake(130, 400, 200, 200)];
    test.image = [UIImage imageNamed:@"3"];
//    test.backgroundColor = [UIColor redColor];
    [self.view addSubview:test];
    UITextField * oldSecretTempTextFiled = [[UITextField alloc]init];
    oldSecretTempTextFiled.backgroundColor = [UIColor whiteColor];
    oldSecretTempTextFiled.placeholder = @"当前登录密码";
    oldSecretTempTextFiled.font = [UIFont systemFontOfSize:16];
    oldSecretTempTextFiled.secureTextEntry = YES;
    oldSecretTempTextFiled.frame = CGRectMake(0, 10, self.view.width, 44);
    UIView * left = [[UIView alloc]initWithFrame:CGRectMake(40, 0, 10.0, 44)];
    left.backgroundColor = [UIColor whiteColor];
    oldSecretTempTextFiled.leftView = left;
//    [oldSecretTempTextFiled.leftView addSubview:left];
    oldSecretTempTextFiled.leftViewMode = UITextFieldViewModeAlways;
    [self.view  addSubview:oldSecretTempTextFiled];
    self.oldSecretTextFiled = oldSecretTempTextFiled;
    
    UILabel * line = [[UILabel alloc]init];
    line.backgroundColor = [UIColor redColor];
    line.frame = CGRectMake(10.0, oldSecretTempTextFiled.bottom, self.view.width-20.0, 0.5);
    [self.view  addSubview:line];
    self.line = line;
    
    UITextField * secretNewTempTextFiled = [[UITextField alloc]init];
    secretNewTempTextFiled.placeholder = @"新登录密码";
    secretNewTempTextFiled.backgroundColor = [UIColor whiteColor];

    secretNewTempTextFiled.font = [UIFont systemFontOfSize:16];
    secretNewTempTextFiled.secureTextEntry = YES;
    secretNewTempTextFiled.frame = CGRectMake(0, self.oldSecretTextFiled.bottom+0.5, self.view.width, 44);
    UIView * leftNew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10.0, 44)];
    leftNew.backgroundColor = [UIColor whiteColor];
    secretNewTempTextFiled.leftView= leftNew;
    secretNewTempTextFiled.leftViewMode = UITextFieldViewModeAlways;
    [self.view  addSubview:secretNewTempTextFiled];
    self.secretNewTextFiled = secretNewTempTextFiled;

    
    UILabel *secretCodeTempExplain = [[UILabel alloc]init];
    secretCodeTempExplain.text = @"密码由6-20位英文字母、数字或符号组成";
    secretCodeTempExplain.font = [UIFont systemFontOfSize:12];
    secretCodeTempExplain.textColor = [UIColor blueColor];
    [secretCodeTempExplain sizeToFit];
    secretCodeTempExplain.frame  =  CGRectMake(10.0, self.secretNewTextFiled.bottom+10.0, secretCodeTempExplain.width, secretCodeTempExplain.height);
    [self.view  addSubview:secretCodeTempExplain];
    self.secretCodeExplain = secretCodeTempExplain;
    
    UIButton * nextStepTempButton = [[UIButton alloc]init];
    nextStepTempButton.layer.cornerRadius = 5;
    nextStepTempButton.clipsToBounds = YES;
    [nextStepTempButton setTitle:@"确定" forState:UIControlStateNormal];
    [nextStepTempButton addTarget:self action:@selector(ensureClick) forControlEvents:UIControlEventTouchUpInside];
    nextStepTempButton.titleLabel.font = [UIFont systemFontOfSize:32];
    nextStepTempButton.backgroundColor = [UIColor redColor];
    nextStepTempButton.frame = CGRectMake(20.0, self.secretCodeExplain.bottom+20.0, self.view.width-40.0, 44);
    [self.view addSubview:nextStepTempButton];
    self.nextStepButton = nextStepTempButton;
    

}

//确定按钮响应事件
- (void)ensureClick
{
    
}

@end
