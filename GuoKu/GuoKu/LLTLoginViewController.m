//
//  LLTLoginViewController.m
//  GuoKu
//
//  Created by mac on 15-11-9.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTLoginViewController.h"

@implementation LLTLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _loginBtn.layer.cornerRadius = 5.0f;
    _loginBtn.clipsToBounds = YES;

}

- (IBAction)exitBtnClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.superVC.tabBarController.selectedIndex = 0;
}
- (IBAction)registerBtnClick:(id)sender
{
}

- (IBAction)loginBtnclick:(id)sender
{
}

@end
