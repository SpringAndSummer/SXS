//
//  SXSUserCertifyViewController.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSUserCertifyViewController.h"
#import "UIView+Extension.h"
#import "SXSSetCardViewController.h"

@interface SXSUserCertifyViewController ()
@property (nonatomic,weak)UILabel * introduceLabel;//介绍
@property (nonatomic,weak)UITextField * cardName;//持卡人姓名
@property (nonatomic,weak)UILabel * lineLabel;//线
@property (nonatomic,weak)UITextField * IDNum;//身份证号码
@property (nonatomic,weak)UILabel * successLabel;//认证成功后的说明
@property (nonatomic,weak)UIButton * nextStepButton;//下一步点击按钮

@end

@implementation SXSUserCertifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"用户认证";
    [self initUI];
}
- (void)initUI
{
    
//    introduceLabel;//介绍
//    ld * cardName;//持卡人姓名
//    lineLabel;//线
//    ld * IDNum;//身份证号码
//    successLabel;//认证成功后的说明
//    * nextStepButton;//下一步点击按钮
    UILabel *introduceTempLabel = [[UILabel alloc]init];
    introduceTempLabel.font = [UIFont systemFontOfSize:13];
    introduceTempLabel.text = @"1. 填写个人信息  > 2.绑定银行卡";
    [introduceTempLabel sizeToFit];
    introduceTempLabel.frame =  CGRectMake(10.0, 10.0, introduceTempLabel.width, introduceTempLabel.height);
    [self.view addSubview:introduceTempLabel];
    self.introduceLabel = introduceTempLabel;
    
    UITextField * cardNameTemp = [[UITextField alloc]initWithFrame:CGRectMake(0, self.introduceLabel.bottom+10.0, self.view.width, 44.0)];
    cardNameTemp.backgroundColor = [UIColor whiteColor];
    cardNameTemp.leftViewMode = UITextFieldViewModeAlways;
    cardNameTemp.leftView = [[UIView alloc]initWithFrame:CGRectMake(5.0, 5.0, 100, 34.0)];
    [self.view addSubview:cardNameTemp];
    self.cardName = cardNameTemp;
    UILabel * name = [[UILabel alloc]init];
    name.text = @"持卡人姓名:";
    name.font = [UIFont systemFontOfSize:14];
    [name sizeToFit];
    name.frame = CGRectMake(10.0, (cardNameTemp.height-name.height)/2.0, name.width, name.height);
    [cardNameTemp.leftView addSubview:name];
    UILabel * line = [[UILabel alloc]init];
    line.backgroundColor = [UIColor magentaColor];
    line.frame = CGRectMake(10.0, self.cardName.bottom, self.view.width-20.0,0.5);
    [self.view  addSubview:line];
    self.lineLabel = line;
    
    
    UITextField * cardNumTemp = [[UITextField alloc]initWithFrame:CGRectMake(0, self.cardName.bottom+0.5, self.view.width, 44.0)];
    cardNumTemp.backgroundColor = [UIColor whiteColor];
    cardNumTemp.leftViewMode = UITextFieldViewModeAlways;
    cardNumTemp.leftView = [[UIView alloc]initWithFrame:CGRectMake(5.0, 5.0, 100, 34.0)];
    [self.view addSubview:cardNumTemp];
    self.IDNum = cardNameTemp;
    UILabel * IDNum = [[UILabel alloc]init];
    IDNum.text = @"身份证号码:";
    IDNum.font = [UIFont systemFontOfSize:14];
    [IDNum sizeToFit];
    IDNum.frame = CGRectMake(10.0, (cardNameTemp.height-name.height)/2.0, name.width, name.height);
    [cardNumTemp.leftView addSubview:IDNum];
    
    UILabel * successTempLabel = [[UILabel alloc]init];
    successTempLabel.text = @"认证成功后,认证信息不可以更改";
    successTempLabel.font = [UIFont systemFontOfSize:12];
    [successTempLabel sizeToFit];
    successTempLabel.frame = CGRectMake(10.0, self.IDNum.bottom+44+10.0, successTempLabel.width, successTempLabel.height);
    [self.view addSubview:successTempLabel];
    self.successLabel = successTempLabel;
    
    UIButton * nextStepTempButton = [[UIButton alloc]init];
    nextStepTempButton.layer.cornerRadius = 5;
    nextStepTempButton.clipsToBounds = YES;
    [nextStepTempButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextStepTempButton addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    nextStepTempButton.titleLabel.font = [UIFont systemFontOfSize:32];
    nextStepTempButton.backgroundColor = [UIColor redColor];
    nextStepTempButton.frame = CGRectMake(20.0, self.successLabel.bottom+20.0, self.view.width-40.0, 44);
    [self.view addSubview:nextStepTempButton];
    self.nextStepButton = nextStepTempButton;

    
}
- (void)nextClick
{
    SXSSetCardViewController * setCardViewController = [[SXSSetCardViewController alloc]init];
    [self.navigationController pushViewController:setCardViewController animated:YES];

}

@end
