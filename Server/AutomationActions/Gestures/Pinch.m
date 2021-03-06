
#import "Pinch.h"
#import "CBX-XCTest-Umbrella.h"
#import "XCTest+CBXAdditions.h"
#import "CBXConstants.h"
#import "CBXTouchEvent.h"
#import "Coordinate.h"
#import "Application.h"
#import "TouchPath.h"
#import "Gesture+Options.h"

@implementation Pinch
+ (NSString *)name { return @"pinch"; }

+ (NSArray <NSString *> *)optionalKeys {
    return @[
             CBX_DURATION_KEY,
             CBX_PINCH_AMOUNT_KEY,
             CBX_PINCH_DIRECTION_KEY
             ];
}

- (CBXTouchEvent *)cbxEventWithCoordinates:(NSArray<Coordinate *> *)coordinates {
    CBXTouchEvent *event = [CBXTouchEvent new];

    CGPoint center = coordinates[0].cgpoint;
    float duration = [self duration];
    float amount = [self pinchAmount];
    NSString *direction = [self pinchDirection];
    UIInterfaceOrientation orientation = [[Application currentApplication]
                                          interfaceOrientation];
    
    CGPoint p1 = center,
    p2 = center;

    //TODO: let user specify orientation of pinch?
    p1.x -= amount;
    p2.x += amount;

    for (NSValue *v in @[ [NSValue valueWithCGPoint:p1],
                          [NSValue valueWithCGPoint:p2]]) {
        if ([direction isEqualToString:CBX_PINCH_IN]) { //Zoom in
            TouchPath *path = [TouchPath withFirstTouchPoint:center
                                                 orientation:orientation];

            [path moveToNextPoint:[v CGPointValue] afterSeconds:duration];
            [path liftUpAfterSeconds:duration + CBX_GESTURE_EPSILON];
            [event addTouchPath:path];
        } else {
            TouchPath *path = [TouchPath withFirstTouchPoint:[v CGPointValue]
                                                 orientation:orientation];
            [path moveToNextPoint:center afterSeconds:duration];
            [path liftUpAfterSeconds:duration + CBX_GESTURE_EPSILON];
            [event addTouchPath:path];
        }
    }

    return event;
}
@end
