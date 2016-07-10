//
//  SyjTabBarController.m
//  SyjWeiBo
//
//  Created by 史玉金 on 16/6/26.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "SyjTabBarController.h"
#import "SyjTabbar.h"
#import "HomeController.h"
#import "MessageController.h"
#import "DiscoverController.h"
#import "ProfileController.h"

@interface SyjTabBarController ()

@end

@implementation SyjTabBarController

//tabbarController是用init创建，重写init方法
// init方法内部会调用initWithNibName方法, 所以在自定义控制器时可以把初始化的代码放到initWithNibName方法中, 以后无论是通过init方法还是通过initWithNibName都可以初始化

-(instancetype)init{
    if (self=[super init]) {
        DDLogDebug(@" %d %s",__LINE__,__func__);
        UIViewController *home=[self creatViewControll:[HomeController class] andtitle:@"首页" andImage:@"tabbar_home" andSelectImg:@"tabbar_home_selected"];
        UIViewController *message=[self creatViewControll:[MessageController class] andtitle:@"消息" andImage:@"tabbar_message_center" andSelectImg:@"tabbar_message_center_selected"];
        UIViewController *discover=[self creatViewControll:[DiscoverController class] andtitle:@"发现" andImage:@"tabbar_discover" andSelectImg:@"tabbar_discover_selected"];
        UIViewController *profile=[self creatViewControll:[ProfileController class] andtitle:@"我" andImage:@"tabbar_profile" andSelectImg:@"tabbar_profile_selected"];
        
        self.viewControllers=@[home,message,discover,profile];

        
        
    }
    return self;
}

//代码封装，定义方法

-(UIViewController *)creatViewControll:(Class )class andtitle:(NSString *)title andImage:(NSString *)imgNam andSelectImg:(NSString *)selectImg{
    
    //一共4个控制器
    UIViewController *vc=[[class alloc]init];
    
//    vc.view.backgroundColor=[UIColor colorWithRed: ((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];//随机颜色
    UINavigationController *nv=[[UINavigationController alloc]initWithRootViewController:vc];
    
    //设置tabbarItem
    vc.tabBarItem.title=title;
    vc.tabBarItem.image =[UIImage imageNamed:imgNam];
    
    //设置选中时的图片
    // 1.创建图片
    UIImage *newImage =  [UIImage imageNamed:selectImg];
    // 2.告诉系统原样显示
    newImage = [newImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 3.设置图片
    //    vc.tabBarItem.selectedImage = newImage;
    [vc.tabBarItem setSelectedImage:newImage];
    
    // 设置tabBarButton的标题颜色的文字
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    return nv;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义UITabBar，添加选项卡+
    SyjTabbar *tabBtn=[[SyjTabbar alloc]init];
//    DDLogDebug(@"替换前 %@", self.tabBar);
    
    //替换系统的UItabbar
//    self.tabBar=tabBtn;//属性的值是只读，不能修改，
    //KVC的实现原理就是基于运行时，他可以在运行时的动态的修改属性
    [self setValue:tabBtn forKey:@"tabBar"];//这里通过系统的属性TabBar 作为key值 指向我们自定义的tabbtn
   
//    DDLogDebug(@"替换后 %@", self.tabBar);

    
    }

//view将要出现的时候
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    DDLogDebug(@"subviews = %@", self.tabBar.subviews);
//    for (UIView *child in self.tabBar.subviews) {
//        child.frame = CGRectMake(0, 0, 100, 100);
//    }//可有可无
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
