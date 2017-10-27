//
//  TXMenu.h
//  TXCustomMenu
//
//  Created by komlin on 2017/10/26.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TXMenuNavigationBar.h"
@class TXMenu;
@protocol TXMenuDelegate <NSObject>
@optional
- (void)navigationBar:(TXMenuNavigationBar*)navigationBar clickEvent:(id)sender index:(NSInteger)index;
- (void)menu:(TXMenu*)menu slipEvent:(id)sender index:(NSInteger)index;
@end
@interface TXMenu : UIView<TXMenuNavigationBarDelegate>
/*导航栏高度*/
@property (nonatomic,assign)CGFloat navigationBarHeight;
/*导航栏颜色*/
@property (nonatomic,strong)UIColor * navigationBarBackgroundColor;
/*导航栏图标集合*/
@property (nonatomic,strong)NSArray<NSString*> * navigationBarIcons;
/*导航栏标题集合*/
@property (nonatomic,strong)NSArray<NSString*> * navigationBarTitles;
/*主视图集合*/
@property (nonatomic,strong)NSArray<UIView*>  * mainViews;
/*默认选择页*/
@property (nonatomic,assign)NSInteger defaultIndex;
/*设置主视图Frame*/
- (void)setupMainViewFrame;
/*代理属性*/
@property (nonatomic,weak)id<TXMenuDelegate> delegate;
/*主视图置动画*/
- (void)mainViewAnimationWithIndex:(NSInteger)Index
/*构造方法*/
- (instancetype)initWithFrame:(CGRect)frame number:(NSInteger)number;
/*移除所有MainView*/
- (void)removeAllMainView;
@end
