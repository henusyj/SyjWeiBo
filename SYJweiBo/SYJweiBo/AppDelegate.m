//
//  AppDelegate.m
//  SyjWeiBo
//
//  Created by 史玉金 on 16/6/25.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "AppDelegate.h"
#import "SyjTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    //初始化自定义Log
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    
    //创建windows
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    
    //创建设置根控制器
    SyjTabBarController *tabbar=[[SyjTabBarController alloc]init];//init创建，重写init方法
    
    self.window.rootViewController=tabbar;
    
    
    //创建子控制器
    /**
     *  一共有4个子控制器
     */
    
//    UIViewController *v1=[[UIViewController alloc]init];
//    v1.view.backgroundColor=[UIColor redColor];
//    UINavigationController *nv1=[[UINavigationController alloc]initWithRootViewController:v1];
////    [tabbar addChildViewController:nv1];
//    
//    
//    UIViewController *v2=[[UIViewController alloc]init];
//    v2.view.backgroundColor=[UIColor blueColor];
//    UINavigationController *nv2=[[UINavigationController alloc]initWithRootViewController:v2];
////    [tabbar addChildViewController:nv2];
//
//    
//    UIViewController *v3=[[UIViewController alloc]init];
//    v3.view.backgroundColor=[UIColor purpleColor];
//    UINavigationController *nv3=[[UINavigationController alloc]initWithRootViewController:v3];
////    [tabbar addChildViewController:nv3];
//
//    
//    UIViewController *v4=[[UIViewController alloc]init];
//    v4.view.backgroundColor=[UIColor grayColor];
//    UINavigationController *nv4=[[UINavigationController alloc]initWithRootViewController:v4];
////    [tabbar addChildViewController:nv4];
//    
//  
//
//    //设置tabbaritem.title  和 image
//    v1.tabBarItem.title=@"首页";
//    v1.tabBarItem.image=[UIImage imageNamed:@"tabbar_home"];
//    
//    v2.tabBarItem.title=@"消息";
//    v2.tabBarItem.image=[UIImage imageNamed:@"tabbar_message_center"];
//    
//    v3.tabBarItem.title=@"发现";
//    v3.tabBarItem.image=[UIImage imageNamed:@"tabbar_discover"];
//    
//    v4.tabBarItem.title=@"我";
//    v4.tabBarItem.image=[UIImage imageNamed:@"tabbar_profile"];
//    
//    tabbar.viewControllers=@[nv1,nv2,nv3,nv4];//放在设置tabbarItem的下面，不然，不显示
//    
//
    
    //上面代码进行封装
   
    
    //取消tabbar的渲染效果
//    tabbar.tabBar.tintColor=[UIColor redColor];
    //显示控制器
    [self.window makeKeyAndVisible];
    return YES;
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
