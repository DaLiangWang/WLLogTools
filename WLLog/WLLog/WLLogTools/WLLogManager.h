//
//  WLLogManager.h
//  WLLog
//
//  Created by 王亮 on 2018/7/25.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(unsigned char, WLLogLevel){
    WLLogManager_Nona = 0,
    WLLogManager_Error = 1,
    WLLogManager_Warn  = 2,
    WLLogManager_Debug = 3,
    WLLogManager_Info  = 4,
    WLLogManager_All  = 5,
};
@interface WLLogManager : NSObject
+(instancetype)sharedInstance;
-(void)output:(WLLogLevel)level funcName:(const char *)funcName line:(int)line fmt:(NSString *)fmt, ...;
/** 默认输出全部log */
@property(atomic, assign)WLLogLevel  logLevel;
@end
