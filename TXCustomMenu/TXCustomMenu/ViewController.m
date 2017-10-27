//
//  ViewController.m
//  TXCustomMenu
//
//  Created by komlin on 2017/10/26.
//  Copyright © 2017年 komlin. All rights reserved.
//

#import "ViewController.h"
#import "TXMenu.h"

#import "TXView0.h"
#import "TXView1.h"
#import "TXView2.h"
#import "TXView3.h"

@interface ViewController ()<TXMenuDelegate>
@property (nonatomic,weak)TXMenu * menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    TXMenu * menu=[[TXMenu alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200) number:4];
    menu.backgroundColor=[UIColor whiteColor];
    menu.delegate=self;
    menu.navigationBarIcons  = @[@"喷油嘴清洗",@"温度",@"空间",@"材料"];
    menu.navigationBarTitles = @[@"200C\n喷嘴温度",@"60C\n热床温度",@"移动轴",@"耗材"];
    TXView0 * view0=[TXView0 new];
    view0.backgroundColor=[UIColor whiteColor];
    view0.titleLabel.text=@"视图0";
    TXView1 * view1=[TXView1 new];
    view1.backgroundColor=[UIColor whiteColor];
    view1.titleLabel.text=@"视图1";
    TXView2 * view2=[TXView2 new];
    view2.backgroundColor=[UIColor whiteColor];
    view2.titleLabel.text=@"视图2";
    TXView3 * view3=[TXView3 new];
    view3.backgroundColor=[UIColor whiteColor];
    view3.titleLabel.text=@"视图3";
    
    menu.mainViews=@[view0,view1,view2,view3];
    menu.navigationBarHeight=49;
    menu.navigationBarBackgroundColor=[UIColor grayColor];
    self.menu=menu;
    
    [self.view addSubview:menu];
    
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-80)/2, 330, 80, 40)];
    [button setTitle:@"刷新数据" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    button.backgroundColor=[UIColor redColor];
    button.layer.cornerRadius=10;
    button.layer.masksToBounds=YES;
    [button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button2=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-150)/2, 400, 150, 40)];
    [button2 setTitle:@"重新设置导航高度" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    button2.backgroundColor=[UIColor redColor];
    button2.layer.cornerRadius=10;
    button2.layer.masksToBounds=YES;
    [button2 addTarget:self action:@selector(buttonEvent1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}
- (void)buttonEvent{
    NSInteger  i= arc4random() % 200;
    NSString * str1=[NSString stringWithFormat:@"%ldC\n喷嘴温度",(long)i];
    NSInteger  b= arc4random() % 200;
    NSString * str2=[NSString stringWithFormat:@"%ldC\n热床温度",(long)b];
    self.menu.navigationBarTitles=@[str1,str2,@"移动轴",@"耗材"];
}
- (void)buttonEvent1{
    self.menu.navigationBarHeight=64;
}
- (void)menu:(TXMenu *)menu slipEvent:(id)sender index:(NSInteger)index{
    NSLog(@"滑动:%ld",(long)index);
}
- (void)navigationBar:(TXMenuNavigationBar *)navigationBar clickEvent:(id)sender index:(NSInteger)index{
    NSLog(@"点击:%ld",(long)index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
