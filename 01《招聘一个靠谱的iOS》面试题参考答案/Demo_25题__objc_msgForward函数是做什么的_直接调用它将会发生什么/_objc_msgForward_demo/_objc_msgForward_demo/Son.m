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

- (instancetype)init {
    self = [super init];
    if (self) {
        _target = [ForwardingTarge new];
        [self performSelector:@selector(sel) withObject:nil];
        [self performSelector:@selector(sel2) withObject:nil];
    }
    return self;
}

id dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"%s:动态添加的方法",__FUNCTION__);
    return @0;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod(self.class, sel, (IMP)dynamicMethodIMP, "@@:");
    BOOL result = [super resolveInstanceMethod:sel];
    result = YES;
    return result; // 1
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id result = [super forwardingTargetForSelector:aSelector];
    result = self.target;
    return result; // 2
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id result = [super methodSignatureForSelector:aSelector];
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    result = signature;
    return result; // 3
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    [super forwardInvocation:anInvocation];
    [self.target forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    // 在crash前 保存crash数据，供分析
    [super doesNotRecognizeSelector:aSelector]; // crash
}

@end
