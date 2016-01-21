//
//  PasswordButton.m
//  Gesture
//
//  Created by 袁斌 on 15/11/6.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "PasswordButton.h"

@implementation PasswordButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = self.bounds;
    CGRect frame = CGRectMake(2, 2, bounds.size.width-3, bounds.size.height-3);

    if (_selected)//在画的时候
    {
        if (_success)
        {//验证成功的
            CGContextSetRGBStrokeColor(context, 1.f, 1.f, 1.f,1);//圆圈线条颜色
//            CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,1);
            UIImage * image = [UIImage imageNamed:@"xgm"];
            [image drawInRect:frame];
        }
        else
        {//验证失败
            CGContextSetRGBStrokeColor(context, 1.f, 1.f, 1.f,1);//线条颜色
            
//            CGContextSetRGBFillColor(context,208/255.f, 36/255.f, 36/255.f,1);
        }
    }
    
    CGContextSetRGBStrokeColor(context, 1, 1,1,1);//线条颜色白色
    CGContextSetLineWidth(context,0.5);//设置线宽
    CGContextAddEllipseInRect(context,frame);//画圆
    CGContextStrokePath(context);//开始绘制图片
    
    if (_success)
    {
//        CGContextSetRGBFillColor(context,0.6f, 1.f, 1.f,1);
        
//        UIImage * image = [UIImage imageNamed:@"xgm"];
////        //
//        [image drawInRect:frame];
    }
    else
    {
        CGContextSetRGBFillColor(context,1.f, 1.f, 1.f,1);
    }
//    CGContextAddEllipseInRect(context,frame);
    if (_selected)
    {
        //最终成功显示的内容
        UIImage * image = [UIImage imageNamed:@"xgm"];
        //
        [image drawInRect:frame];
        CGContextFillPath(context);
    }
}

@end