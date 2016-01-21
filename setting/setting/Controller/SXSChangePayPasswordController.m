//
//  SXSChangePayPasswordController.m
//  setting
//
//  Created by Spring on 16/1/20.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import "SXSChangePayPasswordController.h"
#import "NSString+pass.h"
#import "SXSSetTool.h"
#define passwordNum 6
@interface SXSChangePayPasswordController ()<UITextFieldDelegate>
@property(nonatomic,weak)UILabel * prompt;//提示
@property(nonatomic,weak)UIButton * certain;//确定按钮
/** 响应者 */
@property (nonatomic, weak) UITextField *responsder;
@property(nonatomic,weak)UIButton * forgetPassword;//忘记密码
@property (nonatomic,assign)NSInteger changeCount;//修改密码次数
@end

@implementation SXSChangePayPasswordController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _changeCount = 0;
    [self initUI];
}
- (void)initUI
{
    self.title = @"修改支付密码";
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);
    UILabel * label = [UILabel new];
    label.text = @"请您输入当前支付密码";
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    label.frame = CGRectMake(0, 80, self.view.bounds.size.width, label.frame.size.height);
    [self.view addSubview:label];
    self.prompt = label;
    
    CGFloat tmpY = self.prompt.frame.origin.y+self.prompt.frame.size.height+50;
    CGFloat tmpW = (self.view.width-40.0)/6.0;
    CGFloat margin = (self.view.frame.size.width - passwordNum * tmpW)/(passwordNum+1);
    
    for(int i = 0; i < passwordNum; i++)
    {
        UILabel * label = [self createlabel];
        label.tag = 1000+i;
        label.frame = CGRectMake(tmpW*i+(i+1)*margin, tmpY, tmpW, tmpW);
        [self.view addSubview:label];
    }
    
    UIButton * btn = [UIButton new];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(conform) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(30, 250, self.view.width-60, 44);
    btn.layer.cornerRadius = 5.0;
    btn.clipsToBounds = YES;
    [self.view addSubview:btn];
    self.certain = btn;
    
    [self setResponsder];
    
    
    UIButton * forgetBtn = [[UIButton alloc]init];
    [forgetBtn  setTitle:@"忘记支付密码?" forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    forgetBtn.backgroundColor = [UIColor redColor];
    forgetBtn.titleLabel.textColor = [UIColor blueColor];
    forgetBtn.frame =  CGRectMake(self.view.width-110, 210, 100, 20);
    [self.view addSubview:forgetBtn];
    self.forgetPassword = forgetBtn;
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.responsder becomeFirstResponder];
}
//确定按钮的点击事件
- (void)conform
{
    
    NSLog(@"你点击了确定");
    if([self.responsder.text isValidPassCode])
    {
        //如果输入密码正确
        _changeCount ++;
        if (_changeCount == 1) {
            self.prompt.text= @"请输入您需要设置的支付密码";
        }
      else  if (_changeCount == 2) {
            self.prompt.text= @"确认新设置的支付密码";

        }
        
        for(int i = 0; i < 6; i++)
        {
            UILabel * label = (UILabel *)[self.view viewWithTag:1000+i];
            if(i < self.responsder.text.length)
            {
                label.text = [NSString stringWithFormat:@"%c",[self.responsder.text characterAtIndex:i]];
            }
            if (_changeCount ==1 || _changeCount == 2) {
                label.text = @"";
            }
        }
        if (_changeCount == 2) {
            _changeCount = 0;
        }
        UIAlertView * al = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码合法" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [al show];
    }
    else
    {
        UIAlertView * al = [[UIAlertView alloc]initWithTitle:@"提示" message:@"密码不合法" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [al show];
    }
}
//创建label
- (UILabel *)createlabel
{
    UILabel * label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    //    label.layer.borderWidth = 0.5;
    //    label.layer.borderColor = [UIColor blackColor].CGColor;
    //    label.clipsToBounds = YES;
    return label;
}
//- (void)
- (void)setResponsder
{
    UITextField * textFiled = [[UITextField alloc]init];
    
    [self.view addSubview:textFiled];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change) name:UITextFieldTextDidChangeNotification object:textFiled];
    
    textFiled.keyboardType = UIKeyboardTypeNumberPad;
    [textFiled becomeFirstResponder];
    
    self.responsder = textFiled;
}
- (void)change
{
    if(self.responsder.text.length>6)
    {
        NSString * tmpS = [self.responsder.text substringWithRange:NSMakeRange(0, 6)];
        self.responsder.text = tmpS;
    }
    for(int i = 0; i < 6; i++)
    {
        UILabel * label = (UILabel *)[self.view viewWithTag:1000+i];
        if(i < self.responsder.text.length)
        {
            label.text = [NSString stringWithFormat:@"%c",[self.responsder.text characterAtIndex:i]];
        }
        else
        {
            label.text = @"";
        }
        
      

    }
        NSLog(@"%@",self.responsder.text);
}
- (void)setNav
{
    UIButton * leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 50.0, 40.0)];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(5.0, 0.0, 5.0, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)isValidPassCode
{
    NSString *passCodeRegex = @"[0-9]{6}";
    NSPredicate *passCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passCodeRegex];
    return [passCodeTest evaluateWithObject:self];
}
@end