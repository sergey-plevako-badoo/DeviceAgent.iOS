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

@class NSError;

@interface XCTResult : NSObject
{
    id _value;
    NSError *_error;
}

@property(retain) NSError *error;
@property(readonly) BOOL hasError;
@property(readonly) BOOL hasValue;
@property(retain) id value;

+ (id)futureResultWithTimeout:(double)arg1 description:(id)arg2 block:(CDUnknownBlockType)arg3;
+ (id)result;
+ (id)resultWithError:(id)arg1;
+ (id)resultWithValue:(id)arg1;
+ (id)resultWithValue:(id)arg1 error:(id)arg2;
- (id)initWithValue:(id)arg1 error:(id)arg2;

@end
