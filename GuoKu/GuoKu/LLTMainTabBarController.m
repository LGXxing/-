//
//  LLTMainTabBarController.m
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTMainTabBarController.h"
#import "LLTRecommendViewController.h"
#import "LLTDiscoverViewController.h"
#import "LLTDynamicViewController.h"
#import "LLTPersonalViewController.h"

@implementation LLTMainTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initUI];
}

- (void)initUI
{
    
//    UIImage *image = [UIImage imageNamed:@"tabbar_icon_selection"];
//    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    LLTRecommendViewController *recVC = [LLTRecommendViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:recVC];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabbar_icon_selection"] selectedImage:[[UIImage imageNamed:@"tabbar_icon_selection_press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    nav1.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    
    
    LLTDiscoverViewController *disVC = [LLTDiscoverViewController new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:disVC];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabbar_icon_discover"] selectedImage:[[UIImage imageNamed:@"tabbar_icon_discover_press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    nav2.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    
    LLTDynamicViewController *dynVC = [LLTDynamicViewController new];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:dynVC];
    nav3.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabbar_icon_notifaction"] selectedImage:[[UIImage imageNamed:@"tabbar_icon_notifaction_press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    nav3.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    
    LLTPersonalViewController *perVC = [LLTPersonalViewController new];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:perVC];
    nav4.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabbar_icon_me"] selectedImage:[[UIImage imageNamed:@"tabbar_icon_me_press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    nav4.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    self.tabBar.barStyle = UIBarStyleBlack;
    
}

@end
