//
//  NSNotificationCenterBlock.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "NSNotificationCenterBlock.h"

@interface NSNotificationCenterBlock ()

@end

@implementation NSNotificationCenterBlock

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserverForName:@"someNotification"
                           object:nil
                           queue:[NSOperationQueue mainQueue]
                       usingBlock:^(NSNotification * notification) {
        NSLog(@"%@", self);
    }];
}


- (void)remove {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self remove];
}

- (void)dealloc {
    [self remove];
    NSLog(@"🔴类名与方法名：%@（在第%@行）, 描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}


@end
