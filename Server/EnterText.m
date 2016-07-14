
#import "InvalidArgumentException.h"
#import "Testmanagerd.h"
#import "ThreadUtils.h"
#import "EnterText.h"

@implementation EnterText

+ (NSString *)name { return @"enter_text"; }

+ (NSArray <NSString *> *)requiredKeys {
    return @[ CBX_STRING_KEY ];
}

+ (NSArray <NSString *> *)optionalKeys {
    return @[];
}

+ (Gesture *)executeWithGestureConfiguration:(GestureConfiguration *)gestureConfig
                                       query:(Query *)query
                                  completion:(CompletionBlock)completion {
    if (![gestureConfig has:CBX_STRING_KEY]) {
        @throw [InvalidArgumentException withFormat:@"Missing required key 'string'"];
    }
    
    NSString *string = gestureConfig[CBX_STRING_KEY];
    
    [ThreadUtils runSync:^(BOOL *setToTrueWhenDone, NSError *__autoreleasing *err) {
        [[Testmanagerd get] _XCT_sendString:string
         maximumFrequency:CBX_DEFAULT_SEND_STRING_FREQUENCY
                                 completion:^(NSError *e) {
            *err = e;
            *setToTrueWhenDone = YES;
        }];
    } completion:completion];
    
    return nil;
}

@end
