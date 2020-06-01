//
//  NSOperationQueueBlock.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "NSOperationQueueBlock.h"

@interface NSOperationQueueBlock ()

@end

@implementation NSOperationQueueBlock

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{ self.someProperty = xyz; }];
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
