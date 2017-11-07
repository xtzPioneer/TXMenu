# TXMenu 简介
    这是一个可自定义主视图的菜单控制器，您可以将自定义视图添加到该菜单中来使用。
![](https://github.com/xtzPioneer/TXMenu/raw/master/自定义菜单.gif)
### cocoapods集成
* pod 'TXMenu', '~> 0.2.3'
### 使用方法
* 导入头文件 <TXMenu.h>  直接使用TXMenu...即可
```objc
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    TXMenu * menu=[[TXMenu alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, tRealLength(150)) number:4];
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
    menu.navigationBarBackgroundColor=[UIColor grayColor];
    menu.navigationBarTitleFontOfSize=tRealFontSize(9);
    menu.navigationBarHeight=tRealLength(40);
    menu.navigationBarTitleFontOfColor=[UIColor whiteColor];
    self.menu=menu;
}
```
