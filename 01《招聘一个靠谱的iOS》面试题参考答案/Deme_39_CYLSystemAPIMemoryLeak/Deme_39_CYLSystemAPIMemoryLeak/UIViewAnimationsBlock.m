//
//  UIViewAnimationsBlock.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "UIViewAnimationsBlock.h"

@interface UIViewAnimationsBlock ()

@end

@implementation UIViewAnimationsBlock

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSTimeInterval duration = 1000;
    [UIView animateWithDuration:duration animations:^{
        [self.view.superview layoutIfNeeded];
    }];
}

- (void)dealloc {
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
