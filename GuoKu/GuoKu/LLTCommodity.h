//
//  LLTCommodity.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLTUser.h"

@interface LLTCommodity : NSObject

+ (LLTCommodity *)commodityWithDict:(NSDictionary *)dict;

@property (nonatomic, copy)NSString *entityID;
@property (nonatomic, copy)NSString *userID;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *contentImageStr;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *byLinkURLStr;
@property (nonatomic, assign)BOOL likeAlready;
@property (nonatomic, assign)NSInteger postTime;
@property (nonatomic, assign)NSInteger commentCount;
@property (nonatomic, assign)NSInteger likeCount;

@property (nonatomic, strong)LLTUser *creator;
@property (nonatomic, strong)NSArray *detailImagesArray;
@property (nonatomic, copy)NSString *sendTime;
@property (nonatomic, assign)NSInteger noteCount;







@end
