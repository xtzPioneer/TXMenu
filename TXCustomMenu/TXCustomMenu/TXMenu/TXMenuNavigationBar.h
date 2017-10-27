//
//  TXMenuNavigationBar.h
//  TXCustomMenu
//
//  Created by komlin on 2017/10/26.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TXMenuNavigationCell;
@class TXMenuNavigationBar;
@class TXUnderLine;

@protocol TXMenuNavigationBarDelegate <NSObject>
@optional
- (void)menuNavigationBar:(TXMenuNavigationBar*)navigationBar clickEvent:(id)sender;
@end
@interface TXMenuNavigationBar : UIView
/*图标集合*/
@property (nonatomic,strong)NSArray<NSString*> * icons;
/*标题集合*/
@property (nonatomic,strong)NSArray<NSString*> * titles;
/*默认选择页*/
@property (nonatomic,assign)NSInteger defaultIndex;
/*菜单视图的集合*/
@property (nonatomic,strong,readonly)NSMutableArray<TXMenuNavigationCell*> * cells;
/*下划线*/
@property (nonatomic,weak)TXUnderLine      * underLine;
/*代理属性*/
@property (nonatomic,weak)id<TXMenuNavigationBarDelegate> delegate;
/*加载数据*/
- (void)reloadData;
/*下划线动画*/
- (void)underlineAnimationWithIndex:(NSInteger)index;
/*设置CellFrame*/
- (void)setupCellFrame;
/*构造方法*/
- (instancetype)initWithFrame:(CGRect)frame number:(NSInteger)number;
/*移除所有Cell*/
- (void)removeAllSubView;
@end
