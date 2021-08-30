
[《招聘一个靠谱的 iOS》](http://blog.sunnyxx.com/2015/07/04/ios-interview/)—参考答案（下）


说明：面试题来源是[微博@我就叫Sunny怎么了](http://weibo.com/u/1364395395)的这篇博文：[《招聘一个靠谱的 iOS》](http://blog.sunnyxx.com/2015/07/04/ios-interview/)，其中共55题，除第一题为纠错题外，其他54道均为简答题。

出题者简介： 孙源（sunnyxx），目前就职于百度，负责百度知道 iOS 客户端的开发工作，对技术喜欢刨根问底和总结最佳实践，热爱分享和开源，维护一个叫 forkingdog 的开源小组。

答案为[微博@iOS程序犭袁](http://weibo.com/luohanchenyilong/)整理，未经出题者校对，如有纰漏，请向[微博@iOS程序犭袁](http://weibo.com/luohanchenyilong/)指正。

----------

# 索引


 1. [ 25. `_objc_msgForward` 函数是做什么的，直接调用它将会发生什么？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#25-_objc_msgforward函数是做什么的直接调用它将会发生什么)
 2. [26. runtime如何实现weak变量的自动置nil？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#26-runtime如何实现weak变量的自动置nil)
 3.  [27. 能否向编译后得到的类中增加实例变量？能否向运行时创建的类中添加实例变量？为什么？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#27-能否向编译后得到的类中增加实例变量能否向运行时创建的类中添加实例变量为什么) 
 4.  [28. runloop和线程有什么关系？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#28-runloop和线程有什么关系) 
 5.  [29. runloop的mode作用是什么？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#29-runloop的mode作用是什么) 
 6.  [30. 以+ scheduledTimerWithTimeInterval...的方式触发的timer，在滑动页面上的列表时，timer会暂定回调，为什么？如何解决？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#30-以-scheduledtimerwithtimeinterval的方式触发的timer在滑动页面上的列表时timer会暂定回调为什么如何解决) 
 7.  [31. 猜想runloop内部是如何实现的？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#31-猜想runloop内部是如何实现的) 
 8.  [32. objc使用什么机制管理对象内存？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#32-objc使用什么机制管理对象内存) 
 9.  [33. ARC通过什么方式帮助开发者管理内存？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#33-arc通过什么方式帮助开发者管理内存) 
 10.  [34. 不手动指定autoreleasepool的前提下，一个autorealese对象在什么时刻释放？（比如在一个vc的viewDidLoad中创建）](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#34-不手动指定autoreleasepool的前提下一个autorealese对象在什么时刻释放比如在一个vc的viewdidload中创建) 
 11.  [35. BAD_ACCESS在什么情况下出现？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#35-bad_access在什么情况下出现) 
 12.  [36. 苹果是如何实现autoreleasepool的？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#36-苹果是如何实现autoreleasepool的) 
 13.  [37. 使用block时什么情况会发生引用循环，如何解决？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#37-使用block时什么情况会发生引用循环如何解决)
 14.  [38. 在block内如何修改block外部变量？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#38-在block内如何修改block外部变量) 
 15.  [39. 使用系统的某些block api（如UIView的block版本写动画时），是否也考虑引用循环问题？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#39-使用系统的某些block-api如uiview的block版本写动画时是否也考虑引用循环问题) 
 16.  [40. GCD的队列（dispatch_queue_t）分哪两种类型？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#40-gcd的队列dispatch_queue_t分哪两种类型) 
 17.   [41. 如何用GCD同步若干个异步调用？（如根据若干个url异步加载多张图片，然后在都下载完成后合成一张整图）](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#41-如何用gcd同步若干个异步调用如根据若干个url异步加载多张图片然后在都下载完成后合成一张整图) 
 18.  [42. dispatch_barrier_async的作用是什么？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#42-dispatch_barrier_async的作用是什么) 
 19.  [43. 苹果为什么要废弃dispatch_get_current_queue？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#43-苹果为什么要废弃dispatch_get_current_queue) 
 0.  [44. 以下代码运行结果如何？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#44-以下代码运行结果如何) 

 ```Objective-C
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}
 ```

 1.  [45. addObserver:forKeyPath:options:context:各个参数的作用分别是什么，observer中需要实现哪个方法才能获得KVO回调？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#45-addobserverforkeypathoptionscontext各个参数的作用分别是什么observer中需要实现哪个方法才能获得kvo回调) 
 2.  [46. 如何手动触发一个value的KVO](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#46-如何手动触发一个value的kvo) 
 3.  [47. 若一个类有实例变量 NSString *_foo ，调用setValue:forKey:时，可以以foo还是 _foo 作为key？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#47-若一个类有实例变量-nsstring-_foo-调用setvalueforkey时可以以foo还是-_foo-作为key) 
 4.  [48. KVC的keyPath中的集合运算符如何使用？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#48-kvc的keypath中的集合运算符如何使用) 
 5.  [49. KVC和KVO的keyPath一定是属性么？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#49-kvc和kvo的keypath一定是属性么) 
 6.  [50. 如何关闭默认的KVO的默认实现，并进入自定义的KVO实现？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#50-如何关闭默认的kvo的默认实现并进入自定义的kvo实现) 
 7.  [51. apple用什么方式实现对一个对象的KVO？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#51-apple用什么方式实现对一个对象的kvo) 
 8.  [52. IBOutlet连出来的视图属性为什么可以被设置成weak?](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#52-iboutlet连出来的视图属性为什么可以被设置成weak) 
 9.  [53. IB中User Defined Runtime Attributes如何使用？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#53-ib中user-defined-runtime-attributes如何使用) 
 0.  [54. 如何调试BAD_ACCESS错误](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#54-如何调试bad_access错误) 
 1.  [55. lldb（gdb）常用的调试命令？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#55-lldbgdb常用的调试命令) 










----------


### 25. `_objc_msgForward`函数是做什么的，直接调用它将会发生什么？

> `_objc_msgForward`是 IMP 类型，用于消息转发的：当向一个对象发送一条消息，但它并没有实现的时候，`_objc_msgForward`会尝试做消息转发。

我们可以这样创建一个`_objc_msgForward`对象：

    IMP msgForwardIMP = _objc_msgForward;



在[上篇](https://github.com/ChenYilong/iOSInterviewQuestions)中的《objc中向一个对象发送消息`[obj foo]`和`objc_msgSend()`函数之间有什么关系？》曾提到`objc_msgSend`在“消息传递”中的作用。在“消息传递”过程中，`objc_msgSend`的动作比较清晰：首先在 Class 中的缓存查找 IMP （没缓存则初始化缓存），如果没找到，则向父类的 Class 查找。如果一直查找到根类仍旧没有实现，则用`_objc_msgForward`函数指针代替 IMP 。最后，执行这个 IMP 。



Objective-C运行时是开源的，所以我们可以看到它的实现。打开[ ***Apple Open Source 里Mac代码里的obj包*** ](http://www.opensource.apple.com/tarballs/objc4/)下载一个最新版本，找到 `objc-runtime-new.mm`，进入之后搜索`_objc_msgForward`。

![https://github.com/ChenYilong](http://i.imgur.com/rGBfaoL.png)

里面有对`_objc_msgForward`的功能解释：

![https://github.com/ChenYilong](http://i.imgur.com/vcThcdA.png)


```Objective-C
/***********************************************************************
* lookUpImpOrForward.
* The standard IMP lookup. 
* initialize==NO tries to avoid +initialize (but sometimes fails)
* cache==NO skips optimistic unlocked lookup (but uses cache elsewhere)
* Most callers should use initialize==YES and cache==YES.
* inst is an instance of cls or a subclass thereof, or nil if none is known. 
*   If cls is an un-initialized metaclass then a non-nil inst is faster.
* May return _objc_msgForward_impcache. IMPs destined for external use 
*   must be converted to _objc_msgForward or _objc_msgForward_stret.
*   If you don't want forwarding at all, use lookUpImpOrNil() instead.
**********************************************************************/
```

对 `objc-runtime-new.mm`文件里与`_objc_msgForward`有关的三个函数使用伪代码展示下：

```Objective-C
//  objc-runtime-new.mm 文件里与 _objc_msgForward 有关的三个函数使用伪代码展示
//  Created by https://github.com/ChenYilong
//  Copyright (c)  微博@iOS程序犭袁(http://weibo.com/luohanchenyilong/). All rights reserved.
//  同时，这也是 obj_msgSend 的实现过程

id objc_msgSend(id self, SEL op, ...) {
    if (!self) return nil;
	IMP imp = class_getMethodImplementation(self->isa, SEL op);
	imp(self, op, ...); //调用这个函数，伪代码...
}
 
//查找IMP
IMP class_getMethodImplementation(Class cls, SEL sel) {
    if (!cls || !sel) return nil;
    IMP imp = lookUpImpOrNil(cls, sel);
    if (!imp) return _objc_msgForward; //_objc_msgForward 用于消息转发
    return imp;
}
 
IMP lookUpImpOrNil(Class cls, SEL sel) {
    if (!cls->initialize()) {
        _class_initialize(cls);
    }
 
    Class curClass = cls;
    IMP imp = nil;
    do { //先查缓存,缓存没有时重建,仍旧没有则向父类查询
        if (!curClass) break;
        if (!curClass->cache) fill_cache(cls, curClass);
        imp = cache_getImp(curClass, sel);
        if (imp) break;
    } while (curClass = curClass->superclass);
 
    return imp;
}
```
虽然Apple没有公开`_objc_msgForward`的实现源码，但是我们还是能得出结论：

> `_objc_msgForward`是一个函数指针（和 IMP 的类型一样），是用于消息转发的：当向一个对象发送一条消息，但它并没有实现的时候，`_objc_msgForward`会尝试做消息转发。


> 在[上篇](https://github.com/ChenYilong/iOSInterviewQuestions)中的《objc中向一个对象发送消息`[obj foo]`和`objc_msgSend()`函数之间有什么关系？》曾提到`objc_msgSend`在“消息传递”中的作用。在“消息传递”过程中，`objc_msgSend`的动作比较清晰：首先在 Class 中的缓存查找 IMP （没缓存则初始化缓存），如果没找到，则向父类的 Class 查找。如果一直查找到根类仍旧没有实现，则用`_objc_msgForward`函数指针代替 IMP 。最后，执行这个 IMP 。



为了展示消息转发的具体动作，这里尝试向一个对象发送一条错误的消息，并查看一下`_objc_msgForward`是如何进行转发的。

首先开启调试模式、打印出所有运行时发送的消息：
可以在代码里执行下面的方法：

```Objective-C
(void)instrumentObjcMessageSends(YES);
```
因为该函数处于 objc-internal.h 内，而该文件并不开放，所以调用的时候先声明，目的是告诉编译器程序目标文件包含该方法存在，让编译通过
```
OBJC_EXPORT void
instrumentObjcMessageSends(BOOL flag)
OBJC_AVAILABLE(10.0, 2.0, 9.0, 1.0, 2.0);
```

或者断点暂停程序运行，并在 gdb 中输入下面的命令：

```Objective-C
call (void)instrumentObjcMessageSends(YES)
```

以第二种为例，操作如下所示：

![https://github.com/ChenYilong](http://i.imgur.com/uEwTCC4.png)


之后，运行时发送的所有消息都会打印到`/tmp/msgSend-xxxx`文件里了。

终端中输入命令前往：

```Objective-C
open /private/tmp
```





![https://github.com/ChenYilong](http://i.imgur.com/Fh5hhCw.png)



可能看到有多条，找到最新生成的，双击打开



在模拟器上执行执行以下语句（这一套调试方案仅适用于模拟器，真机不可用，关于该调试方案的拓展链接：[ ***Can the messages sent to an object in Objective-C be monitored or printed out?*** ](http://stackoverflow.com/a/10750398/3395008)），向一个对象发送一条错误的消息：




```Objective-C
//
//  main.m
//  CYLObjcMsgForwardTest
//
//  Created by http://weibo.com/luohanchenyilong/.
//  Copyright (c) 2015年 微博@iOS程序犭袁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CYLTest.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        CYLTest *test = [[CYLTest alloc] init];
        [test performSelector:(@selector(iOS程序犭袁))];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

```

![https://github.com/ChenYilong](http://i.imgur.com/UjbmVvB.png)


你可以在`/tmp/msgSend-xxxx`（我这一次是`/tmp/msgSend-9805`）文件里，看到打印出来：



![https://github.com/ChenYilong](http://i.imgur.com/AAERz1T.png)


 
```Objective-C
+ CYLTest NSObject initialize
+ CYLTest NSObject alloc
- CYLTest NSObject init
- CYLTest NSObject performSelector:
+ CYLTest NSObject resolveInstanceMethod:
+ CYLTest NSObject resolveInstanceMethod:
- CYLTest NSObject forwardingTargetForSelector:
- CYLTest NSObject forwardingTargetForSelector:
- CYLTest NSObject methodSignatureForSelector:
- CYLTest NSObject methodSignatureForSelector:
- CYLTest NSObject class
- CYLTest NSObject doesNotRecognizeSelector:
- CYLTest NSObject doesNotRecognizeSelector:
- CYLTest NSObject class
```



结合[《NSObject官方文档》](https://developer.apple.com/library/prerelease/watchos/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/#//apple_ref/doc/uid/20000050-SW11)，排除掉 NSObject 做的事，剩下的就是`_objc_msgForward`消息转发做的几件事：


 1. 调用`resolveInstanceMethod:`方法 (或 `resolveClassMethod:`)。允许用户在此时为该 Class 动态添加实现。如果有实现了，则调用并返回YES，那么重新开始`objc_msgSend`流程。这一次对象会响应这个选择器，一般是因为它已经调用过`class_addMethod`。如果仍没实现，继续下面的动作。

 2. 调用`forwardingTargetForSelector:`方法，尝试找到一个能响应该消息的对象。如果获取到，则直接把消息转发给它，返回非 nil 对象。否则返回 nil ，继续下面的动作。注意，这里不要返回 self ，否则会形成死循环。(讨论见： [《forwardingTargetForSelector返回self不会死循环吧。 #64》](https://github.com/ChenYilong/iOSInterviewQuestions/issues/64) 

 3. 调用`methodSignatureForSelector:`方法，尝试获得一个方法签名。如果获取不到，则直接调用`doesNotRecognizeSelector`抛出异常。如果能获取，则返回非nil：创建一个 NSInvocation 并传给`forwardInvocation:`。

 4. 调用`forwardInvocation:`方法，将第3步获取到的方法签名包装成 Invocation 传入，如何处理就在这里面了。(讨论见： [《_objc_msgForward问题 #106》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/106 ) 
 5. 调用`doesNotRecognizeSelector:` ，默认的实现是抛出异常。如果第3步没能获得一个方法签名，执行该步骤。

上面前4个方法均是模板方法，开发者可以重写(override)，由 runtime 来调用。最常见的实现消息转发：就是重写方法3和4，吞掉一个消息或者代理给其他对象都是没问题的

也就是说`_objc_msgForward`在进行消息转发的过程中会涉及以下这几个方法：

 1. `resolveInstanceMethod:`方法 (或 `resolveClassMethod:`)。

 2. `forwardingTargetForSelector:`方法

 3. `methodSignatureForSelector:`方法

 4. `forwardInvocation:`方法

 5. `doesNotRecognizeSelector:` 方法

为了能更清晰地理解这些方法的作用，git仓库里也给出了一个Demo，名称叫“ `_objc_msgForward_demo` ”,可运行起来看看。


下面回答下第二个问题“直接`_objc_msgForward`调用它将会发生什么？”

直接调用`_objc_msgForward`是非常危险的事，如果用不好会直接导致程序Crash，但是如果用得好，能做很多非常酷的事。

就好像跑酷，干得好，叫“耍酷”，干不好就叫“作死”。

正如前文所说：

> `_objc_msgForward`是 IMP 类型，用于消息转发的：当向一个对象发送一条消息，但它并没有实现的时候，`_objc_msgForward`会尝试做消息转发。

如何调用`_objc_msgForward`？
`_objc_msgForward`隶属 C 语言，有三个参数 ：

|--| `_objc_msgForward`参数| 类型 |
-------------|-------------|-------------
 1 | 所属对象 | id类型
 2 |方法名 | SEL类型 
 3 |可变参数 |可变参数类型


首先了解下如何调用 IMP 类型的方法，IMP类型是如下格式：

为了直观，我们可以通过如下方式定义一个 IMP类型 ：

```Objective-C
typedef void (*voidIMP)(id, SEL, ...)
```
一旦调用`_objc_msgForward`，将跳过查找 IMP 的过程，直接触发“消息转发”，

如果调用了`_objc_msgForward`，即使这个对象确实已经实现了这个方法，你也会告诉`objc_msgSend`：


> “我没有在这个对象里找到这个方法的实现”



想象下`objc_msgSend`会怎么做？通常情况下，下面这张图就是你正常走`objc_msgSend`过程，和直接调用`_objc_msgForward`的前后差别：

![https://github.com/ChenYilong](http://ww1.sinaimg.cn/bmiddle/6628711bgw1eecx3jef23g206404tkbi.gif)

有哪些场景需要直接调用`_objc_msgForward`？最常见的场景是：你想获取某方法所对应的`NSInvocation`对象。举例说明：

[JSPatch （Github 链接）](https://github.com/bang590/JSPatch)就是直接调用`_objc_msgForward`来实现其核心功能的：

>  JSPatch 以小巧的体积做到了让JS调用/替换任意OC方法，让iOS APP具备热更新的能力。


作者的博文[《JSPatch实现原理详解》](http://blog.cnbang.net/tech/2808/)详细记录了实现原理，有兴趣可以看下。

同时 [ ***RAC(ReactiveCocoa)*** ](https://github.com/ReactiveCocoa/ReactiveCocoa) 源码中也用到了该方法。

### 26. runtime如何实现weak变量的自动置nil？


> runtime 对注册的类， 会进行布局，对于 weak 对象会放入一个 hash 表中。 用 weak 指向的对象内存地址作为 key，当此对象的引用计数为0的时候会 dealloc，假如 weak 指向的对象内存地址是a，那么就会以a为键， 在这个 weak 表中搜索，找到所有以a为键的 weak 对象，从而设置为 nil。

在[上篇](https://github.com/ChenYilong/iOSInterviewQuestions)中的《runtime 如何实现 weak 属性》有论述。（注：在[上篇](https://github.com/ChenYilong/iOSInterviewQuestions)的《使用runtime Associate方法关联的对象，需要在主对象dealloc的时候释放么？》里给出的“对象的内存销毁时间表”也提到`__weak`引用的解除时间。）

我们可以设计一个函数（伪代码）来表示上述机制：

`objc_storeWeak(&a, b)`函数：

`objc_storeWeak`函数把第二个参数--赋值对象（b）的内存地址作为键值key，将第一个参数--weak修饰的属性变量（a）的内存地址（&a）作为value，注册到 weak 表中。如果第二个参数（b）为0（nil），那么把变量（a）的内存地址（&a）从weak表中删除，

你可以把`objc_storeWeak(&a, b)`理解为：`objc_storeWeak(value, key)`，并且当key变nil，将value置nil。

在b非nil时，a和b指向同一个内存地址，在b变nil时，a变nil。此时向a发送消息不会崩溃：在Objective-C中向nil发送消息是安全的。

而如果a是由assign修饰的，则：
在b非nil时，a和b指向同一个内存地址，在b变nil时，a还是指向该内存地址，变野指针。此时向a发送消息会产生崩溃。

参考讨论区 ： [《有一点说的很容易误导人 #6》](https://github.com/ChenYilong/iOSInterviewQuestions/issues/6) 


下面我们将基于`objc_storeWeak(&a, b)`函数，使用伪代码模拟“runtime如何实现weak属性”：
 


 
```Objective-C
// 使用伪代码模拟：runtime如何实现weak属性
// http://weibo.com/luohanchenyilong/
// https://github.com/ChenYilong

 id obj1;
 objc_initWeak(&obj1, obj);
/*obj引用计数变为0，变量作用域结束*/
 objc_destroyWeak(&obj1);
```

下面对用到的两个方法`objc_initWeak`和`objc_destroyWeak`做下解释：

总体说来，作用是：
通过`objc_initWeak`函数初始化“附有weak修饰符的变量（obj1）”，在变量作用域结束时通过`objc_destoryWeak`函数释放该变量（obj1）。

下面分别介绍下方法的内部实现：

`objc_initWeak`函数的实现是这样的：在将“附有weak修饰符的变量（obj1）”初始化为0（nil）后，会将“赋值对象”（obj）作为参数，调用`objc_storeWeak`函数。



 
```Objective-C
obj1 = 0；
obj_storeWeak(&obj1, obj);
```

也就是说：

>  weak 修饰的指针默认值是 nil （在Objective-C中向nil发送消息是安全的）




然后`obj_destroyWeak`函数将0（nil）作为参数，调用`objc_storeWeak`函数。

`objc_storeWeak(&obj1, 0);`

前面的源代码与下列源代码相同。



```Objective-C
// 使用伪代码模拟：runtime如何实现weak属性
// http://weibo.com/luohanchenyilong/
// https://github.com/ChenYilong

id obj1;
obj1 = 0;
objc_storeWeak(&obj1, obj);
/* ... obj的引用计数变为0，被置nil ... */
objc_storeWeak(&obj1, 0);
```


`objc_storeWeak`函数把第二个参数--赋值对象（obj）的内存地址作为键值，将第一个参数--weak修饰的属性变量（obj1）的内存地址注册到 weak 表中。如果第二个参数（obj）为0（nil），那么把变量（obj1）的地址从weak表中删除。





### 27. 能否向编译后得到的类中增加实例变量？能否向运行时创建的类中添加实例变量？为什么？ 

 - 不能向编译后得到的类中增加实例变量；
 - 能向运行时创建的类中添加实例变量；

解释下：

 - 因为编译后的类已经注册在 runtime 中，类结构体中的 `objc_ivar_list` 实例变量的链表 和 `instance_size` 实例变量的内存大小已经确定，同时runtime 会调用 `class_setIvarLayout` 或 `class_setWeakIvarLayout` 来处理 strong weak 引用。所以不能向存在的类中添加实例变量；

 - 运行时创建的类是可以添加实例变量，调用 `class_addIvar` 函数。但是得在调用 `objc_allocateClassPair` 之后，`objc_registerClassPair` 之前，原因同上。


### 28. runloop和线程有什么关系？

总的说来，Run loop，正如其名，loop表示某种循环，和run放在一起就表示一直在运行着的循环。实际上，run loop和线程是紧密相连的，可以这样说run loop是为了线程而生，没有线程，它就没有存在的必要。Run loops是线程的基础架构部分， Cocoa 和 CoreFundation 都提供了 run loop 对象方便配置和管理线程的 run loop （以下都以 Cocoa 为例）。每个线程，包括程序的主线程（ main thread ）都有与之相应的 run loop 对象。

 runloop 和线程的关系：




 1. 主线程的run loop默认是启动的。

 iOS的应用程序里面，程序启动后会有一个如下的main()函数
 
 ```Objective-C
int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
```





 重点是UIApplicationMain()函数，这个方法会为main thread设置一个NSRunLoop对象，这就解释了：为什么我们的应用可以在无人操作的时候休息，需要让它干活的时候又能立马响应。

 2. 对其它线程来说，run loop默认是没有启动的，如果你需要更多的线程交互则可以手动配置和启动，如果线程只是去执行一个长时间的已确定的任务则不需要。

 3. 在任何一个 Cocoa 程序的线程中，都可以通过以下代码来获取到当前线程的 run loop 。


 ```Objective-C
NSRunLoop *runloop = [NSRunLoop currentRunLoop];
```


参考链接：[《Objective-C之run loop详解》](http://blog.csdn.net/wzzvictory/article/details/9237973)。

### 29. runloop的mode作用是什么？

model 主要是用来指定事件在运行循环中的优先级的，分为：


* NSDefaultRunLoopMode（kCFRunLoopDefaultMode）：默认，空闲状态
* UITrackingRunLoopMode：ScrollView滑动时
* UIInitializationRunLoopMode：启动时
* NSRunLoopCommonModes（kCFRunLoopCommonModes）：Mode集合

苹果公开提供的 Mode 有两个：

 1. NSDefaultRunLoopMode（kCFRunLoopDefaultMode）
 2. NSRunLoopCommonModes（kCFRunLoopCommonModes）

讨论区： [《https://github.com/ChenYilong/iOSInterviewQuestions/issues/36》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/36 ) 

### 30. 以+ scheduledTimerWithTimeInterval...的方式触发的timer，在滑动页面上的列表时，timer会暂定回调，为什么？如何解决？

RunLoop只能运行在一种mode下，如果要换mode，当前的loop也需要停下重启成新的。利用这个机制，ScrollView滚动过程中NSDefaultRunLoopMode（kCFRunLoopDefaultMode）的mode会切换到UITrackingRunLoopMode来保证ScrollView的流畅滑动：只能在NSDefaultRunLoopMode模式下处理的事件会影响ScrollView的滑动。

如果我们把一个NSTimer对象以NSDefaultRunLoopMode（kCFRunLoopDefaultMode）添加到主运行循环中的时候,
ScrollView滚动过程中会因为mode的切换，而导致NSTimer将不再被调度。

同时因为mode还是可定制的，所以：

 Timer计时会被scrollView的滑动影响的问题可以通过将timer添加到NSRunLoopCommonModes（kCFRunLoopCommonModes）来解决。代码如下：

```objective-c
// 
// http://weibo.com/luohanchenyilong/ (微博@iOS程序犭袁)
// https://github.com/ChenYilong

//将timer添加到NSDefaultRunLoopMode中
[NSTimer scheduledTimerWithTimeInterval:1.0
     target:self
     selector:@selector(timerTick:)
     userInfo:nil
     repeats:YES];
//然后再添加到NSRunLoopCommonModes里
NSTimer *timer = [NSTimer timerWithTimeInterval:1.0
     target:self
     selector:@selector(timerTick:)
     userInfo:nil
     repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
```

如果对本回答有疑问，欢迎参与讨论：  [《第30题，使用dispatch source替换NSTimer #45》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/45 ) 

### 31. 猜想runloop内部是如何实现的？

> 一般来讲，一个线程一次只能执行一个任务，执行完成后线程就会退出。如果我们需要一个机制，让线程能随时处理事件但并不退出，通常的代码逻辑
是这样的：




	function loop() {
	    initialize();
	    do {
	        var message = get_next_message();
	        process_message(message);
	    } while (message != quit);
	}


或使用伪代码来展示下:

	// 
	// http://weibo.com/luohanchenyilong/ (微博@iOS程序犭袁)
	// https://github.com/ChenYilong
	int main(int argc, char * argv[]) {
     //程序一直运行状态
     while (AppIsRunning) {
          //睡眠状态，等待唤醒事件
          id whoWakesMe = SleepForWakingUp();
          //得到唤醒事件
          id event = GetEvent(whoWakesMe);
          //开始处理事件
          HandleEvent(event);
     }
     return 0;
	}

参考链接：

 1. [《深入理解RunLoop》](http://blog.ibireme.com/2015/05/18/runloop/#base)
 2. 摘自博文[***CFRunLoop***](https://github.com/ming1016/study/wiki/CFRunLoop)，原作者是[微博@我就叫Sunny怎么了](http://weibo.com/u/1364395395)

### 32. objc使用什么机制管理对象内存？

- 通过 `retainCount` 的机制来决定对象是否需要释放。
- ~~每次 `runloop` 的时候，都会检查对象的 `retainCount`，如果 `retainCount` 为 0，说明该对象没有地方需要继续使用了，可以释放掉了。(正解：retainCount 不可能依赖 runloop 检查。runloop 只是自动管理了一个 autoreleasepool，autoreleasepool pop 时可能会导致 retainCount 为 0 从而导致对象释放)~~
- 每次 release 时检查 retainCount 减一，当为0时候释放对象。

release 对象的各种情况如下：

一、对象成员变量

这个对象 dealloc 时候，成员变量 `objc_storeStrong(&ivar,nil)` release

二、局部变量变量的释放
分情况：

1、strong obj变量，出了作用域`{}`，就  `objc_storeStrong(obj,nil)` release 对象；

 ```C
void
objc_storeStrong(id *location, id obj)
{

id prev = *location;
if (obj == prev) {
    return;
}
objc_retain(obj);
*location = obj;
objc_release(prev);
}
 ```


2、weak obj变量，出了作用域，objc_destroyWeak 将变量（obj）的地址从weak表中删除。；

3、autorelease obj变量，交给 autoreleasePool对象管理，
（1）主动使用 `@autoreleasepool{}`，出了 `{}` 对象release
（2）不使用 `@autoreleasepool{}`，交给线程管理

①线程开启`runloop`，在每次 `kCFRunLoopBeforeWaiting` 休眠时候，执行`PoolPop`（release对象）再PoolPush，
②线程没有开启`runloop`，在线程结束时候执行 `PoolPop`（release对象）

详细讨论见： [《32. objc使用什么机制管理对象内存？ #92》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/92 ) 

### 33. ARC通过什么方式帮助开发者管理内存？
 <p><del>编译时根据代码上下文，插入 retain/release
</del></p>
ARC相对于MRC，不是在编译时添加retain/release/autorelease这么简单。应该是编译期和运行期两部分共同帮助开发者管理内存。

在编译期，ARC用的是更底层的C接口实现的retain/release/autorelease，这样做性能更好，也是为什么不能在ARC环境下手动retain/release/autorelease，同时对同一上下文的同一对象的成对retain/release操作进行优化（即忽略掉不必要的操作）；ARC也包含运行期组件，这个地方做的优化比较复杂，但也不能被忽略。【TODO:后续更新会详细描述下】

讨论区：
 [《第33题，答案可能不是很准确 #15》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/15 ) 
 
###  34. 不手动指定autoreleasepool的前提下，一个autorealese对象在什么时刻释放？（比如在一个vc的viewDidLoad中创建）


分两种情况：手动干预释放时机、系统自动去释放。


 1. 手动干预释放时机--指定  `autoreleasepool`
 就是所谓的：当前作用域大括号结束时释放。
 2. 系统自动去释放--不手动指定 `autoreleasepool`

`__autoreleasing` 修饰的 `autorelease` 对象，是在创建好之后调用`objc_autorelease` 会被添加到最近一次创建的自动释放池中，并且autorelease对象什么时候调用release，是由RunLoop来控制的：会在当前的 runloop 休眠之前，执行pop函数、调用 release 时释放。

释放的时机总结起来，可以用下图来表示：


<p align="center"><a href="https://mp.weixin.qq.com/s/A4e5h3xgIEh6PInf1Rjqsw"><img src="http://ww3.sinaimg.cn/large/006y8mN6gy1g71mm4cx74j30kr0gngnw.jpg"></a></p>


下面对这张图进行详细的解释：


从程序启动到加载完成是一个完整的运行循环，然后会停下来，等待用户交互，用户的每一次交互都会启动一次运行循环，来处理用户所有的点击事件、触摸事件。

我们都知道：

`__autoreleasing` 修饰的 `autorelease` 对象，是在创建好之后调用`objc_autorelease`加入到释放池。

但是如果每次都放进应用程序的 `main.m` 中的 autoreleasepool 中，迟早有被撑满的一刻。这个过程中必定有一个释放的动作。何时？

在一次完整的 RunLoop 休眠之前，会被销毁。

那什么时间会创建自动释放池？ RunLoop 检测到事件并启动后，就会创建自动释放池。 

~~“子线程的 runloop 默认是不工作，无法主动创建，必须手动创建。”（表述不准确， 见 issue#82 #https://github.com/ChenYilong/iOSInterviewQuestions/issues/82）~~

从 `RunLoop` 源代码中可知，子线程默认是没有 `RunLoop` 的，如果需要在子线程开启 `RunLoop` ，则需要调用 `[NSRunLoop CurrentRunLoop]` 方法，它内部实现是先检查线程，如果发现是子线程，以懒加载的形式 创建一个子线程的 `RunLoop`。并存储在一个全局的 可变字典里。开发者在调用 `[NSRunLoop CurrentRunLoop]` 时，是系统自动创建 `RunLoop` 的，而没法手动创建。

自定义的 NSOperation 和 NSThread 需要手动创建自动释放池。比如： 自定义的 NSOperation 类中的 main 方法里就必须添加自动释放池。否则出了作用域后，自动释放对象会因为没有自动释放池去处理它，而造成内存泄露。

但对于 blockOperation 和 invocationOperation 这种默认的 Operation ，系统已经帮我们封装好了，不需要手动创建自动释放池。

@autoreleasepool 当自动释放池被销毁或者耗尽时，会向自动释放池中的所有对象发送 release 消息，释放自动释放池中的所有对象。

举一个例子: 如果在一个vc的viewDidLoad中创建一个 Autorelease对象，那么该对象会在 viewDidAppear 方法执行前就被销毁了。

注意: 本次论述, 并不适用于 TaggedPointer 类型.

参考链接：[《黑幕背后的Autorelease》](http://blog.sunnyxx.com/2014/10/15/behind-autorelease/)

拓展问题：

下面的对象 ，分别在什么地方被释放 ?

 ```Objective-C
/**
 * 下面的对象 ，分别在什么地方被释放 ?
 */
- (void)weakLifeCycleTest {
    id obj0 = @"iTeaTime(技术清谈)";
    __weak id obj1 = obj0;
    id obj2 = [NSObject new];
    __weak id obj3 = [NSObject new];
    {
        id obj4 = [NSObject new];
    }
    __autoreleasing id obj5 = [NSObject new];
    __unsafe_unretained id obj6 = self;
    NSLog(@"obj0=%@, obj1=%@, obj2=%@, obj3=%@, obj5=%@, obj6=%@", obj0, obj1, obj2, obj3, obj5, obj6);
    // Lots of code ...
}
 ```

- obj0 字符串属于常量区，不会释放 (类似的例子可以参考 [《第34题，autorelease对象的释放时机，对iOS9、10系统不适用 #90》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/90 ) )
- obj1 指向的对象在常量区，不会释放 (类似的例子可以参考 [《第34题，autorelease对象的释放时机，对iOS9、10系统不适用 #90》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/90 ) )
- obj2 没有修复符，默认为 `__strong` ，会在对象被使用结束时释放。如果下方没有使用该对象，根据编译器是否优化，可能在下一行直接销毁，最晚可以在方法结束时销毁。
- obj3 警告 “Assigning retained object to weak variable; object will be released after assignment” ，new 结束后，等号右侧对象立马被释放，左侧指针也立即销毁，下方打印也是 null
- obj4 出了最近的括号销毁
- obj5 出了最近的一个 autoreleasePool 时被释放
- obj6 类似于基本数据结构的修饰符号 assign ，不会对修饰对象的生命周期产生影响，随着self的释放，obj6也会随之释放。比如 self 被其它线程释放，那么obj6也会随之释放。

讨论区：

- [《关于第 34 题关于 NSOperation 中需要手动添加 Autorelease Pool 的部分的疑问 #25》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/25 ) 
- [《34题-36题-题目中很多对AutoreleasePool的理解都是有问题的 #112》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/112 ) 


###  35. BAD_ACCESS在什么情况下出现？
访问了悬垂指针，比如对一个已经释放的对象执行了release、访问已经释放对象的成员变量或者发消息。
死循环
###  36. 苹果是如何实现autoreleasepool的？ 

AutoreleasePool 是以 AutoreleasePoolPage 为结点的双向链表来实现的，主要通过下列三个函数完成：

 1. `objc_autoreleasepoolPush`
 2. `objc_autoreleasepoolPop`
 3. `objc_autorelease`

看函数名就可以知道，对 autorelease 分别执行 push，和 pop 操作。销毁对象时执行release操作。

举例说明：我们都知道用类方法创建的对象都是 Autorelease 的，那么一旦 Person 出了作用域，当在 Person 的 dealloc 方法中打上断点，我们就可以看到这样的调用堆栈信息：

 
 <p align="center"><a href="https://mp.weixin.qq.com/s/A4e5h3xgIEh6PInf1Rjqsw"><img src="http://ww1.sinaimg.cn/large/006y8mN6gy1g71molq31cj30ad0iojse.jpg"></a></p>

讨论区：

- [《34题-36题-题目中很多对AutoreleasePool的理解都是有问题的 #112》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/112 ) 


### 37. 使用block时什么情况会发生引用循环，如何解决？
一个对象中强引用了 block，在 block 中又强引用了该对象，就会发生循环引用。

ARC 下的解决方法是：



 1、 将该对象使用 `__weak` 修饰符修饰之后再在 block 中使用。 `id weak weakSelf = self;`
	或者 `weak __typeof(&*self)weakSelf = self` 该方法可以设置宏
	  `__weak` ：不会产生强引用，指向的对象销毁时，会自动让指针置为 ni1
	  
 2、 使用 `unsafe_unretained` 关键字，用法与 `__weak` 一致。
 `unsafe_unretained` 不会产生强引用，不安全，指向的对象销毁时，指针存储的地址值不变。

几个方案的原理如下图所示：

![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gfj2600xzsj30pw0iadj5.jpg)

检测代码中是否存在循环引用问题，可参考下文中 39 题中提到的工具。

注意：

还有第三种方式：

3、也可以使用 `__block` 来解决循环引用问题，用法为： `__block id weakSelf = self;`，但不推荐使用。因为必须要调用该 block 方案才能生效，因为需要及时的将 `__block` 变量置为 nii。

![](https://tva1.sinaimg.cn/large/007S8ZIlly1gfj1sa1veaj30si1akgud.jpg)
 
```Objective-C
__block id weakSelf = self;
self.block = ^{
    NSLog(@"%@", @[weakSelf]);
    weakSelf = nil;
};
self.block();
```

MRC下可使用 `unsafe_unretained` 和 `__block` 进行解决，`__weak` 不能在 MRC 中使用。在 MRC 下 `__block` 的用法简单化了，可以照搬 `__weak` 的使用方法，两者用法一致。

用  `unsafe_unretained`  解决：

```Objective-C
unsafe_unretained id weakSelf = self;
self.block = ^{
    NSLog(@"%@", @[weakSelf]);

};
```

用 `__block`  解决：

```Objective-C
__block id weakSelf = self;
self.block = ^{
    NSLog(@"%@", @[weakself]);

};
```

其中最佳实践为 weak-strong dance 解法：

```Objective-C
__weak __typeof(self) weakSelf = self;
self.block = ^{
    __strong typeof(self) strongSelf = weakSelf;
    if (!strongSelf) {
         return;
    }
    NSLog(@"%@", @[strongSelf]);
};
self.block();
```

- weakSelf 是保证 block 内部(作用域内)不会产生循环引用
- strongSelf 是保证 block 内部(作用域内) self 不会被 block释放
- `if (!strongSelf) { return;}` 该代码作用：因为 weak 指针指向的对象，是可能被随时释放的。为了防止 self 在 block 外部被释放，比如其它线程内被释放。



讨论区 ：

- 如果对MRC下的循环引用解决方案感兴趣，可参见讨论  [《issue#50 -- 37 题 block 循环引用问题》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/50 ) 
- [《建议增加一个问题：__block和__weak的区别 #7》](https://github.com/ChenYilong/iOSInterviewQuestions/issues/7) 

![](https://tva1.sinaimg.cn/large/007S8ZIlly1gfl2fg3anyj31jy0m3dlu.jpg)

在 [《iOS面试题集锦（附答案）》]( https://github.com/ChenYilong/iOSInterviewQuestions ) 中有这样一道题目： 
在block内如何修改block外部变量？（38题）答案如下：

### 38. 在block内如何修改block外部变量？


注：本题代码请在仓库中查看以 Demo38 开头的工程（公众号请点击原文查看 GitHub 仓库）
 
先描述下问题：

默认情况下，在block中访问的外部变量是复制过去的，即：**写操作不对原变量生效**。但是你可以加上 `__block` 来让其写操作生效，示例代码如下:


 ```Objective-C
	__block int a = 0;
	void (^foo)(void) = ^{ 
	    a = 1; 
	};
	foo(); 
	//这里，a的值被修改为1
 ```


这是网上常见的描述。你同样可以在面试中这样回答，但你并没有答到“点子上”。真正的原因，并没有这么“神奇”，而且这种说法也有点牵强。面试官肯定会追问“为什么写操作就生效了？” 实际上需要有几个必要条件：

 - "将 auto 从栈 copy 到堆"
 - “将 auto 变量封装为结构体(对象)”


我会将本问题分下面几个部分，分别作答：

 - 该问题研究的是哪种 `block` 类型?
 - 在 `block` 内为什么不能修改 `block` 外部变量
 - 最优解及原理解析
 - 其他几种解法
 - 改外部变量必要条件之"将 auto 从栈 copy 到堆"
 - 改外部变量必要条件之“将 auto 变量封装为结构体(对象)”
 

 该问题研究的是哪种 block 类型?
-------------

今天我们讨论是 `__NSMallocBlock__` (或者叫 `_NSConcreteMallocBlock`，两者是叫法不同，指的是同一个东西)。


Block 类型| 环境
:-------------:|:-------------:
`__NSGlobalBlock__` | 没有访问 auto 变量
`__NSStackBlock__` | 访问了 auto 变量
`__NSMallocBlock__` | `__NSStackBlock__` 调用了 copy

每一种类型的 block 调用 copy 后的结果如下所示


Block 的类 | 副本源的配置存储域| 复制效果
:-------------:|:-------------:|:-------------:
`_NSConcreteGlobalBlock`| 程序的数据区域 | 什么也不做
`_NSConcreteStackBlock` | 栈|  从栈复制到堆
`_NSConcreteMallocBlock`| 堆 | 引用计数增加


在 ARC 环境下，编译器会根据情况自动将栈上的 block 复制到堆上，比如以下情况：

- block 作为函数返回值时
- 将 block 赋值给 __strong 指针时
- block 作为 Cocoa API 中方法名含有 using Block 的方法参数时
- Block 作为 GCD APIE 的方法参数时


![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gfiwolczn7j30sa0xaq8k.jpg)

更多细节可以查看：


![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gfkx49l2xxj30u012bqfs.jpg)


![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gfl31akk5hj30zg0lojz9.jpg)

 在 `block` 内为什么不能修改 `block` 外部变量
-------------



为了保证 block 内部能够正常访问外部的变量，block 有一个变量捕获机制。


![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gfks99t8fej30u017uqf8.jpg)




首先分析一下为什么不能修改：


**Block不允许修改外部变量的值**。Apple这样设计，应该是考虑到了block的特殊性，block 本质上是一个对象，block 的花括号区域是对象内部的一个函数，变量进入 花括号，实际就是已经进入了另一个函数区域---改变了作用域。在几个作用域之间进行切换时，如果不加上这样的限制，变量的可维护性将大大降低。又比如我想在block内声明了一个与外部同名的变量，此时是允许呢还是不允许呢？只有加上了这样的限制，这样的情景才能实现。


所以 Apple 在编译器层面做了限制，如果在 block 内部试图修改 auto 变量（无修饰符），那么直接编译报错。
你可以把编译器的这种行为理解为：对 block 内部捕获到的 auto 变量设置为只读属性---不允许直接修改。

从代码层面进行证明：

写一段 block 代码：

 ```Objective-C
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
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        int age = 10;
        CYLBlock block = ^{
            NSLog(@"age is %@", @(age));
        };
        block();
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

 ```

使用如下命令来查看对应的 C++ 代码：


 ```shell
 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m
 ```

 代码如下所示：
 
![](https://tva1.sinaimg.cn/large/007S8ZIlly1gffg4w6nrmj30x10u04nr.jpg)



 ```Java

typedef void (*CYLBlock)(void);

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  int age;
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _age, int flags=0) : age(_age) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
  int age = __cself->age; // bound by copy

            NSLog((NSString *)&__NSConstantStringImpl__var_folders_2w_wgnctp1932z76770l8lrrrbm0000gn_T_main_0d7ffa_mi_0, ((NSNumber *(*)(Class, SEL, int))(void *)objc_msgSend)(objc_getClass("NSNumber"), sel_registerName("numberWithInt:"), (int)(age)));
        }

static struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool; 
        appDelegateClassName = NSStringFromClass(((Class (*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("AppDelegate"), sel_registerName("class")));
        int age = 10;
        CYLBlock block = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, age));
        ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
    }
    return UIApplicationMain(argc, argv, __null, appDelegateClassName);
}
static struct IMAGE_INFO { unsigned version; unsigned flag; } _OBJC_IMAGE_INFO = { 0, 2 };

 ```


最优解及原理解析
-------------

说最优解前，先来说一下

其他几种解法
-------------

  - 加 static (放在静态存储区/全局初始化区 ) 缺点是会永久存储，内存开销大。
  - 将变量设置为全局变量，缺点也是内存开销大。

将变量设置为全局变量

![将变量设置为全局变量](https://tva1.sinaimg.cn/large/007S8ZIlly1gfkzpoivkij31470u04qp.jpg)

原理是 block 内外可直接访问全局变量

![](https://tva1.sinaimg.cn/large/007S8ZIlly1gfkzqxd6vkj31460u07wh.jpg)

加 static (放在静态存储区/全局初始化区)

原理是 block 内部对外部auto变量进行指针捕获

![加 static (放在静态存储区/全局初始化区)](https://tva1.sinaimg.cn/large/007S8ZIlly1gfkzqiy0myj314a0u0b29.jpg)

下面介绍下最优解 

 -  使用 `__block` 关键字

![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gfks7378ktj30sk1auqby.jpg)


改外部变量必要条件之"将 auto 从栈 copy 到堆"
-------------

之所以要放堆里，原因是栈中内存管理是由系统管理，出了作用域就会被回收， 堆中才是可以由我们程序员管理。

这里先说结论：

> 在 ARC 中无论是否添加 `__block` ，block 中的 auto 变量都会被从栈上 copy 到堆上。

下面证明下该结论：

先认识一下 `__block` 修饰符：

 - `__block` 可以用于解决 block 内部无法修改 auto 变量值的问题
 - `__block` 不能修饰全局变量、静态、变量（static)

编译器会将 `__block`  变量包装成一个对象


 ```Objective-C
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
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        __block int age = 10;//__block 可替换为 __block auto (auto 可省略)
        CYLBlock block = ^{
            age = 20;
            NSLog(@"age is %@", @(age));
        };
        block();
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

 ```

![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlly1gffiapgoefj31420u0b29.jpg)





下面用代码证明下外部变量被 copy 到堆上：

我们可以打印下内存地址来进行验证：

 ```Objective-C
    __block int a = 0;
    NSLog(@"定义前：%p", &a);         //栈区
    void (^foo)(void) = ^{
        a = 1;
        NSLog(@"block内部：%p", &a);    //堆区
    };
    NSLog(@"定义后：%p", &a);         //堆区
    foo();
 ```

 ```Objective-C
2016-05-17 02:03:33.559 LeanCloudChatKit-iOS[1505:713679] 定义前：0x16fda86f8
2016-05-17 02:03:33.559 LeanCloudChatKit-iOS[1505:713679] 定义后：0x155b22fc8
2016-05-17 02:03:33.559 LeanCloudChatKit-iOS[1505:713679] block内部： 0x155b22fc8
 ```
 
 
“定义后”和“block内部”两者的内存地址是一样的，我们都知道 block 内部的变量会被 copy 到堆区，“block内部”打印的是堆地址，因而也就可以知道，“定义后”打印的也是堆的地址。
 
 
 那么如何证明“block内部”打印的是堆地址？
 
 把三个16进制的内存地址转成10进制就是：
 
 1. 定义后前：6171559672
 2. block内部：5732708296
 3. 定义后：5732708296
 
中间相差438851376个字节，也就是 418.5M 的空间，因为堆地址要小于栈地址，又因为 iOS 中主线程的栈区内存只有1M，Mac也只有8M，既然 iOS 中一条线程最大的栈空间是1M，显然a已经是在堆区了。

这也证实了：a 在定义前是栈区，但只要进入了 block 区域，就变成了堆区。

从代码角度讲：



 ```Objective-C
__block int a = 0; // 【a 会被编译成一个结构体，a struct 里会有一个 a 存储 0】
NSLog(@"定义前：%p", &a); //栈区
void (^foo)(void) = ^{
a = 1;
NSLog(@"block内部：%p", &a); //堆区
};
 ```


这里会执行 copy 操作，下面是编译后的 copy 方法，a struct 会被拷贝到堆里，自然里面的 a struct->a 也会拷贝到堆里

 ```Objective-C
static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->a, (void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}
 ```


同理可证：

 > 在 ARC 中无论是否添加 `__block` ，block 中的 auto 变量都会被从栈上 copy 到堆上。
 
 
 证明代码如下：

 ```Objective-C
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
 ```

打印是：


 ```Objective-C
2020-06-08 12:59:43.633180+0800 Demo_38_block_edit_var[35375:7813379] 定义前外部：a：0x7ffee3d81078
2020-06-08 12:59:43.633328+0800 Demo_38_block_edit_var[35375:7813379] 定义前外部：b：0x7ffee3d8105c
2020-06-08 12:59:43.633535+0800 Demo_38_block_edit_var[35375:7813379] 定义后外部：a：0x600003683578
2020-06-08 12:59:43.633640+0800 Demo_38_block_edit_var[35375:7813379] 定义后外部：b：0x7ffee3d8105c
2020-06-08 12:59:43.633754+0800 Demo_38_block_edit_var[35375:7813379] block内部：a：0x600003683578
2020-06-08 12:59:43.633859+0800 Demo_38_block_edit_var[35375:7813379] block内部：b：0x6000038ff628

 ```

 `__block` 关键字修饰后，int类型也从4字节变成了32字节，这是 Foundation 框架 malloc 出来的。这也同样能证实上面的结论。（PS：居然比 NSObject alloc 出来的 16  字节要多一倍）。



改外部变量必要条件之“将 auto 变量封装为结构体(对象)”
-------------



正如上文提到的：

 > 我们都知道：**Block不允许修改外部变量的值**，这里所说的外部变量的值，指的是栈中 auto 变量。`__block` 作用是将 auto 变量封装为结构体(对象)，在结构体内部新建一个同名 auto 变量，block 内截获该结构体的指针，在 block 中使用自动变量时，使用指针指向的结构体中的自动变量。于是就可以达到修改外部变量的作用。
 
如果把编译器的“不允许修改外部”这种行为理解为：对 block 内部捕获到的 auto 变量设置为只读属性---不允许直接修改。

那么 `__block` 的作用就是创建了一个函数，允许你通过这个函数修改“对外只读”的属性。

属性对外只读，但是对外提供专门的修改值的方法，在开发中这种做法非常常见。

自动变量生成的结构体：


 ```Objective-C
struct __Block_byref_c_0 {
  void *__isa;
__Block_byref_c_0 *__forwarding;
 int __flags;
 int __size;
//自动变量
 int c;
};
 ```


block:

 ```Objective-C
struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
//截获的结构体指针
  __Block_byref_c_0 *c; // by ref
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_c_0 *_c, int flags=0) : c(_c->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
 ```

block中使用自动变量：


 ```Objective-C
static int __main_block_func_0(struct __main_block_impl_0 *__cself, int a) {
//指针
  __Block_byref_c_0 *c = __cself->c; // bound by ref
            (c->__forwarding->c) = 11;
            a = a + (c->__forwarding->c);
            return a;
}
 ```
 
 

理解到这是因为添加了修改只读属性的方法，而非所谓的“写操作生效”，这一点至关重要，要不然你如何解释下面这个现象：

以下代码编译可以通过，并且在 block 中成功将 a 的从 Tom 修改为 Jerry。
      
 ```Objective-C
    NSMutableString *a = [NSMutableString stringWithString:@"Tom"];
    void (^foo)(void) = ^{
        a.string = @"Jerry";
        //a = [NSMutableString stringWithString:@"William"]; //编译报错
    };
    foo();
 ```


 
 同理如下操作也是允许的： 
 
 
 ```Objective-C
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
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSMutableArray *array = [[NSMutableArray array] init];
        CYLBlock block = ^{
            [array addobject: 0"123"];
            array = nil; //编译报错
        };
        block();
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

 ```


以上都是在使用变量而非修改变量，所以不会编译报错。

![](https://tva1.sinaimg.cn/large/007S8ZIlly1gfl28fzqzhj31k40m2amd.jpg)


### 39. 使用系统的某些block api（如UIView的block版本写动画时），是否也考虑引用循环问题？ 

注：39题对应Demo 请在仓库中查看以 Demo39 开头的工程。 

出题只举了一个例子，我们多举几个例子：


 ```Objective-C
//判断如下几种情况,是否有循环引用? 是否有内存泄漏?
//2020-06-01 16:34:43 @iTeaTime(技术清谈)@ChenYilong 

 //情况❶ UIViewAnimationsBlock
[UIView animateWithDuration:duration animations:^{ [self.superview layoutIfNeeded]; }]; 

 //情况❷ NSNotificationCenterBlock
[[NSNotificationCenter defaultCenter] addObserverForName:@"someNotification" 
                                                  object:nil 
                           queue:[NSOperationQueue mainQueue]
                                              usingBlock:^(NSNotification * notification) {
                                                    self.someProperty = xyz; }]; 

 //情况❸ NSNotificationCenterIVARBlock
  _observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"testKey"
                                                                object:nil
                                                                 queue:nil
                                                            usingBlock:^(NSNotification *note) {
      [self dismissModalViewControllerAnimated:YES];
  }];

 //情况❹ GCDBlock
    dispatch_group_async(self.operationGroup, self.serialQueue, ^{
        [self doSomething];
    });

//情况❺ NSOperationQueueBlock
[[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = xyz; }]; 

 ```


情况 | 循环引用 | 内存泄漏
:-------------:|:-------------:|:-------------:
情况 1 |不会循环应用 | 不会发生内存泄漏
情况 2 |不会循环引用 | 会发生内存泄漏
情况 3 |会循环引用   |会发生内存泄漏
情况 4 |不会循环引用 |不会发生内存泄漏
情况 5 |不会循环引用 |不会发生内存泄漏




情况一:

系统的某些block api中，比如 `UIView` 的 `block` 版本写动画时不需要考虑循环引用的问题，但也有一些系统 api 需要考虑内存泄漏的问题。

其中 `UIView` 的 `block` 版本写动画时不需要考虑虑循环引用的原因是：

比如典型的代码是这样：

 ```Objective-C
 //@iTeaTime(技术清谈)@ChenYilong 
 //思考：是否有内存泄漏?是否有循环引用?
[UIView animateWithDuration:duration animations:^{ [self.superview layoutIfNeeded]; }]; 
 ```
 
 其中 `block` 会立即执行，所以并不会持有 `block` 。 其中 `duration` 延迟时间并不能决定 `block` 执行的时机， `block` 始终是瞬间执行。
 

 这里涉及了 `CoreAnimation` （核心动画）相关的知识：
 
 首先分清下面几个结构概念：
 
  - UIView 层
  - Layer 层
  - data 数据层
  
  其中
  
  - UIView 层的`block` 仅仅是提供了类似快照 data 的变化。
  - 当真正执行  `Animation` 动画时才会将“原有状态”与“执行完 `block` 的状态”做一个差值，来去做动画。
 
这个问题关于循环引用的部分已经解答完毕，下面我们来扩展一下，探究一下系统 API 相关的内存泄漏问题。


-------------

情况二:




 ```Objective-C
 //@iTeaTime(技术清谈)@ChenYilong 
 //思考：是否有内存泄漏?是否有循环引用?
[[NSNotificationCenter defaultCenter] addObserverForName:@"someNotification" 
                                                  object:nil 
                           queue:[NSOperationQueue mainQueue]
                                              usingBlock:^(NSNotification * notification) {
                                                    self.someProperty = xyz; }]; 
 ```
 
 情况三:
 
 ```Objective-C
 //@iTeaTime(技术清谈)@ChenYilong 
 //思考：是否有内存泄漏?是否有循环引用?
  _observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"testKey"
                                                                object:nil
                                                                 queue:nil
                                                            usingBlock:^(NSNotification *note) {
      [self dismissModalViewControllerAnimated:YES];
  }];
 ```
 

情况四:

而下面的代码虽然有类似的结构但并不存在内存泄漏:


 ```Objective-C
 //@iTeaTime(技术清谈)@ChenYilong 
  //思考：是否有内存泄漏?是否有循环引用?
    dispatch_group_async(self.operationGroup, self.serialQueue, ^{
        [self doSomething];
    });
 ```


那么为什么情况二 `NSNotificationCenter` 的代码会有内存泄漏问题呢？


~~我之前的理解: self --> _observer --> block --> self 显然这也是一个循环引用。（对循环引用的成因解释有误，详见issue#73 https://github.com/ChenYilong/iOSInterviewQuestions/issues/73 ）~~


其实和循环引用没有关系；这里 `block` 强引用了 `self` , 但是 `self` 并没有强引用`block`; 所以没有循环引用。

情况二这里出现内存泄漏问题实际上是因为：

 - `[NSNoficationCenter defaultCenter]` 持有了 `block`
 - 这个 `block` 持有了 `self`; 
 - 而 `[NSNoficationCenter defaultCenter]` 是一个单例，因此这个单例持有了 `self`, 从而导致 `self` 不被释放。

![https://github.com/ChenYilong](https://tva1.sinaimg.cn/large/007S8ZIlgy1gfcrlp0gn0j30z40lwag6.jpg)

这个结论可参考参考issue中讨论：[《第39题的一些疑问 #138》](https://github.com/ChenYilong/iOSInterviewQuestions/issues/138) 



![](https://tva1.sinaimg.cn/large/007S8ZIlgy1gfd5t6s8n8j31c00u0u0y.jpg)

以下来自[APPLE API文档 -- Instance Method
addObserverForName:object:queue:usingBlock:]( https://developer.apple.com/documentation/foundation/nsnotificationcenter/1411723-addobserverforname) ：

> The block is copied by the notification center and (the copy) held until the observer registration is removed.

但整个过程中并没有循环引用，因为 `self` 没有持有 `NotificationCenter` , 也没有持有 `block`。即使 `self` 持有这个`Observer`, 并没有任何证据或者文档标明 `Observer` 会持有这个`block`, 所以我之前的解释是不正确的。这里 Observer 应该是不持有 block 的，因为只需要 `NSNotificationCenter` 同时持有 `Observer` 和 `block` 即可实现 `API` 所提供的功能, 这里也不存在循环引用。



其中情况三:

存在循环引用

![](https://tva1.sinaimg.cn/large/007S8ZIlgy1gfd5sf6tbbj31c00u0npd.jpg)

![https://github.com/ChenYilong](https://i.loli.net/2020/06/02/pDLde8Hgkt4X69u.gif)

![](https://tva1.sinaimg.cn/large/007S8ZIlgy1gfd5v5laamj31hc0u0dvv.jpg)

根据上面的原理，思考一下情况五：

 ```Objective-C
  //@iTeaTime(技术清谈)@ChenYilong 
  //思考：是否有内存泄漏?是否有循环引用?
[[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = xyz; }]; 
 ```
 
 <p><del> 这个因为 `[NSOperationQueue mainQueue]` 并非单例，所以并没有内存泄漏。
 见下图:
 
https://tva1.sinaimg.cn/large/007S8ZIlgy1gfct4s2979j30y00lq0y0.jpg
 (此图有问题, 请忽略, 请参考下文的正确描述)
 
 </del></p>
 
在 Gnustep 源码中可以证实
`[NSOperationQueue mainQueue]` 是单例，然后参考 `addOperationWithBlock` 源码可知：

虽然是单例，但它并不持有 `block`，不会造成循环引用，传递完成后就销毁了，不会造成无法释放的内存泄漏问题。

参考issue中讨论：[《第39题的一些疑问 #138》](https://github.com/ChenYilong/iOSInterviewQuestions/issues/138) 

-------------

针对情况四 `GCD` 的问题，实际上，self确实持有了queue; 而block也确实持有了self; 但是并没有证据或者文档表明这个queue一定会持有block; 而且即使queue持有了block, 在block执行完毕的时候，由于需要将任务从队列中移除，因此完全可以解除queue对block的持有关系，所以实际上这里也不存在循环引用。下面的测试代码可以验证这一点(其中`CYLUser`有一个属性name):


 ```Objective-C
   //@iTeaTime(技术清谈)@ChenYilong 
	    CYLUser *user = [[CYLUser alloc] init];
    dispatch_group_async(self.operationGroup, self.serialQueue, ^{
        NSLog(@"dispatch_async demoGCDRetainCycle");
        [self.testList addObject:@"demoGCDRetainCycle2"];
        user.name = @"测试";
        NSLog(@"Detecor 's name: %@", user.name);
    });
 ```

    
那么会看到先打印出 `dispatch_async demoGCDRetainCycle`, 然后打印出这个 `user` 的name, 然后执行 `CYLUser` 的 `-dealloc` 方法。也就是说在这个block执行完毕的时候，仅由这个block持有的 `user`就会被释放了, 从而验证这个 `block` 都被释放了，即使对应的 `queue` 还存在。   


什么时候这里会有循环引用呢？仍然是当 `self` 持有 `block` 的时候，例如这个 `block`是 `self` 的一个 `strong` 的属性，但这就和 `GCD` 的调用无关了，这个时候无论是否调用 `GCD` 的 `API` 都会有循环引用的。


检测代码中是否存在循环引用/内存泄漏问题，

- 可用 Xcode-instruments-Leak 工具查看
- 也可以使用可以使用 Xcode 的 Debug 工具--内存图查看，使用方法
- ![https://github.com/ChenYilong](https://i.loli.net/2020/06/02/pDLde8Hgkt4X69u.gif)
- 使用 Facebook 开源的一个检测工具  [***FBRetainCycleDetector***](https://github.com/facebook/FBRetainCycleDetector) 。


### 40. GCD的队列（`dispatch_queue_t`）分哪两种类型？


 1. 串行队列Serial Dispatch Queue
 2. 并发队列Concurrent Dispatch Queue

### 41. 如何用GCD同步若干个异步调用？（如根据若干个url异步加载多张图片，然后在都下载完成后合成一张整图）

使用Dispatch Group追加block到Global Group Queue,这些block如果全部执行完毕，就会执行Main Dispatch Queue中的结束处理的block。

```Objective-C
dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
dispatch_group_t group = dispatch_group_create();
dispatch_group_async(group, queue, ^{ /*加载图片1 */ });
dispatch_group_async(group, queue, ^{ /*加载图片2 */ });
dispatch_group_async(group, queue, ^{ /*加载图片3 */ }); 
dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 合并图片
});
```
### 42. `dispatch_barrier_async`的作用是什么？
 在并发队列中，为了保持某些任务的顺序，需要等待一些任务完成后才能继续进行，使用 barrier 来等待之前任务完成，避免数据竞争等问题。 
 `dispatch_barrier_async` 函数会等待追加到Concurrent Dispatch Queue并发队列中的操作全部执行完之后，然后再执行 `dispatch_barrier_async` 函数追加的处理，等 `dispatch_barrier_async` 追加的处理执行结束之后，Concurrent Dispatch Queue才恢复之前的动作继续执行。

打个比方：比如你们公司周末跟团旅游，高速休息站上，司机说：大家都去上厕所，速战速决，上完厕所就上高速。超大的公共厕所，大家同时去，程序猿很快就结束了，但程序媛就可能会慢一些，即使你第一个回来，司机也不会出发，司机要等待所有人都回来后，才能出发。 `dispatch_barrier_async` 函数追加的内容就如同 “上完厕所就上高速”这个动作。

（注意：使用 `dispatch_barrier_async` ，该函数只能搭配自定义并发队列 `dispatch_queue_t` 使用。不能使用： `dispatch_get_global_queue` ，否则 `dispatch_barrier_async` 的作用会和 `dispatch_async` 的作用一模一样。 ）


### 43. 苹果为什么要废弃`dispatch_get_current_queue`？

`dispatch_get_current_queue`函数的行为常常与开发者所预期的不同。
由于派发队列是按层级来组织的，这意味着排在某条队列中的块会在其上级队列里执行。
队列间的层级关系会导致检查当前队列是否为执行同步派发所用的队列这种方法并不总是奏效。`dispatch_get_current_queue`函数通常会被用于解决由不可以重入的代码所引发的死锁，然后能用此函数解决的问题，通常也可以用"队列特定数据"来解决。

### 44. 以下代码运行结果如何？



 ```Objective-C
	- (void)viewDidLoad {
	    [super viewDidLoad];
	    NSLog(@"1");
	    dispatch_sync(dispatch_get_main_queue(), ^{
	        NSLog(@"2");
	    });
	    NSLog(@"3");
	}
 ```


只输出：1 。发生主线程锁死。


### 45. addObserver:forKeyPath:options:context:各个参数的作用分别是什么，observer中需要实现哪个方法才能获得KVO回调？

```Objective-C
// 添加键值观察
/*
1 观察者，负责处理监听事件的对象
2 观察的属性
3 观察的选项
4 上下文
*/
[self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"Person Name"];
```
observer中需要实现一下方法：



```Objective-C
// 所有的 kvo 监听到事件，都会调用此方法
/*
 1. 观察的属性
 2. 观察的对象
 3. change 属性变化字典（新／旧）
 4. 上下文，与监听的时候传递的一致
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
```

### 46. 如何手动触发一个value的KVO

所谓的“手动触发”是区别于“自动触发”：

自动触发是指类似这种场景：在注册 KVO 之前设置一个初始值，注册之后，设置一个不一样的值，就可以触发了。

想知道如何手动触发，必须知道自动触发 KVO 的原理：

键值观察通知依赖于 NSObject 的两个方法:  `willChangeValueForKey:` 和 `didChangevlueForKey:` 。在一个被观察属性发生改变之前，  `willChangeValueForKey:` 一定会被调用，这就
会记录旧的值。而当改变发生后，  `observeValueForKey:ofObject:change:context:` 会被调用，继而 `didChangeValueForKey:` 也会被调用。如果可以手动实现这些调用，就可以实现“手动触发”了。

那么“手动触发”的使用场景是什么？一般我们只在希望能控制“回调的调用时机”时才会这么做。

具体做法如下：



如果这个  `value` 是  表示时间的 `self.now` ，那么代码如下：最后两行代码缺一不可。

相关代码已放在仓库里。

 ```Objective-C
//  .m文件
//  Created by https://github.com/ChenYilong
//  微博@iOS程序犭袁(http://weibo.com/luohanchenyilong/).
//  手动触发 value 的KVO，最后两行代码缺一不可。

//@property (nonatomic, strong) NSDate *now;
- (void)viewDidLoad {
    [super viewDidLoad];
    _now = [NSDate date];
    [self addObserver:self forKeyPath:@"now" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"1");
    [self willChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"2");
    [self didChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"4");
}
 ```

但是平时我们一般不会这么干，我们都是等系统去“自动触发”。“自动触发”的实现原理：


 > 比如调用 `setNow:` 时，系统还会以某种方式在中间插入 `wilChangeValueForKey:` 、  `didChangeValueForKey:` 和 `observeValueForKeyPath:ofObject:change:context:` 的调用。


大家可能以为这是因为 `setNow:` 是合成方法，有时候我们也能看到有人这么写代码:

 ```Objective-C
- (void)setNow:(NSDate *)aDate {
    [self willChangeValueForKey:@"now"]; // 没有必要
    _now = aDate;
    [self didChangeValueForKey:@"now"];// 没有必要
}
 ```

这完全没有必要，不要这么做，这样的话，KVO代码会被调用两次。KVO在调用存取方法之前总是调用 `willChangeValueForKey:`  ，之后总是调用 `didChangeValueForkey:` 。怎么做到的呢?答案是通过 isa 混写（isa-swizzling）。下文《apple用什么方式实现对一个对象的KVO？》会有详述。


其中会触发两次，具体原因可以查看文档[Apple document : Key-Value Observing Programming Guide-Manual Change Notification]( https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVOCompliance.html#//apple_ref/doc/uid/20002178-SW3 "") ，主要是 `+automaticallyNotifiesObserversForKey:` 类方法了。



参考链接： [Manual Change Notification---Apple 官方文档](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVOCompliance.html#//apple_ref/doc/uid/20002178-SW3) 

### 47. 若一个类有实例变量 `NSString *_foo` ，调用setValue:forKey:时，可以以foo还是 `_foo` 作为key？
都可以。
### 48. KVC的keyPath中的集合运算符如何使用？

 1. 必须用在集合对象上或普通对象的集合属性上
 2. 简单集合运算符有@avg， @count ， @max ， @min ，@sum，
 3. 格式 @"@sum.age"或 @"集合属性.@max.age"

### 49. KVC和KVO的keyPath一定是属性么？

KVC 支持实例变量，KVO 只能手动支持[手动设定实例变量的KVO实现监听](https://yq.aliyun.com/articles/30483)

### 50. 如何关闭默认的KVO的默认实现，并进入自定义的KVO实现？


请参考：

  1. [《如何自己动手实现 KVO》](http://tech.glowing.com/cn/implement-kvo/)
  2. [**KVO for manually implemented properties**]( http://stackoverflow.com/a/10042641/3395008 ) 

### 51. apple用什么方式实现对一个对象的KVO？ 



[Apple 的文档](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVOImplementation.html)对 KVO 实现的描述：

 > Automatic key-value observing is implemented using a technique called isa-swizzling... When an observer is registered for an attribute of an object the isa pointer of the observed object is modified, pointing to an intermediate class rather than at the true class ...

从[Apple 的文档](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVOImplementation.html)可以看出：Apple 并不希望过多暴露 KVO 的实现细节。不过，要是借助 runtime 提供的方法去深入挖掘，所有被掩盖的细节都会原形毕露：

 > 当你观察一个对象时，一个新的类会被动态创建。这个类继承自该对象的原本的类，并重写了被观察属性的 setter 方法。重写的 setter 方法会负责在调用原 setter 方法之前和之后，通知所有观察对象：值的更改。最后通过 ` isa 混写（isa-swizzling）` 把这个对象的 isa 指针 ( isa 指针告诉 Runtime 系统这个对象的类是什么 ) 指向这个新创建的子类，对象就神奇的变成了新创建的子类的实例。我画了一张示意图，如下所示：


<p align="center"><a href="https://mp.weixin.qq.com/s/A4e5h3xgIEh6PInf1Rjqsw"><img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gfec69ggukj30qh0fvjta.jpg"></a></p>


 KVO 确实有点黑魔法：


 > Apple 使用了 ` isa 混写（isa-swizzling）`来实现 KVO 。


下面做下详细解释：

键值观察通知依赖于 NSObject 的两个方法:  `willChangeValueForKey:` 和 `didChangevlueForKey:` 。在一个被观察属性发生改变之前，  `willChangeValueForKey:` 一定会被调用，这就会记录旧的值。而当改变发生后， `observeValueForKey:ofObject:change:context:` 会被调用，继而  `didChangeValueForKey:` 也会被调用。可以手动实现这些调用，但很少有人这么做。一般我们只在希望能控制回调的调用时机时才会这么做。大部分情况下，改变通知会自动调用。

 比如调用 `setNow:` 时，系统还会以某种方式在中间插入 `wilChangeValueForKey:` 、  `didChangeValueForKey:`  和 `observeValueForKeyPath:ofObject:change:context:` 的调用。大家可能以为这是因为 `setNow:` 是合成方法，有时候我们也能看到有人这么写代码:

 ```Objective-C
- (void)setNow:(NSDate *)aDate {
    [self willChangeValueForKey:@"now"]; // 没有必要
    _now = aDate;
    [self didChangeValueForKey:@"now"];// 没有必要
}
 ```

这完全没有必要，不要这么做，这样的话，KVO代码会被调用两次。KVO在调用存取方法之前总是调用 `willChangeValueForKey:`  ，之后总是调用 `didChangeValueForkey:` 。怎么做到的呢?答案是通过 isa 混写（isa-swizzling）。第一次对一个对象调用 `addObserver:forKeyPath:options:context:` 时，框架会创建这个类的新的 KVO 子类，并将被观察对象转换为新子类的对象。在这个 KVO 特殊子类中， Cocoa 创建观察属性的 setter ，大致工作原理如下:

 ```Objective-C
- (void)setNow:(NSDate *)aDate {
    [self willChangeValueForKey:@"now"];
    [super setValue:aDate forKey:@"now"];
    [self didChangeValueForKey:@"now"];
}
 ```
这种继承和方法注入是在运行时而不是编译时实现的。这就是正确命名如此重要的原因。只有在使用KVC命名约定时，KVO才能做到这一点。

KVO 在实现中通过 ` isa 混写（isa-swizzling）` 把这个对象的 isa 指针 ( isa 指针告诉 Runtime 系统这个对象的类是什么 ) 指向这个新创建的子类，对象就神奇的变成了新创建的子类的实例。这在[Apple 的文档](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVOImplementation.html)可以得到印证：

 > Automatic key-value observing is implemented using a technique called isa-swizzling... When an observer is registered for an attribute of an object the isa pointer of the observed object is modified, pointing to an intermediate class rather than at the true class ...


然而 KVO 在实现中使用了 ` isa 混写（ isa-swizzling）` ，这个的确不是很容易发现：Apple 还重写、覆盖了 `-class` 方法并返回原来的类。 企图欺骗我们：这个类没有变，就是原本那个类。。。

但是，假设“被监听的对象”的类对象是 `MYClass` ，有时候我们能看到对 `NSKVONotifying_MYClass` 的引用而不是对  `MYClass`  的引用。借此我们得以知道 Apple 使用了 ` isa 混写（isa-swizzling）`。具体探究过程可参考[ 这篇博文 ](https://www.mikeash.com/pyblog/friday-qa-2009-01-23.html)。


那么 `wilChangeValueForKey:` 、  `didChangeValueForKey:`  和 `observeValueForKeyPath:ofObject:change:context:` 这三个方法的执行顺序是怎样的呢？

 `wilChangeValueForKey:` 、  `didChangeValueForKey:` 很好理解，`observeValueForKeyPath:ofObject:change:context:` 的执行时机是什么时候呢？

 先看一个例子：

代码已放在仓库里。

 ```Objective-C
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"now" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"1");
    [self willChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"2");
    [self didChangeValueForKey:@"now"]; // “手动触发self.now的KVO”，必写。
    NSLog(@"4");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"3");
}

 ```



如果单单从下面这个例子的打印上， 

顺序似乎是 `wilChangeValueForKey:` 、 `observeValueForKeyPath:ofObject:change:context:` 、 `didChangeValueForKey:` 。

其实不然，这里有一个 `observeValueForKeyPath:ofObject:change:context:`  , 和 `didChangeValueForKey:` 到底谁先调用的问题：如果 `observeValueForKeyPath:ofObject:change:context:` 是在 `didChangeValueForKey:` 内部触发的操作呢？ 那么顺序就是： `wilChangeValueForKey:` 、  `didChangeValueForKey:`  和 `observeValueForKeyPath:ofObject:change:context:` 

不信你把 `didChangeValueForKey:` 注视掉，看下 `observeValueForKeyPath:ofObject:change:context:` 会不会执行。

了解到这一点很重要，正如  [46. 如何手动触发一个value的KVO](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01《招聘一个靠谱的iOS》面试题参考答案/《招聘一个靠谱的iOS》面试题参考答案（下）.md#46-如何手动触发一个value的kvo)  所说的：

“手动触发”的使用场景是什么？一般我们只在希望能控制“回调的调用时机”时才会这么做。

而“回调的调用时机”就是在你调用 `didChangeValueForKey:` 方法时。

### 52. IBOutlet连出来的视图属性为什么可以被设置成weak?

参考链接：[ ***Should IBOutlets be strong or weak under ARC?*** ](http://stackoverflow.com/questions/7678469/should-iboutlets-be-strong-or-weak-under-arc)

文章告诉我们：

> 因为既然有外链那么视图在xib或者storyboard中肯定存在，视图已经对它有一个强引用了。


不过这个回答漏了个重要知识，使用storyboard（xib不行）创建的vc，会有一个叫`_topLevelObjectsToKeepAliveFromStoryboard` 的私有数组强引用所有 top level 的对象，所以这时即便 outlet 声明成weak也没关系

如果对本回答有疑问，欢迎参与讨论： 

- [《第52题 IBOutlet连出来的视图属性为什么可以被设置成weak? #51》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/51 ) 
- [《关于weak的一个问题 #39》]( https://github.com/ChenYilong/iOSInterviewQuestions/issues/39 ) 

### 53. IB中User Defined Runtime Attributes如何使用？ 

它能够通过KVC的方式配置一些你在interface builder 中不能配置的属性。当你希望在IB中作尽可能多得事情，这个特性能够帮助你编写更加轻量级的viewcontroller

<p align="center"><a href="https://mp.weixin.qq.com/s/A4e5h3xgIEh6PInf1Rjqsw"><img src="https://tva1.sinaimg.cn/large/007S8ZIlly1gfecd2fpfuj307907q3yt.jpg"></a></p>


### 54. 如何调试BAD_ACCESS错误


 1. 重写object的respondsToSelector方法，现实出现EXEC_BAD_ACCESS前访问的最后一个object
 2. 通过 Zombie 
![https://github.com/ChenYilong](http://i.stack.imgur.com/ZAdi0.png)

 3. 设置全局断点快速定位问题代码所在行
 4. Xcode 7 已经集成了BAD_ACCESS捕获功能：**Address Sanitizer**。
用法如下：在配置中勾选✅Enable Address Sanitizer

<p align="center"><a href="https://mp.weixin.qq.com/s/A4e5h3xgIEh6PInf1Rjqsw"><img src="http://ww4.sinaimg.cn/large/006y8mN6gy1g71n53zsvpj30qc09sdh7.jpg"></a></p>


### 55. lldb（gdb）常用的调试命令？

 - breakpoint 设置断点定位到某一个函数
 - n 断点指针下一步
 - po打印对象

更多 lldb（gdb） 调试命令可查看


 1. [ ***The LLDB Debugger*** ](http://lldb.llvm.org/lldb-gdb.html)；
 2. 苹果官方文档：[ ***iOS Debugging Magic*** ](https://developer.apple.com/library/ios/technotes/tn2239/_index.html)。



-------------

Posted by Posted by [微博@iOS程序犭袁](http://weibo.com/luohanchenyilong/) & [公众号@iTeaTime技术清谈](https://mp.weixin.qq.com/s/A4e5h3xgIEh6PInf1Rjqsw) 
原创文章，版权声明：自由转载-非商用-非衍生-保持署名 | [Creative Commons BY-NC-ND 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh)

<p align="center"><a href="http://weibo.com/u/1692391497?s=6uyXnP" target="_blank"><img border="0" src="http://service.t.sina.com.cn/widget/qmd/1692391497/b46c844b/1.png"/></a></p>

