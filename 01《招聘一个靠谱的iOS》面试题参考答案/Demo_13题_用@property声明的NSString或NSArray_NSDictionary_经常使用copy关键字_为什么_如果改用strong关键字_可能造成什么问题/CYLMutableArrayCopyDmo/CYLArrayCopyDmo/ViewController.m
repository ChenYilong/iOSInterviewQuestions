//
//  ViewController.m
//  CYLMutableArrayCopyDmo
//
//  Created by 陈宜龙 on 15/9/25.
//  Copyright © 2015年 http://weibo.com/luohanchenyilong/ 微博@iOS程序犭袁. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,readwrite, strong) NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[ @1, @2, @3, @4 ];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];

    self.array = mutableArray;
    [mutableArray removeAllObjects];;
    NSLog(@"%@",self.array);
    
    [mutableArray addObjectsFromArray:array];
    self.array = [mutableArray copy];
    [mutableArray removeAllObjects];;
    NSLog(@"%@",self.array);
}

@end
