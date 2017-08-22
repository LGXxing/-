//
//  LLTCategory.m
//  GuoKu
//
//  Created by mac on 15-10-29.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTCategory.h"

@implementation LLTCategory

+ (LLTCategory *)categoryWithDict:(NSDictionary *)dict
{
    LLTCategory *category = [[LLTCategory alloc] init];
    
    NSString *status = dict[@"status"];
    if ([status isEqualToString:@"True"])
    {
        category.status = YES;
    }
    else
    {
        category.status = NO;
    }
    category.categoryID = dict[@"id"];
    category.coverURLStr = dict[@"cover_url"];
    category.title = dict[@"title"];
    
    return category;
}
@end
