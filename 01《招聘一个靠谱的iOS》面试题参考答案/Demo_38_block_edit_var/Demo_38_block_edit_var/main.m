//
//  main.m
//  Demo_38_block_edit_var
//
//  Created by chenyilong on 2020/6/3.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
typedef void (^CYLBlock)(void);
int age = 10;
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        CYLBlock block = ^{
            age = 20;
            NSLog(@"age is %@", @(age));
        };
        block();
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
