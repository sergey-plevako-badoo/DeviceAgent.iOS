// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

#import <objc/NSObject.h>

#import "XCTestObservation-Protocol.h"


@interface CustomObserver : NSObject <XCTestObservation>
{
}

- (void)testBundleDidFinish:(id)arg1;
- (void)testBundleWillStart:(id)arg1;
- (void)testCase:(id)arg1 didFailWithDescription:(id)arg2 inFile:(id)arg3 atLine:(NSUInteger)arg4;
- (void)testCaseDidFinish:(id)arg1;
- (void)testCaseWillStart:(id)arg1;
- (void)testSuite:(id)arg1 didFailWithDescription:(id)arg2 inFile:(id)arg3 atLine:(NSUInteger)arg4;
- (void)testSuiteDidFinish:(id)arg1;
- (void)testSuiteWillStart:(id)arg1;


@end
