//
//  WLLogHeader.h
//  WLLog
//
//  Created by 王亮 on 2018/7/25.
//  Copyright © 2018年 王亮. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "WLLogManager.h"


#ifdef  DEBUG
#define WLLogLevel(LogLevel) [[WLLogManager sharedInstance] setLogLevel:LogLevel];

#define WLLogDebug(...)  [[WLLogManager sharedInstance] output:WLLogManager_Debug funcName:__func__ line:__LINE__ fmt:__VA_ARGS__];
#define WLLogWarn(...)  [[WLLogManager sharedInstance] output:WLLogManager_Warn  funcName:__func__ line:__LINE__ fmt:__VA_ARGS__];
#define WLLogError(...)  [[WLLogManager sharedInstance] output:WLLogManager_Error funcName:__func__ line:__LINE__ fmt:__VA_ARGS__];
#define WLLogInfo(...)  [[WLLogManager sharedInstance] output:WLLogManager_Info  funcName:__func__ line:__LINE__ fmt:__VA_ARGS__];

#else
#define WLLogLevel(...)
#define WLLogDebug(...)
#define WLLogWarn(...)
#define WLLogError(...)
#define WLLogInfo(...)
#endif
