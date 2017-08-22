//
//  LLTTeleTextDetailViewController.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLTTeleText.h"
#import "LLTCommodityDetailViewController.h"

@interface LLTTeleTextDetailViewController : UIViewController<UIWebViewDelegate>
{
    
    UIWebView *_contentWebView;
}

- (instancetype)initWithDataURLStr:(id)obj;


@end
