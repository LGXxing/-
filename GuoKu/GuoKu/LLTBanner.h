//
//  LLTBanner.h
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLTBanner : NSObject

+(LLTBanner *)bannerWithDict:(NSDictionary *)dict;

@property (nonatomic, copy)NSString *urlStr;
@property (nonatomic, copy)NSString *imageURLStr;
@property (nonatomic, assign)NSInteger bannerType;

@end
