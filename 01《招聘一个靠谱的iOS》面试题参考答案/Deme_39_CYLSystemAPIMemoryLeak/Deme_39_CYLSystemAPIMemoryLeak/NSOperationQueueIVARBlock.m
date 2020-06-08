//
//  NSOperationQueueIVARBlock.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "NSOperationQueueIVARBlock.h"
#import "CYLBaseViewController+CYLBaseViewControllerExtension.h"

@interface NSOperationQueueIVARBlock ()

@end

@implementation NSOperationQueueIVARBlock

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cyl_test];                                       //分类实例方法：必须在子类中手动 import 父类的分类, 否则抛 编译错误❌
    [self performSelector:@selector(cyl_test)];            //分类实例方法：必须在子类中手动 import 父类的分类, 否则抛 warning⚠️
    [[self class] cyl_testClass];                          //分类类方法：  必须在子类中手动 import 父类的分类, 否则编译错误   ❌
    [[self class]performSelector:@selector(cyl_testClass)];//分类类方法：  必须在子类中手动 import 父类的分类, 否则抛 warning⚠️

    // Do any additional setup after loading the view.
//    _mainQueue = [[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = xyz; }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
