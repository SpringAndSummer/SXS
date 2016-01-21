//
//  NSString+pass.h
//  SXS
//
//  Created by Spring on 16/1/19.
//  Copyright © 2016年 Spring. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (pass)
//邮箱
- (BOOL)isValidEmail;
// 验证字符串是否都是手机号
- (BOOL)isValidPhoneNumber;
//全是数字
- (BOOL)isAllNumber;
//包含汉字
- (BOOL)hasChineseCharacter;
//全是汉字
- (BOOL)isAllCharacter;
//字母和数字
- (BOOL)isNumberAndCharacter;

// 验证信用卡号码是否正确
- (BOOL)isValidCreditCardNumber;

//身份证
- (BOOL)isValidIdentityCardNumber;

// 是否是有效密码
//- (BOOL)isValidPassword;

// 是否是有效验证码
- (BOOL)isValidPassCode;

//邮箱
//-(BOOL)isValidateEmail;
//中国名字
- (BOOL)isValidChineseName;

- (BOOL)isValidCard4;
//银行卡检验
- (BOOL)isValidateBankCardNumber;
//银行卡后四位
- (BOOL) validateBankCardLastNumber;
//+ (BOOL) isValidNumber:(NSString*)value;

//+ (BOOL) isValidCreditNumber:(NSString*)value;
@end

