//
//  RCTRandomColorGeneratorModule.m
//  RCTRandomColorGeneratorModule
//
//  Created by chenyilong on 2022/8/29.
//

#import "RCTRandomColorGeneratorModule.h"

@implementation RCTRandomColorGeneratorModule
RCT_EXPORT_MODULE();

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(generate:(nonnull NSNumber *)option)
{
    
    return [self _generate:option];
}

- (id)_generate:(nonnull NSNumber *)option {
    id result;
    if (option.integerValue == RNColorGeneratorOptionHEX) {
        NSInteger *baseInt = arc4random() % 16777216;
        NSString *hex = [NSString stringWithFormat:@"#%06X", baseInt];
        result = hex;
    } else if (option.integerValue == RNColorGeneratorOptionRGB) {
        NSString *randomRed = [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:arc4random_uniform(256)/255.f]];
        NSString *randomGreen = [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:arc4random_uniform(256)/255.f]];
        NSString *randomBlue = [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:arc4random_uniform(256)/255.f]];
        NSArray *array = @[
            randomRed,
            randomGreen,
            randomBlue
        ];
        result = array;
    }
    return result;
}

@end
