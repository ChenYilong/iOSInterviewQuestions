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

id dynamicMethod(id self, SEL _cmd) {
    NSLog(@"%s:动态添加的方法",__FUNCTION__);
    return @0;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod(self.class, sel, (IMP)dynamicMethod, "@@:");
    BOOL result = [super resolveInstanceMethod:sel];
    result = YES;
    return result;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id result = [super forwardingTargetForSelector:aSelector];
    return result;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id result = [super methodSignatureForSelector:aSelector];
    return result;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [super forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector]; // crash
}

@end
