//
//  Deme_39_CYLSystemAPIMemoryLeakUITests.m
//  Deme_39_CYLSystemAPIMemoryLeakUITests
//
//  Created by chenyilong on 2020/6/1.
//  Copyright © 2020 ChenYilong. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Deme_39_CYLSystemAPIMemoryLeakUITests : XCTestCase

@end

@implementation Deme_39_CYLSystemAPIMemoryLeakUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
