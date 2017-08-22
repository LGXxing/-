//
//  LLTGuoKuEnginee.h
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLTCommodity.h"
#import "LLTTeleText.h"
#import "LLTBanner.h"
#import "LLTCategory.h"

@interface LLTGuoKuEnginee : NSObject

+ (void)getCommodityWithCount:(NSInteger)count complete:(void (^)(NSArray *)) block;
+ (void)getTeleTextWithSize:(NSInteger)size complete:(void (^)(NSArray *)) block;

+ (void)getDiscovertWithComplete:(void (^)(NSDictionary *)) block;
+ (void)getCommdityWithEntityID:(NSString *)entityID complete:(void (^)(NSArray *)) block;
+ (void)getGuessWithEntityID:(NSString *)entityID complete:(void (^)(NSArray *)) block;
+ (void)getEntityWithCategoryID:(NSString *)categoryID complete:(void (^)(NSArray *)) block;
+ (NSString *)getTimeStrWithPostTime:(NSInteger)postTime;

@end
