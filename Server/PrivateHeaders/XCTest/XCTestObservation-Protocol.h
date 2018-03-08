// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

@class NSBundle, NSString, XCTestCase, XCTestSuite;

@protocol XCTestObservation <NSObject>

@optional
- (void)testBundleDidFinish:(NSBundle *)arg1;
- (void)testBundleWillStart:(NSBundle *)arg1;
- (void)testCase:(XCTestCase *)arg1 didFailWithDescription:(NSString *)arg2 inFile:(NSString *)arg3 atLine:(NSUInteger)arg4;
- (void)testCaseDidFinish:(XCTestCase *)arg1;
- (void)testCaseWillStart:(XCTestCase *)arg1;
- (void)testSuite:(XCTestSuite *)arg1 didFailWithDescription:(NSString *)arg2 inFile:(NSString *)arg3 atLine:(NSUInteger)arg4;
- (void)testSuiteDidFinish:(XCTestSuite *)arg1;
- (void)testSuiteWillStart:(XCTestSuite *)arg1;
@end
