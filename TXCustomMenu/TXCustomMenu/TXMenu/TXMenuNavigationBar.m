//
//  TXMenuNavigationBar.m
//  TXCustomMenu
//
//  Created by 张雄 on 2017/10/26.
//  Copyright © 2017年 张雄. All rights reserved.
//

#import "TXMenuNavigationBar.h"
#import "TXMenuNavigationCell.h"
#import "TXUnderLine.h"

@interface TXMenuNavigationBar ()
@property (nonatomic,assign)NSInteger number;
@end;

@implementation TXMenuNavigationBar
/*构造方法*/
- (instancetype)initWithFrame:(CGRect)frame number:(NSInteger)number{
    if (self =[super initWithFrame:frame] ) {
        _cells=[NSMutableArray array];
        self.number=number;
        self.titleFontOfSize=11;
        self.titleFontOfColor=[UIColor redColor];
    }
    return self;
}
/*按钮的数量*/
- (void)setNumber:(NSInteger)number{
    _number=number;
    [_cells removeAllObjects];
    [self removeAllSubView];
    for (int index=0; index<_number; index++) {
        TXMenuNavigationCell * cell=[[TXMenuNavigationCell alloc]init];
        cell.userInteractionEnabled=YES;
        cell.tag=1000+index;
        UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [cell addGestureRecognizer:tap];
        [self addSubview:cell];
        [self.cells addObject:cell];
    }
    TXUnderLine * underline=[[TXUnderLine alloc]init];
    self.underLine=underline;
    [self addSubview:underline];
}
/*图标集合*/
- (void)setIcons:(NSArray<NSString *> *)icons{
    _icons=icons;
    [self reloadData];
}
/*标题集合*/
- (void)setTitles:(NSArray<NSString *> *)titles{
    _titles=titles;
    [self reloadData];
}

/*默认选择页*/
- (void)setDefaultIndex:(NSInteger)defaultIndex{
    _defaultIndex=defaultIndex;
    [self underlineAnimationWithIndex:_defaultIndex];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setupCellFrame];
}
/*设置CellFrame*/
- (void)setupCellFrame{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    /*注意：用CGFloat 6s：会在出现有面出现一条竖线
     处理方法：向下取整
     */
    int menuW=width/self.number;
    CGFloat menuH=height;
    for (int index=0; index<_number; index++) {
        TXMenuNavigationCell * cell=self.cells[index];
        cell.frame=CGRectMake(index*menuW, 0, menuW, menuH);
    }
    CGFloat underlineX=0;
    CGFloat underlineH=height/6.125;
    CGFloat underlineY=height-underlineH;
    CGFloat underlineW=menuW;
    self.underLine.frame=CGRectMake(underlineX, underlineY, underlineW, underlineH);
    self.underLine.backgroundColor=self.backgroundColor;
    [self underlineAnimationWithIndex:self.defaultIndex];
}
/*加载数据*/
- (void)reloadData{
    for (int index=0; index<self.number; index++) {
        TXMenuNavigationCell * cell=self.cells[index];
        cell.backgroundColor=self.backgroundColor;
        cell.imageView.image=[UIImage imageNamed:self.icons[index]];
        cell.titleLabel.text=self.titles[index];
        cell.titleLabel.font=[UIFont systemFontOfSize:self.titleFontOfSize];
        cell.titleLabel.textColor=self.titleFontOfColor;
    }
}
/*手势事件*/
- (void)tap:(UITapGestureRecognizer*)sender{
    TXMenuNavigationCell * cell=(TXMenuNavigationCell*)sender.view;
    NSInteger curIndex=cell.tag-1000;
    [self underlineAnimationWithIndex:curIndex];
    if ([self.delegate respondsToSelector:@selector(menuNavigationBar:clickEvent:)]) {
        [self.delegate menuNavigationBar:self clickEvent:cell];
    }
}
/*下划线动画*/
- (void)underlineAnimationWithIndex:(NSInteger)index{
    TXMenuNavigationCell * cell = self.cells[index];
    CGRect frame=self.underLine.frame;
    frame.origin.x=cell.frame.origin.x;
    [UIView animateWithDuration:0.25 animations:^{
        self.underLine.frame=frame;
    }];
}
/*移除所有Cell*/
- (void)removeAllSubView{
    while ([self.subviews lastObject] != nil) {
        [(UIView*)[self.subviews lastObject] removeFromSuperview];
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
