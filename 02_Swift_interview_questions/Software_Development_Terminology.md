# Coding language

## Basic punctuation
* comma ,
* dot .
* question mark ?
* exclamation mark !
* dash -
* underscore _
* asterisk *
* slash /
* backslash \
* vertical bar |
* tilde ~
* hash #
* caret ^
* ellipsis ...
* ampersand &
* grave `
## Bracket
* Parentheses ()
* Square bracket []
* Angle bracket <>
* Curly brackets {}

## Colon
* Colon :
* Semicolon ;
## Quotation mark
* Quotes " "
* Single quotes ' '

## Operators

### Terminology
* Unary operators operate on a single target. `-a`
* Binary operators operate on two targets. `a + b`
* Ternary operators operate on three targets. ` a ? b : c `

### Assignment Operator
`a = 5` 5 assign to a
### Arithmetic Operators
* Addition (+)
* Substraction(-)
* Multiplication(*)
* Division(/)

`a + b` a add b / a plus b
`a - b` a minus b
`a * b` a multiplied by b / a times b
`a / b` a divided by b

### Remainder Operator
`9 % 4` 9 remainder with 4
### Compound Assignment Operators
`a += 2` a plus equals 2
### Comparison Operators
* Equal to (a == b)
* Not equal to (a != b)
* Greater than (a > b)
* Less than (a < b)
* Greater than or equal to (a >= b)
* Less than or equal to (a <= b)

### Nil-Coalescing Operator
`a ?? b`
### Range Operators
* Closed Range Operators `1...5` from 1 to 5
* Half-Open Range Operators `a..<b` from a to b, but doesn't include b.
* One-Sided Ranges `names[2...]` from index 2 to the end of array. `names[..<2]` from index 0 to index 2. `...5` from start to 5
### Logical Operators
* Logical NOT (!a)
* Logical AND (a && b)
* Logical OR (a || b)

### Identity Operators
* Identical to (===)
* Not identical to (!==)

### Bitwise Operators
* Shift to the left by 1 place (<< 1)
* Shift to the right by 1 place (>> 1)
* NOT (~a)
* AND (a & b)
* OR (a | b) 
* exclusive OR (a ^ b)

### Overflow Operators
* Overflow addition (&+)
* Overflow subtraction (&-)
* Overflow multiplication (&*)

## Syntax

### Oriented-Object Programming

* 封装：encapsulation (capsule是胶囊，encapulate就是装到胶囊里，封装的动词)
* 集成：inheritance (inherit继承的动词)
* 多态：polymorphism (在希腊语里poly是多，morphic是形态学的)
 
* 函数：function
* 方法：method
* 参数：parameter
* 类：class
* 子类：subclass
* 父类：superclass
* 结构体：structure
* 元组：tuple
* 构造函数：constructor
* 实例：instance (实例化：instantiation)
* 对象：object
* 变量：variable
* 全局变量：global variable
* 局部变量：local variable
* 作用域：scope
* 常量：constant
* 成员变量：member
* 属性：property
* 储存变量：stored property
* 计算变量：computed property
* 栈：stack
* 堆：heap
* 属性包装器：property wrapper
* 字段：field
* 可空类型：optional type
* 解包可空类型：unwrapping optionals
* 强制解包：force unwrap
* 模型：model
* 模块：module (模块化：modulize)
* 值类型：value type
* 引用类型：reference type
* 重写：override
* 重载：overloading (运算符重载：operator overloading)
* 开辟内存：alloc memory
* 释放：release
* 持有：retain/store
* 循环引用：retain cycle/cycle reference
* 垃圾回收：garbage collection
* 内存泄漏：memory leak
* 调用：call/invoke
* 触发：trigger
* 扩展：extension
* 模版：template
* 原形：prototype
* 自动引用计数：ARC(automatic reference counting)
* 手动持有释放：MRR(manual retain-release)
* 上下文: context
* 声明式：declarative
* 祈使式：imperative
* 拆分：segregate/slice/split/separate
* 回调：callback

### Oriented-Protocol Programming

* 接口：protocol/interface
* 默认实现：default implementation
* 遵从接口：comform to protocol
* 代理：delegate
* 关联类型：associatedtype
* 类型别名：typealias
* 可选接口方法：optional protocol methods
* 泛型：generics
* 类型参数：type parameter (< T >)
* 不透明类型：opaque type (some View)
* 装饰器：decorator

### Reactive
* 发布者：publisher
* 订阅者：subscriber
* 事件驱动：event-driven

### Multi-thread
* 线程：thread
* 进程：process
* 信号量：semaphore
* 线程安全：thread safety
* 死锁：deadlock
* 并发：concurrency
* 串行：serialisation (serial串行的)
* 并行：parallel
* 同步：synchronous
* 异步：asynchronous
* 结构并发：structured concurrency
* 任务：task/job
* 挂起：wait/suspend
* 阻塞：pend/notify
* 休眠：sleep
* 轮询：polling
* 中断：interrupt

### Data
* 数据库: database
* 关系型数据库: relational database
* 序列化: serialize (serialization名词)
* 反序列化: deserialize
* 建表: create table
* 读取: read
* 更新: update
* 删除: delete
* 持久化: persistence
* 实体: entity
* 存储: storage
* 单项数据流: unidirectional data flow
* 双向绑定：Two-Way bindings
* 升序：ascending
* 降序：descending

### Network
* 仓库：repository
* 节点：endpoint
* 广播风暴：broadcast storm
* 重定向：redirect
* 授权：authentication
* 压缩：compression
* 缓存：cache
* 三次握手：3-way handshake
* 应答: acknowledgement

### Access Control

* 公有：public
* 私有：private
* 文件私有：file private
* 内联：internal

## Operation
* 灰度发布：gray release
* 开发环境：development environment
* 生产环境：product environment
* A/B测试：A/B Test
* 打点日志：tracking log
* 数据收集：data collection
* 诊断：diagnose
* 迭代：iterative

## UI
* 布局：layout
* 自动布局：autolayout
* 约束：restraint
* 对齐: alignment
* 行首空格：indent

## Security
* 编码: encode
* 解码: decode
* 加密: encryption
* 解密: decryption
* 对称加密: symmetric-key encryption
* 非对称加密: public-key encryption (asymmetric encryption)
* 混淆: hash
* SSL: Secure Sockets Layer

## Debug
* 歧义：ambiguity
* 错误处理：error handling/exception handling 

## Others

### Code Mess
* Spaghetti code (意大利面代码，表示乱的搅在了一起)
* Ravioli code (意大利饺子代码，表示代码分了模块)
* Lasagna code (千层面代码，表示代码分了层)
