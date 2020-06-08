//
//  CYLBaseViewController+CYLBaseViewControllerExtension.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/7.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "CYLBaseViewController+CYLBaseViewControllerExtension.h"

@implementation CYLBaseViewController (CYLBaseViewControllerExtension)

- (void)cyl_test {
    NSLog(@"🔴类名与方法名：%@（在第%@行）, 描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}

+ (void)cyl_testClass {
    NSLog(@"🔴类名与方法名：%@（在第%@行）, 描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}

@end
