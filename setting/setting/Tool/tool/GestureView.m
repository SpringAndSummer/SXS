//
//  GestureView.m
//  Gesture
//
//  Created by 袁斌 on 15/11/6.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "GestureView.h"
#import "PasswordButton.h"
@interface GestureView ()
{
    CGPoint lineStartPoint;
    CGPoint lineEndPoint;
    
    NSMutableArray *touchesArray;
    NSMutableArray *touchedArray;
    BOOL success;

}
@end

@implementation GestureView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
        touchesArray = [NSMutableArray array];
        touchedArray = [NSMutableArray array];
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        success = YES;
    }
    return self;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    UITouch *touch = [touches anyObject];
    [touchesArray removeAllObjects];
    [touchedArray removeAllObjects];
    success = YES;
    if (touch) {
        touchPoint = [touch locationInView:self];
        for (int i=0; i < _buttonArray.count; i++) {
            PasswordButton *buttonTemp = (PasswordButton *)[_buttonArray objectAtIndex:i];
            buttonTemp.success = YES;
            buttonTemp.selected = NO;
          
            if (CGRectContainsPoint(buttonTemp.frame, touchPoint)) {
                
                CGRect frameTemp = buttonTemp.frame;
                CGPoint point = CGPointMake(frameTemp.origin.x+frameTemp.size.width/2,frameTemp.origin.y+frameTemp.size.height/2);
                NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f",point.x],@"x",[NSString stringWithFormat:@"%f",point.y],@"y", nil];
                [touchesArray addObject:dict];
                lineStartPoint = touchPoint;
            }
         
            [buttonTemp setNeedsDisplay];
            
        }
        
        [self setNeedsDisplay];
    }

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    UITouch *touch = [touches anyObject];
    if (touch) {
        touchPoint = [touch locationInView:self];
        for (int i=0; i < _buttonArray.count; i++) {
            PasswordButton *buttonTemp = (PasswordButton *)[_buttonArray objectAtIndex:i];
            if (CGRectContainsPoint(buttonTemp.frame, touchPoint)) {
                //已经设置过的
                if ([touchedArray containsObject:[NSString stringWithFormat:@"num%d",i]]) {
                    lineEndPoint = touchPoint;
                  
                    [self setNeedsDisplay];
                    return;
                }
                [touchedArray addObject:[NSString stringWithFormat:@"num%d",i]];
                [buttonTemp setSelected:YES];
                
//                    UIImageView * selectedImage = [[UIImageView alloc]initWithFrame:buttonTemp.bounds];
                
                    // 1.取得图片
//                    UIImage *image = [UIImage imageNamed:@"xgm"];
                
                    // 2.画
                    
//                    [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
//                    selectedImage.image = image;
//                    [buttonTemp addSubview:selectedImage];
                
                

                [buttonTemp setNeedsDisplay];
                CGRect frameTemp = buttonTemp.frame;
                CGPoint point = CGPointMake(frameTemp.origin.x+frameTemp.size.width/2,frameTemp.origin.y+frameTemp.size.height/2);
                NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%f",point.x],@"x",[NSString stringWithFormat:@"%f",point.y],@"y",[NSString stringWithFormat:@"%d",i],@"num", nil];
                [touchesArray addObject:dict];
                break;
            }
        }
        
        lineEndPoint = touchPoint;
        [self setNeedsDisplay];
    }
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSMutableString * resultString=[NSMutableString string];
    for ( NSDictionary * num in touchesArray ){
        if(![num objectForKey:@"num"])break;
        [resultString appendString:[num objectForKey:@"num"]];
    }
    NSLog(@"resultString:%@",resultString);
    
    if (resultString.length > 0) {
        if(_style==VerifyMode){
            if ([_caseDelegate respondsToSelector:@selector(verification:)]) {
                success = [_caseDelegate verification:resultString];
            }
        }
        else {
            if ([_caseDelegate respondsToSelector:@selector(resetPassword:)]) {
                success = [_caseDelegate resetPassword:resultString];
            }
        }

    }else{
        success = YES;
    }
    
    
    for (int i=0; i<touchesArray.count; i++) {
        NSInteger selection = [[[touchesArray objectAtIndex:i] objectForKey:@"num"]intValue];
        PasswordButton * buttonTemp = ((PasswordButton *)[_buttonArray objectAtIndex:selection]);
        [buttonTemp setSuccess:success];
       //
        [buttonTemp setNeedsDisplay];
    }
    [self setNeedsDisplay];
    
   
}
//重新开始画图
- (void)enterArgin {
    [touchesArray removeAllObjects];
    [touchedArray removeAllObjects];
    for (int i=0; i<_buttonArray.count; i++) {
        PasswordButton * buttonTemp = ((PasswordButton *)[_buttonArray objectAtIndex:i]);
        [buttonTemp setSelected:NO];
        [buttonTemp setSuccess:YES];
        [buttonTemp setNeedsDisplay];
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // Drawing code
    //    if (touchesArray.count<2)return;
        for (int i=0; i<touchesArray.count; i++) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        if (![[touchesArray objectAtIndex:i] objectForKey:@"num"]) { //防止过快滑动产生垃圾数据
            [touchesArray removeObjectAtIndex:i];
            continue;
        }
        if (success) {
            CGContextSetRGBStrokeColor(context, 1.f, 1.f, 1.f, 1);//线条颜色
        }
        else {
            CGContextSetRGBStrokeColor(context, 1.f, 0.f, 0.f, 0.7);//红色
        }
        
        CGContextSetLineWidth(context,1.5);
        CGContextMoveToPoint(context, [[[touchesArray objectAtIndex:i] objectForKey:@"x"] floatValue], [[[touchesArray objectAtIndex:i] objectForKey:@"y"] floatValue]);
        if (i<touchesArray.count-1) {
            CGContextAddLineToPoint(context, [[[touchesArray objectAtIndex:i+1] objectForKey:@"x"] floatValue],[[[touchesArray objectAtIndex:i+1] objectForKey:@"y"] floatValue]);
        }
        else{
            if (success) {
                CGContextAddLineToPoint(context, lineEndPoint.x,lineEndPoint.y);
            }
        }
        CGContextStrokePath(context);
    }

}

@end