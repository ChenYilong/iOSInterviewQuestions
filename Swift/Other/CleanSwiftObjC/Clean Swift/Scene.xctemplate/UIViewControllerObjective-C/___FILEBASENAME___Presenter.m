//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

#import "___VARIABLE_sceneName___Presenter.h"

@interface ___VARIABLE_sceneName___Presenter ()
@end

@implementation ___VARIABLE_sceneName___Presenter

#pragma mark Do something

- (void)presentSomething:(___VARIABLE_sceneName___DoSomethingResponse *)response
{
  ___VARIABLE_sceneName___DoSomethingViewModel *viewModel = [[___VARIABLE_sceneName___DoSomethingViewModel alloc] init];
  [self.viewController displaySomething:viewModel];
}

@end
