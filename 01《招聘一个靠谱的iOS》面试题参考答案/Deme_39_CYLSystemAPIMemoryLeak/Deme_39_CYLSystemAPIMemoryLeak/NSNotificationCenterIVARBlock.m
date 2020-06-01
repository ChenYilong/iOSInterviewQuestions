//
//  NSNotificationCenterIVARBlock.m
//  Deme_39_CYLSystemAPIMemoryLeak
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import "NSNotificationCenterIVARBlock.h"

@interface NSNotificationCenterIVARBlock ()
@property (nonatomic, strong) id observer;
@end

@implementation NSNotificationCenterIVARBlock

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     class T {
         var a: Any?
         func add() {
             a = NotificationCenter.default.addObserver(forName:
     UIApplication.backgroundRefreshStatusDidChangeNotification, object:
     nil, queue: nil) { (ntf) in
                 print(#function, self)
             }
         }
         func remove() {
             NotificationCenter.default.removeObserver(a!)
         }
         deinit {
             print(#function, self)
         }
         static var k = ""
     }
     let t = T()
     t.add()
     t.remove()
     */
    self.observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"testKey"
                                                                         object:nil
                                                                          queue:nil
                                                                     usingBlock:^(NSNotification *note) {
               NSLog(@"🔴类名与方法名：%@（在第%@行）, 描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), self);
           }];
}

- (void)remove {
    [[NSNotificationCenter defaultCenter] removeObserver:self.observer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self remove];
}

- (void)dealloc {
    NSLog(@"🔴类名与方法名：%@（在第%@行）, 描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}

@end
