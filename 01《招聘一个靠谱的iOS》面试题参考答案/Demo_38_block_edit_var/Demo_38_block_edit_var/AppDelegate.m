//
//  AppDelegate.m
//  Demo_38_block_edit_var
//
//  Created by chenyilong on 2020/6/3.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSString *nso;


@end

@implementation AppDelegate

int age1 = 20;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    int a = 10;
    NSLog(@"数据段：age %p", &age1);
    NSLog(@"栈: a %p", &a);
    NSLog(@"堆：obj %p", [[NSObject alloc] init]);
    NSLog(@"class：obj %p", NSClassFromString(@"NSObject"));
    NSLog(@"class %p",  [NSObject class]);
//    for (int i = 0; i < 100000; ++i) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            id o =[NSString stringWithFormat:@"%@%@",  @"iTeaTime(技术清谈)", @(i)];
//               self.nso = o;
//        });
//    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
