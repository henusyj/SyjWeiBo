//
//  SyjTabbar.m
//  SyjWeiBo
//
//  Created by 史玉金 on 16/6/26.
//  Copyright © 2016年 史玉金. All rights reserved.
//

#import "SyjTabbar.h"

@interface SyjTabbar ()
/**
 *  添加加号
 */
@property(nonatomic,weak)UIButton *plusBtn;

@end



@implementation SyjTabbar

//自定义tabBtn里的空间，调用
-(instancetype)initWithFrame:(CGRect)frame{
    DDLogDebug(@"%s",__func__);
    
    if (self=[super initWithFrame:frame]) {
//        dispatch_async(dispatch_queue_create("sjj", NULL),^{
            //添加控件----plusBtn
            UIButton *btn=[[UIButton alloc]init];
            //设置图片
            [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
            
            [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
            [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateHighlighted];
        //设置btn的标识符
        btn.tag=111;
        
        
            //添加到tabbar中
            self.plusBtn=btn;
            
            [self addSubview:btn];
            //设置大小，需要在laysubview中

//        });

    }
    return self;
}

/**
 * 更新子视图的frame会调用
 */
-(void)layoutSubviews{
    DDLogDebug(@"%s",__func__);

    [super layoutSubviews];
    
    //定义的tabb继承系统的tabbar，故有子控件
    
    /**
     *  修改子控件的位子，大小
     * 第一种：出现错误，第二种成立
     *  添加选项卡
     */
    
    /*
    
    NSUInteger index=self.subviews.count;
    DDLogDebug(@"indext=%ld",index);//自定义TabBar的子控件不止4个按钮, 还有背景图片和分割线,这里输出的是6，导致我们在for，循环中，添加的选项卡不在中间

    for (int i=0; i<index; i++) {
        UIView *child=self.subviews[i];//把每一个ItemButton（父类也是UIView）给child
        //判断是否是UITbaBarButton，UITabBarButton是系统是由控件
        if ([child isKindOfClass:[UIControl class]]) {
            DDLogDebug(@"%d %d",__LINE__,i);//通过判断类，符合的ITem的有四个
             //计算每个按钮的frame
            CGFloat childW=self.frame.size.width/5;
            CGFloat childH=self.frame.size.height;
            CGFloat childX=i*childW;
            CGFloat childY=0;
            
            if (i==2) {//达不到位子所在地
                //新添加的选 +
                childX=i*childW;
            }
            child.frame=CGRectMake(childX, childY, childW, childH);

        }
        
       
    }
    */
    NSInteger index=0;
    
    for (UIView *child in self.subviews) {
        
        //把tag为111的去掉，修复bug
        /**
         *  或者
         if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")])
         */

        if ([child isKindOfClass:[UIControl class]]) {
            if (child.tag==111) {
                continue;
            }
            
            //计算每个按钮的fram
            CGFloat childW=self.frame.size.width/5;
            CGFloat childH=self.frame.size.height;
            CGFloat childX=index *childW;//0
            CGFloat childY=0;
            if (index==2) {
                index++;
                childX=index*childW;
            }
            index++;
            child.frame=CGRectMake(childX, childY, childW, childH);
            

        }
        
    }
    
    //设置plusBtn的大小；
    /**
     *  通过frame分类，简化了修改结构体类型的大小
     */
        //plusBtn的大小就是图片大小
    self.plusBtn.size=self.plusBtn.currentBackgroundImage.size;
    self.plusBtn.centerX=self.width*0.5;
    self.plusBtn.centerY=self.height*0.5;
    
    /**
     *  第二种方式
     
         CGPoint centerPoint = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
       self.plusBtn.center = centerPoint;
        self.plusBtn.frame
     
     */
    
    
}




@end
