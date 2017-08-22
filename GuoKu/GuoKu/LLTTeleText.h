//
//  LLTTeleText.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLTUser.h"

@interface LLTTeleText : NSObject

+ (LLTTeleText *)teleTextWithDict:(NSDictionary *)dict;

@property (nonatomic, copy)NSString *readCount;
@property (nonatomic, assign)NSInteger pubTime;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *urlStr;
@property (nonatomic, strong)NSArray *tagsArray;
@property (nonatomic, copy)NSString *coverURLStr;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, strong)LLTUser *user;
@property (nonatomic, assign)NSInteger articleID;

@end
