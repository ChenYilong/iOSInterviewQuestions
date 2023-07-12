//
//  RCTRandomColorGeneratorModule.h
//  RCTRandomColorGeneratorModule
//
//  Created by chenyilong on 2022/8/29.
//
#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>

typedef enum {
  RNColorGeneratorOptionHEX = 0,
  RNColorGeneratorOptionRGB = 1
} RNColorGeneratorOption;

@interface RCTRandomColorGeneratorModule : NSObject <RCTBridgeModule>

- (NSString *)_generate:(nonnull NSNumber *)option;

@end
