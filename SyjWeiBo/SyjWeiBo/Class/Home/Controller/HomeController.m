//
//  HomeController.m
//  SyjWeiBo
//
//  Created by 史玉金 on 16/7/9.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "HomeController.h"
#import "QRtabBarController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"首页";
    
    //设置左边导航栏
    [self setLeftNavbar];
    
    //设置右边的导航栏
    [self setRightNavbar];
}
#pragma mark -设置左边的导航栏
-(void)setLeftNavbar{
    //设置图片
    UIImage *img=[UIImage imageNamed:@"navigationbar_friendsearch"];
    UIButton *LeftBt=[[UIButton alloc]init];
    //设置对应状态的图片
    [LeftBt setImage:img forState:UIControlStateNormal];
    [LeftBt setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
    //设置点击事件
    [LeftBt addTarget:self action:@selector(meClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *LeftItem=[[UIBarButtonItem alloc]initWithCustomView:LeftBt];
    //设置大小
    LeftBt.size=LeftBt.currentImage.size;
    
    self.navigationItem.leftBarButtonItems=@[LeftItem];
    
}
#pragma mark -左边导航栏的点击事件
-(void)meClick:(UIButton *)sender{
    DDLogDebug(@"me");
}

#pragma mark -设置右边的导航栏
-(void)setRightNavbar{
    UIButton *rightBt=[UIButton new];
    //设置图片
    [rightBt setImage:[UIImage imageNamed:@"navigationbar_pop"] forState:UIControlStateNormal];
    [rightBt setImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] forState:UIControlStateHighlighted];
    //设置点击事件
    [rightBt addTarget:self action:@selector(QRClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBt];
    //设置大小
    rightBt.size=rightBt.currentImage.size;
    
    self.navigationItem.rightBarButtonItems=@[rightItem];
}
#pragma mark -右边导航栏的点击事件
-(void)QRClick:(UIButton *)sender{
    DDLogDebug(@"QR");
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"QR" bundle:nil];//通过sb来找到控制器
    QRtabBarController *tabbar=[sb instantiateInitialViewController];
    [self presentViewController:tabbar animated:YES completion:nil];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
