//
//  Son.m
//  Runtime
//
//  Created by http://weibo.com/luohanchenyilong/（微博@iOS程序犭袁）on 15/9/9.
//  Copyright © 2015年 https://github.com/ChenYilong . All rights reserved.
//

#import "Son.h"
#import <objc/runtime.h>
#import "ForwardingTarge.h"

@interface Son ()

@property (nonatomic, strong) ForwardingTarge *target;

@end

@implementation Son


- (instancetype)init
{
    self = [super init];
    if (self) {
        _target = [ForwardingTarge new];
        [self performSelector:@selector(sel) withObject:nil];
        [self performSelector:@selector(sel2) withObject:nil];
    }
    
    return self;
}

id dynamicMethodIMP(id self, SEL _cmd)
{
    NSLog(@"%s:动态添加的方法",__FUNCTION__);
    return @"1";
}


+ (BOOL)resolveInstanceMethod:(SEL)sel __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    
    class_addMethod(self.class, sel, (IMP)dynamicMethodIMP, "@@:");
    BOOL rslt = [super resolveInstanceMethod:sel];
    rslt = YES;
    return rslt; // 1
}

- (id)forwardingTargetForSelector:(SEL)aSelector __OSX_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0) {
    id rslt = [super forwardingTargetForSelector:aSelector];
    rslt = self.target;
    return rslt; // 2
}

//OBJC_SWIFT_UNAVAILABLE("")
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    id rslt = [super methodSignatureForSelector:aSelector];
    NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    rslt = sig;
    return rslt; // 3
}

//OBJC_SWIFT_UNAVAILABLE("")
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
//    [super forwardInvocation:anInvocation];
    [self.target forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    // 在crash前 保存crash数据，供分析
    
    [super doesNotRecognizeSelector:aSelector]; // crash
}


@end
