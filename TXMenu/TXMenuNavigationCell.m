//
//  TXMenuNavigationCell.m
//  TXCustomMenu
//
//  Created by komlin on 2017/10/26.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "TXMenuNavigationCell.h"

@interface TXMenuNavigationCell ()

@end

@implementation TXMenuNavigationCell
- (instancetype)init{
    if (self = [super init]) {
        [self initializingSubViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initializingSubViews];
    }
    return self;
}
- (void)initializingSubViews{
    UIImageView * imageView=[[UIImageView alloc]init];
    self.imageView=imageView;
    
    UILabel * titleLabel=[[UILabel alloc]init];
    titleLabel.numberOfLines=0;
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font=[UIFont systemFontOfSize:11];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    self.titleLabel=titleLabel;
    
    [self addSubview:imageView];
    [self addSubview:titleLabel];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width  = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat margin = 5;
    CGFloat imageViewX   = margin;
    CGFloat imageViewW_H = height/1.5;
    CGFloat imageViewY   = (height-imageViewW_H)/2;
    self.imageView.frame = CGRectMake(imageViewX, imageViewY,imageViewW_H, imageViewW_H);
    CGFloat titleLabelX = CGRectGetMaxX(self.imageView.frame)+margin;
    CGFloat titleLabelH = imageViewW_H;
    CGFloat titleLabelW = width-margin-titleLabelX;
    CGFloat titleLabelY = (height-titleLabelH)/2;
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
