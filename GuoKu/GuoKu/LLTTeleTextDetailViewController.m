//
//  LLTTeleTextDetailViewController.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTTeleTextDetailViewController.h"

@implementation LLTTeleTextDetailViewController


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (instancetype)initWithDataURLStr:(id)obj
{
    self = [super init];
    
    if (self)
    {
        _contentWebView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _contentWebView.delegate = self;
        [self.view addSubview:_contentWebView];
        self.navigationItem.hidesBackButton = YES;
        if ([obj isKindOfClass:[LLTTeleText class]])
        {
            LLTTeleText *teleText = obj;
            NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:teleText.urlStr]];
            [_contentWebView loadRequest:request];
            
            self.title = teleText.title;
        }
        else
        {
            NSString *str = obj;
            NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:str]];
            [_contentWebView loadRequest:request];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    
    UILabel *backLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 44)];
    backLabel.textColor = [UIColor blackColor];
    backLabel.text = @"返回";
    [backView addSubview:backLabel];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(-20, 0, 44, 44)];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"back_press"] forState:UIControlStateHighlighted];
    [backView addSubview:btn];
    
    UIButton *bigbtn = [[UIButton alloc] initWithFrame:CGRectMake(-20, 0, 70, 44)];
    [bigbtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:bigbtn];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backView];
    
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"more"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(shareBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
}

- (void)backBtnClick
{
    if ([_contentWebView canGoBack])
    {
        [_contentWebView goBack];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
- (void)shareBtnClick
{
    
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%s",__func__);
    
    NSLog(@"absoluteString   %@",request.URL.absoluteString);
    
    NSArray *subStr1Array = [request.URL.absoluteString componentsSeparatedByString:@":"];
    if ([subStr1Array[0] isEqualToString:@"guoku"])
    {
        NSArray *subStr2Array = [subStr1Array[1] componentsSeparatedByString:@"//"];
        if ([subStr2Array[1] componentsSeparatedByString:@"entity/"].count > 1)
        {

            NSString *entityID = [subStr2Array[1] componentsSeparatedByString:@"entity/"][1];
             NSLog(@"商品编号1：>>> %@",entityID);
            
            entityID = [entityID substringToIndex:entityID.length - 1];
            NSLog(@"商品编号2：>>> %@",entityID);
            
//             商品编号：>>> 1565823/
            LLTCommodityDetailViewController *detailVC = [[LLTCommodityDetailViewController alloc] initEntityID:entityID];
            [self.navigationController pushViewController:detailVC animated:YES];
            
        }
        else
        {
            NSString *userID = [subStr2Array[1] componentsSeparatedByString:@"user/"][1];
            userID = [userID substringToIndex:userID.length - 1];
            NSLog(@"用户id：>>> %@",userID);
//             用户id：>>> 1948619/
        }

    }
    
    
    return YES;
}
@end
