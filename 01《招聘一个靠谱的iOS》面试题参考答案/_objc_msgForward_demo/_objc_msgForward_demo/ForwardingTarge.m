//
//  ForwardingTarge.m
//  Runtime
//
//  Created by http://weibo.com/luohanchenyilong/（微博@iOS程序犭袁）on 15/9/9.
//  Copyright © 2015年 https://github.com/ChenYilong . All rights reserved.
//

#import "ForwardingTarge.h"
#import <objc/runtime.h>

@implementation ForwardingTarge

id dynamicMethod(id self, SEL _cmd)
{
    NSLog(@"%s:动态添加的方法",__FUNCTION__);
    return @"1";
}


+ (BOOL)resolveInstanceMethod:(SEL)sel __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    
    class_addMethod(self.class, sel, (IMP)dynamicMethod, "@@:");
    BOOL rslt = [super resolveInstanceMethod:sel];
    rslt = YES;
    return rslt;
}

- (id)forwardingTargetForSelector:(SEL)aSelector __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    id rslt = [super forwardingTargetForSelector:aSelector];
    return rslt;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector

//OBJC_SWIFT_UNAVAILABLE("")

{
    id rslt = [super methodSignatureForSelector:aSelector];
    return rslt;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation

//OBJC_SWIFT_UNAVAILABLE("")

{
    [super forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {

    [super doesNotRecognizeSelector:aSelector]; // crash
}

@end
