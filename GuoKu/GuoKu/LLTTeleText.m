//
//  LLTTeleText.m
//  GuoKu
//
//  Created by mac on 15-10-27.
//  Copyright (c) 2015年 llt. All rights reserved.
//

#import "LLTTeleText.h"

@implementation LLTTeleText
+ (LLTTeleText *)teleTextWithDict:(NSDictionary *)dict
{
    
    LLTTeleText *teleText = [[LLTTeleText alloc] init];
    
    teleText.readCount = dict[@"read_count"];
    teleText.pubTime = [dict[@"pub_time"] integerValue];
    teleText.title = dict[@"title"];
    
    NSString *articalstr = [NSString stringWithFormat:@"http://m.guoku.com%@",dict[@"url"]];
    teleText.urlStr = articalstr;
    teleText.tagsArray = dict[@"tags"];
    teleText.content = dict[@"content"];
    teleText.coverURLStr = [NSString stringWithFormat:@"http://imgcdn.guoku.com/%@",dict[@"cover"]];
    teleText.user = [LLTUser userWithDict:dict[@"creator"]];
    teleText.articleID = [dict[@"article_id"] integerValue];
    
    return teleText;
}

@end
