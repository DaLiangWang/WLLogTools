//
//  ViewController.m
//  WLLog
//
//  Created by 王亮 on 2018/7/25.
//  Copyright © 2018年 王亮. All rights reserved.
//

#import "ViewController.h"
#import "WLLogHeader.h"


@interface ViewController ()

@end

@implementation ViewController
//各种数据类型转字符串
//#define string(FORMAT,...) [NSString stringWithFormat:FORMAT,__VA_ARGS__]

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WLLogDebug(@"%@",@"1");
    WLLogWarn(@"%@",@"2");
    WLLogError(@"%@",@"3");
    WLLogInfo(@"%@",@"4");
//    [self WLLog:@"1234%@",@"vvv"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
