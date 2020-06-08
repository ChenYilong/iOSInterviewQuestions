//
//  ViewController.m
//  Demo_38_block_edit_var
//
//  Created by chenyilong on 2020/6/3.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block int a = 0;
    int b = 1;
    NSLog(@"定义前外部：a：%p", &a);         //栈区
    NSLog(@"定义前外部：b：%p", &b);         //栈区
    void (^foo)(void) = ^{
        a = 1;
        NSLog(@"block内部：a：%p", &a);     //堆区
        NSLog(@"block内部：b：%p", &b);     //堆区
    };
    NSLog(@"定义后外部：a：%p", &a);         //堆区
    NSLog(@"定义后外部：b：%p", &b);         //栈区
    foo();
}


@end
