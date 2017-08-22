//
//  AFAppDotNetAPIClient.h
//  视频播放
//
//  Created by 张泽楠 on 15/4/13.
//  Copyright (c) 2015年 ZhiYou. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
