//
//  TXMenuNavigationBar.m
//  TXCustomMenu
//
//  Created by komlin on 2017/10/26.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "TXMenuNavigationBar.h"
@interface TXMenuNavigationBar ()
@property (nonatomic,assign)NSInteger number;
@end;

@implementation TXMenuNavigationBar
/*构造方法*/
- (instancetype)initWithFrame:(CGRect)frame number:(NSInteger)number{
    if (self =[super initWithFrame:frame] ) {
        _cells=[NSMutableArray array];
        self.number=number;
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
    TXMenuNavigationCell * cell = self.cells[_defaultIndex];
    CGRect frame=self.underLine.frame;
    frame.origin.x=cell.frame.origin.x;
    [self changeUnderlineFrameWithRect:frame];
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
    TXMenuNavigationCell * cell = self.cells[_defaultIndex];
    CGRect frame=self.underLine.frame;
    frame.origin.x=cell.frame.origin.x;
    [self changeUnderlineFrameWithRect:frame];
}
/*加载数据*/
- (void)reloadData{
    for (int index=0; index<self.number; index++) {
        TXMenuNavigationCell * cell=self.cells[index];
        cell.backgroundColor=self.backgroundColor;
        cell.imageView.image=[UIImage imageNamed:self.icons[index]];
        cell.titleLabel.text=self.titles[index];
    }
}
/*手势事件*/
- (void)tap:(UITapGestureRecognizer*)sender{
    TXMenuNavigationCell * cell=(TXMenuNavigationCell*)sender.view;
    CGRect frame=self.underLine.frame;
    frame.origin.x=cell.frame.origin.x;
    [self changeUnderlineFrameWithRect:frame];
    if ([self.delegate respondsToSelector:@selector(menuNavigationBar:clickEvent:)]) {
        [self.delegate menuNavigationBar:self clickEvent:cell];
    }
}
/*改变下划线*/
- (void)changeUnderlineFrameWithRect:(CGRect)rect{
    [UIView animateWithDuration:0.25 animations:^{
        self.underLine.frame=rect;
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
