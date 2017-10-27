//
//  TXUnderLine.m
//  TXCustomMenu
//
//  Created by komlin on 2017/10/27.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "TXUnderLine.h"

@implementation TXUnderLine
- (void)drawRect:(CGRect)rect{
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context,self.frame.size.width/2.0, 0);//设置起点
    CGContextAddLineToPoint(context,10,self.frame.size.height);
    CGContextAddLineToPoint(context,self.frame.size.width-10, self.frame.size.height);
    //路径结束标志，不写默认封闭
    CGContextClosePath(context);
    // set : 同时设置为实心和空心颜色
    // setStroke : 设置空心颜色
    // setFill : 设置实心颜色
    //设置填充色
    [[UIColor whiteColor] setFill];
    //设置边框颜色
    [[UIColor whiteColor] setStroke];
    //绘制路径path
    CGContextDrawPath(context,kCGPathFillStroke);
}

@end
