//
//  WLLogManager.m
//  WLLog
//
//  Created by 王亮 on 2018/7/25.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import "WLLogManager.h"

@implementation WLLogManager
+(instancetype)sharedInstance{
    static  WLLogManager *obj = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        obj = [[self alloc] init];
        obj.logLevel = WLLogManager_All;
    });
    return obj;
}
-(void)output:(WLLogLevel)level funcName:(const char *)funcName line:(int)line fmt:(NSString *)fmt, ...{
    if (!fmt || ![fmt isKindOfClass:[NSString class]])
        return;
    else{
        if (_logLevel > level){
            va_list args;
            va_start(args, fmt);
            NSString *log = [[NSString alloc] initWithFormat:fmt arguments:args];
            fprintf(stdout, "[%s][%.2f][%s][%d]--> %s\n",
                    [[self level2String:level] UTF8String],
                    [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970],
                    funcName,
                    line,
                    [log UTF8String]);
            va_end(args);
            
            
            if (WLLogManager_Warn >= level) {
                NSLog(@"%@",log);
            }
        }
    }
}
- (void)redirectNSlogToDocumentFolder
{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"dr.log"];//注意不是NSData!
    NSString *logFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    //先删除已经存在的文件
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:logFilePath error:nil];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+", stderr);
}
-(NSString *)level2String:(WLLogLevel)level{
    if (level == WLLogManager_Error) return @"错误";
    if (level == WLLogManager_Warn)  return @"警告";
    if (level == WLLogManager_Debug) return @"测试";
    if (level == WLLogManager_Info)  return @"信息";
    return @"未知";
}
@end
