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

#import "XCTElementSetCodableTransformer.h"

@class NSPredicate;

@interface XCTElementContainingTransformer : XCTElementSetCodableTransformer
{
    NSPredicate *_predicate;
}

@property(readonly, copy) NSPredicate *predicate;

+ (void)provideCapabilitiesToBuilder:(id)arg1;
- (BOOL)_elementMatches:(id)arg1 relatedElement:(id *)arg2;
- (BOOL)canBeRemotelyEvaluatedWithCapabilities:(id)arg1;
- (id)initWithPredicate:(id)arg1;
- (id)iteratorForInput:(id)arg1;
- (id)requiredKeyPathsOrError:(id *)arg1;
- (BOOL)supportsAttributeKeyPathAnalysis;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;

@end

