//
//  main.m
//  Demo_01_CodeStyle
//
//  Created by chenyilong on 2020/6/3.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSArray *a = @[@1,@2,@3];
        uint32_t count = a.count - 1;
        for (int32_t i = -1; i < count; ++i) {
            NSLog(@"%s %@", __func__, a[i + 1]);
        }
        for (int32_t i = -1; (int32_t)i < (int32_t)count; ++i) {
            NSLog(@"%s %@", __func__, a[i + 1]);
        }
        for (int32_t i = -1; (uint32_t)i < (uint32_t)count; ++i) {
            NSLog(@"%s %@", __func__, a[i + 1]);
        }
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
