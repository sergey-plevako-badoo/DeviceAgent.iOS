// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Apr 12 2019 07:16:25).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

@class NSDate, NSDictionary;

@protocol MXMInstrumental <NSCopying>
- (BOOL)harvestData:(id *)arg1 error:(id *)arg2;

@optional
- (void)didStartAtTime:(NSUInteger)arg1 startDate:(NSDate *)arg2;
- (void)didStopAtTime:(NSUInteger)arg1 stopDate:(NSDate *)arg2;
- (BOOL)prepareWithOptions:(NSDictionary *)arg1 error:(id *)arg2;
- (void)willStartAtEstimatedTime:(NSUInteger)arg1;
- (void)willStop;
@end
