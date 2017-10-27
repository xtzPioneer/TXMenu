//
//  TXMenu.m
//  TXCustomMenu
//
//  Created by komlin on 2017/10/26.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "TXMenu.h"
@interface TXMenu ()<UIScrollViewDelegate>
@property (nonatomic,weak)TXMenuNavigationBar * navigationBar;
@property (nonatomic,assign)NSInteger number;
@property (nonatomic,weak)UIScrollView * scrollView;
@end

@implementation TXMenu
/*构造方法*/
- (instancetype)initWithFrame:(CGRect)frame number:(NSInteger)number{
    if (self = [super initWithFrame:frame]) {
        // 数量
        self.number=number;
        // 菜单导航栏
        TXMenuNavigationBar * navigationBar=[[TXMenuNavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,49) number:number];
        navigationBar.backgroundColor=[UIColor grayColor];
        navigationBar.delegate=self;
        self.navigationBar=navigationBar;
        //scrollView
        UIScrollView * scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(navigationBar.frame), self.frame.size.width, self.frame.size.height)];
        scrollView.delegate=self;
        scrollView.pagingEnabled=YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView=scrollView;
        [self addSubview:navigationBar];
        [self addSubview:scrollView];
        
    }
    return self;
}
/*导航栏图标集合*/
- (void)setNavigationBarIcons:(NSArray<NSString *> *)navigationBarIcons{
    _navigationBarIcons=navigationBarIcons;
    self.navigationBar.icons=_navigationBarIcons;
}
/*导航栏标题集合*/
- (void)setNavigationBarTitles:(NSArray<NSString *> *)navigationBarTitles{
    _navigationBarTitles=navigationBarTitles;
    self.navigationBar.titles=_navigationBarTitles;
}
/*默认选择页*/
- (void)setDefaultIndex:(NSInteger)defaultIndex{
    _defaultIndex=defaultIndex;
    self.navigationBar.defaultIndex=_defaultIndex;
    CGFloat x=self.scrollView.frame.size.width*_defaultIndex;
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = CGPointMake(x, 0);
    }];
    
}
/*按钮以及主视图的数量*/
- (void)setMainViews:(NSArray<UIView *> *)mainViews{
    _mainViews=mainViews;
    [self removeAllMainView];
    [self setupMainViewFrame];
}
/*导航栏高度*/
- (void)setNavigationBarHeight:(CGFloat)navigationBarHeight{
    _navigationBarHeight=navigationBarHeight;
    
    CGRect navigationBarFrame=self.navigationBar.frame;
    navigationBarFrame.size.height=_navigationBarHeight;
    self.navigationBar.frame=navigationBarFrame;
    [self.navigationBar setupCellFrame];
    
    CGRect scrollViewFrame=self.scrollView.frame;
    scrollViewFrame.origin.y=CGRectGetMaxY(self.navigationBar.frame);
    scrollViewFrame.size.height=self.frame.size.height-self.navigationBar.frame.size.height;
    self.scrollView.frame=scrollViewFrame;
    [self setupMainViewFrame];
}
/*导航栏颜色*/
- (void)setNavigationBarBackgroundColor:(UIColor *)navigationBarBackgroundColor{
    _navigationBarBackgroundColor=navigationBarBackgroundColor;
    self.navigationBar.backgroundColor=_navigationBarBackgroundColor;
    [self.navigationBar reloadData];
}

/*设置主视图Frame*/
- (void)setupMainViewFrame{
    CGFloat mainViewW=self.scrollView.frame.size.width;
    CGFloat mainViewY=0;
    CGFloat mainViewH=self.scrollView.frame.size.height;
    self.scrollView.contentSize=CGSizeMake(mainViewW*self.number, 0);
    for (int index=0; index<self.number; index++) {
        UIView * mainView=_mainViews[index];
        CGFloat mainViewX=index*mainViewW;
        mainView.frame=CGRectMake(mainViewX, mainViewY, mainViewW, mainViewH);
        [self.scrollView addSubview:mainView];
    }
    [self mainViewAnimationWithIndex:self.defaultIndex];
}
#pragma mark - UIScrollViewDelegate 方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
     NSInteger curIndex = scrollView.contentOffset.x/self.scrollView.frame.size.width;
    [self.navigationBar underlineAnimationWithIndex:curIndex];
    if ([self.delegate respondsToSelector:@selector(menu:slipEvent:index:)]) {
        [self.delegate menu:self slipEvent:self.mainViews[curIndex] index:curIndex];
    }
}
#pragma mark - TXMenuNavigationBarDelegate 方法
- (void)menuNavigationBar:(TXMenuNavigationBar *)navigationBar clickEvent:(id)sender{
    TXMenuNavigationCell * cell=sender;
    NSInteger curIndex=cell.tag-1000;
    [self mainViewAnimationWithIndex:curIndex];
    if ([self.delegate respondsToSelector:@selector(navigationBar:clickEvent:index:)]) {
        [self.delegate navigationBar:navigationBar clickEvent:cell index:curIndex];
    }
}
/*移除所有MainView*/
- (void)removeAllMainView{
    while ([self.scrollView.subviews lastObject] != nil) {
        [(UIView*)[self.scrollView.subviews lastObject] removeFromSuperview];
    }
}
/*主视图置动画*/
- (void)mainViewAnimationWithIndex:(NSInteger)Index{
    CGFloat x=self.scrollView.frame.size.width*Index;
    [UIView animateWithDuration:0.25 animations:^{
        self.scrollView.contentOffset = CGPointMake(x, 0);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
