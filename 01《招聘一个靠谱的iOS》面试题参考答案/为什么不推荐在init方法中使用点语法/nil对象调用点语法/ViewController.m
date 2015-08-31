//
//  ViewController.m
//  nil对象调用点语法
//
//  Created by https://github.com/ChenYilong on 15/8/29.
//  Copyright (c) 2015年 http://weibo.com/luohanchenyilong/ 微博@iOS程序犭袁. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "MaPerson.h"
#import "SubView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //只需一步：初始化 MaPerson （调用init方法）
    MaPerson *ma = [[MaPerson alloc] init];
    NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, ma.lastName);
    //不需要第二步：调用Person的init
//        Person *p = [[Person alloc] init];
//    NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, p.lastName);
    SubView *sub = [[SubView alloc] init];
}

@end


