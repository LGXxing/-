//
//  LLTDynamicViewController.m
//  GuoKu
//
//  Created by mac on 15-10-26.
//  Copyright (c) 2015年 llt. All rights reserved.
//


#import "LLTDynamicViewController.h"
#import "LLTLoginViewController.h"

@implementation LLTDynamicViewController

- (void)viewWillAppear:(BOOL)animated
{
    LLTLoginViewController *loginVC = [LLTLoginViewController new];
    loginVC.superVC = self;
    [self presentViewController:loginVC animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}


@end
