//
//  LLTBanner.m
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTBanner.h"

@implementation LLTBanner

+(LLTBanner *)bannerWithDict:(NSDictionary *)dict
{
    LLTBanner *banner = [[LLTBanner alloc] init];
    
    NSString *urlStr = dict[@"url"];
    
    if ([[urlStr componentsSeparatedByString:@":"][0] isEqualToString:@"guoku"])
    {
        NSString * s = [[urlStr componentsSeparatedByString:@":"][1] componentsSeparatedByString:@"entity/"][1];
        
        banner.urlStr = s;
        
        banner.bannerType = 0;
    }
    else
    {
        banner.bannerType = 1;
        banner.urlStr = urlStr;
    }
    banner.imageURLStr = dict[@"img"];
    return banner;
    
}
@end
