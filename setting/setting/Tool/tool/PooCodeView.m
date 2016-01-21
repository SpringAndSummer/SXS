//  Created by spring on 15-1-18.
//  Copyright (c) 2015年 spring. All rights reserved.
//  动态产生图形验证码
#import "PooCodeView.h"
@interface PooCodeView()
@property (nonatomic, strong) NSArray *changeArray;
@property (nonatomic, strong) UILabel *codeLabel;
@end
@implementation PooCodeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0;
        self.clipsToBounds = YES;//设置圆角值
        
        self.backgroundColor = [UIColor greenColor];
//        self.backgroundColor = [UIColor colorWithRed:arc4random() % 100 / 100.0 green:arc4random() % 100 / 100.0 blue:arc4random() % 100 / 100.0 alpha:1.0];//默认颜色
        [self change];//初始化就产生一个随机数
    }
    return self;
}

//点击控件就再次生成一个
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self change];
    [self setNeedsDisplay];
}

- (void)change
{
    //取值范围
    self.changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    
    NSMutableString *getStr = [[NSMutableString alloc] initWithCapacity:5];
    
    self.changeString = [[NSMutableString alloc] initWithCapacity:6];
    for(NSInteger i = 0; i < 4; i++)
    {
        //随机生成一个(0, count-1)的值
        NSInteger index = arc4random() % [self.changeArray count];
        
        getStr = [self.changeArray objectAtIndex:index];
        
        self.changeString = (NSMutableString *)[self.changeString stringByAppendingString:getStr];
    }
}

- (void)drawRect:(CGRect)rect {
    
        [super drawRect:rect];
    
        //设置 控件的随机背景色(颜色不能太深,否则产生看不到现象)
//        float red = arc4random() % 100 / 100.0;
//        float green = arc4random() % 100 / 100.0;
//        float blue = arc4random() % 100 / 100.0;
//        UIColor *color = [UIColor colorWithRed:arc4random() % 100 / 100.0 green:arc4random() % 100 / 100.0 blue:arc4random() % 100 / 100.0 alpha:1.0];
//        [self setBackgroundColor:color];

    
        NSString *text = [NSString stringWithFormat:@"%@",self.changeString];
    
    
        //拟定一个大小
//        CGSize cSize = [@"S" sizeWithFont:[UIFont systemFontOfSize:30]];
        CGSize cSize = [@"S" sizeWithAttributes:@{
                                              NSFontAttributeName:[UIFont systemFontOfSize:18]
                                              }];
    
    
        NSLog(@"%f   %f",cSize.width,cSize.height);
    
        //计算剩余宽度(把控件的宽等分,然后减去一个字占的宽)
        int width = rect.size.width / text.length - cSize.width;

        //计算剩余的高度(控件的高,减去一个字符的高)
        int height = rect.size.height - cSize.height;
    
        CGPoint point;
    
        float pX, pY;
        for (int i = 0; i < text.length; i++)
        {
            //产生一个随意的位置(在自己的有效范围内)
            pX = arc4random() % width + rect.size.width / text.length * i;
            pY = arc4random() % height;
            point = CGPointMake(pX, pY);
            unichar c = [text characterAtIndex:i];
            NSString *textC = [NSString stringWithFormat:@"%C", c];
//            [textC drawAtPoint:point withFont:[UIFont systemFontOfSize:30]];
            
        
            [textC drawAtPoint:point withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],
                                                      NSFontAttributeName:[UIFont systemFontOfSize:20]
                                                      }];
        }
    
       //产生10条随机颜色的线
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1.5);
        for(int cout = 0; cout < 50; cout++)
        {
//            red = arc4random() % 100 / 100.0;
//            green = arc4random() % 100 / 100.0;
//            blue = arc4random() % 100 / 100.0;
            UIColor *  color = [UIColor colorWithRed:arc4random() % 100 / 100.0 green:arc4random() % 100 / 100.0 blue:arc4random() % 100 / 100.0 alpha:1.0];
            CGContextSetStrokeColorWithColor(context, [color CGColor]);
            
            
            //随机产生一个点
            pX = arc4random() % (int)rect.size.width;
            pY = arc4random() % (int)rect.size.height;
            
            
            
            CGContextMoveToPoint(context, pX, pY);
//            pX = arc4random() % (int)rect.size.width;
//            pY = arc4random() % (int)rect.size.height;
            CGContextAddLineToPoint(context, pX+1, pY+1);//以产生的点为起点,宽高各加上1.形成一个点
            CGContextStrokePath(context);
        }
}
@end
