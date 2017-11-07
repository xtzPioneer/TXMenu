//
//  TXView0.m
//  TXCustomMenu
//
//  Created by komlin on 2017/10/27.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "TXView0.h"

@implementation TXView0
- (instancetype)init{
    if (self = [super init]) {
        UILabel * titleLabel=[[UILabel alloc]init];
        titleLabel.textColor=[UIColor blackColor];
        titleLabel.font=[UIFont systemFontOfSize:14];
        titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel=titleLabel;
        [self addSubview:_titleLabel];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat viewW=self.frame.size.width;
    CGFloat viewH=self.frame.size.height;
    CGFloat margin=15;
    
    CGFloat titleLabelX=margin;
    CGFloat titleLabelH=20;
    CGFloat titleLabelY=(viewH-titleLabelH)/2;
    CGFloat titleLabelW=viewW-margin*2;
    self.titleLabel.frame=CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
