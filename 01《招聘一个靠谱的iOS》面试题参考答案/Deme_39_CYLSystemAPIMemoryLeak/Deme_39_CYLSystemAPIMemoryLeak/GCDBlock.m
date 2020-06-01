//
//  GCDBlock.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "GCDBlock.h"

@interface GCDBlock ()

@end

@implementation GCDBlock

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //情况❹ GCDBlock GCDBlock
//         dispatch_group_async(self.operationGroup, self.serialQueue, ^{
//             [self doSomething];
//         });
    
}

- (void)doSomething {
    NSLog(@"🔴类名与方法名：%@（在第%@行）, 描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
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
