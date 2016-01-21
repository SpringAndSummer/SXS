//
//  SXSChangeBindingIphoneStepTwoViewController.m
//  setting
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSChangeBindingIphoneStepTwoViewController.h"
#import "UIView+Extension.h"
#import "UIButton+countDown.h"
#import "PooCodeView.h"//图形验证码
@interface SXSChangeBindingIphoneStepTwoViewController ()
@property(nonatomic,weak)UITextField * phone;
@property(nonatomic,weak)UILabel * line;
@property(nonatomic,weak)UITextField * message;
@property(nonatomic,weak)UIButton * getMessage;
@property(nonatomic,weak)UILabel * proment;
@property(nonatomic,weak)UIButton * next;
@property(nonatomic,weak)UITextField * imageCode;
@property(nonatomic,weak)PooCodeView * imageButton;
@property(nonatomic,assign)NSInteger errorCount;
@end

@implementation SXSChangeBindingIphoneStepTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _errorCount = 0;
    [self initUI];

}
- (void)initUI
{
    self.title = @"更改绑定手机号";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITextField * phone = [[UITextField alloc]initWithFrame:CGRectMake(0, 10, self.view.width, 44)];
    phone.tintColor = [UIColor grayColor];
    phone.backgroundColor = [UIColor whiteColor];
    phone.placeholder = @"输入新手机号";
    UIView * leftNew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10.0, 44)];
    leftNew.backgroundColor = [UIColor whiteColor];
    phone.leftView= leftNew;
    phone.leftViewMode = UITextFieldViewModeAlways;

    [self.view addSubview:phone];
    self.phone = phone;
    
    UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(10, phone.y+phone.height, self.view.width-20.0, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    self.line = line;
    
    UITextField * message = [[UITextField alloc]initWithFrame:CGRectMake(0, line.y+1, self.view.width, 44)];
    message.tintColor = [UIColor grayColor];
    message.backgroundColor = [UIColor whiteColor];
    message.placeholder = @"短信验证";
    UIView * lefMessage = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10.0, 44)];
    leftNew.backgroundColor = [UIColor whiteColor];
    message.leftView= lefMessage;
    message.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:message];
    self.message = message;
    
    
    UIButton * getMessage = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width-80, (message.y+11), 80.0, 22)];
    [getMessage addTarget:self action:@selector(getMessageClick) forControlEvents:UIControlEventTouchUpInside];
    getMessage.titleLabel.font = [UIFont systemFontOfSize:14];
    [getMessage setTitle:@"获取验证码" forState:UIControlStateNormal];
    getMessage.backgroundColor = [UIColor greenColor];
    getMessage.layer.cornerRadius = 5;
    getMessage.clipsToBounds = YES;
    [self.view addSubview:getMessage];
    self.getMessage = getMessage;
    
    UILabel * proment = [UILabel new];
    proment.text = @"请输入短信收到的验证码";
    proment.font = [UIFont systemFontOfSize:10.0];
    [proment sizeToFit];
    proment.frame = CGRectMake(10, message.y+message.height+10.0, proment.width, proment.height);
    [self.view addSubview:proment];
    self.proment = proment;
    
    UIButton * next = [[UIButton alloc]initWithFrame:CGRectMake(50, proment.y+60, self.view.width-100, 50)];
    next.layer.cornerRadius = 5;
    next.clipsToBounds = YES;
    [next setTitle:@"下一步" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    next.titleLabel.font = [UIFont systemFontOfSize:32];
    next.backgroundColor = [UIColor redColor];
    [self.view addSubview:next];
    self.next = next;
    
    UITextField * imageCode = [[UITextField alloc]initWithFrame:CGRectZero];
    imageCode.tintColor = [UIColor grayColor];
    imageCode.backgroundColor = [UIColor whiteColor];
    imageCode.placeholder = @"图片验证码";
    
    UIView * lefImage = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10.0, 44)];
    lefImage.backgroundColor = [UIColor whiteColor];
    imageCode.leftView= lefImage;
    imageCode.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:imageCode];
    self.imageCode = imageCode;
    
    PooCodeView * imageButton = [[PooCodeView alloc]initWithFrame:CGRectZero];
//    [PooCodeView setTitle:@"AcGJ" forState:UIControlStateNormal];
//    imageButton.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.7];
    [self.view addSubview:imageButton];
    self.imageButton = imageButton;
}
- (void)nextClick
{
    _errorCount = 3;
    if(_errorCount == 3)
    {
        self.proment.frame = CGRectZero;
        self.proment.hidden = YES;
        
        self.imageCode.frame = CGRectMake(0, self.message.y+self.message.height+10, self.view.width, 44);
        self.imageButton.frame = CGRectMake(self.view.width-100, self.imageCode.y+7, 80, 30);
        [self.imageButton setNeedsDisplay];
        
        self.next.y = self.imageCode.y+self.imageCode.height+30;
//        self.next.frame = CGRectMake(50, self.imageCode.y+self.imageCode.height+30, <#CGFloat width#>, <#CGFloat height#>)
    }
}
- (void)getMessageClick
{
    [self.getMessage startWithTime:60 title:@"获取验证码" countDownTitle:@"等待" mainColor:[UIColor greenColor] countColor:[UIColor greenColor]];
#warning 调用请求接口
}
@end
