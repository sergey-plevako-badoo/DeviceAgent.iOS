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

@class NSArray, NSDictionary, NSNumber, NSString, XCAccessibilityElement, XCTCapabilities, XCUIAccessibilityAction;

@protocol XCUIRemoteAccessibilityInterface <NSObject>
- (void)enableFauxCollectionViewCells:(void (^)(BOOL, NSError *))arg1;
- (void)fetchAttributes:(NSArray *)arg1 forElement:(XCAccessibilityElement *)arg2 reply:(void (^)(NSDictionary *, NSError *))arg3;
- (void)fetchParameterizedAttribute:(NSString *)arg1 forElement:(XCAccessibilityElement *)arg2 parameter:(id)arg3 reply:(void (^)(id, NSError *))arg4;
- (void)fetchSnapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 reply:(void (^)(XCUIElementSnapshotRequestResult *, NSError *))arg4;
- (void)loadAccessibilityWithTimeout:(double)arg1 reply:(void (^)(BOOL, NSError *))arg2;
- (void)performAccessibilityAction:(XCUIAccessibilityAction *)arg1 onElement:(XCAccessibilityElement *)arg2 value:(id)arg3 reply:(void (^)(NSError *))arg4;
- (void)registerForAccessibilityNotification:(NSInteger)arg1 reply:(void (^)(NSNumber *, NSError *))arg2;
- (void)requestElementAtPoint:(CGPoint)arg1 reply:(void (^)(XCAccessibilityElement *, NSError *))arg2;
- (void)requestSnapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 reply:(void (^)(XCElementSnapshot *, NSError *))arg4;
- (void)setAXTimeout:(double)arg1 reply:(void (^)(NSError *))arg2;
- (void)setAttribute:(NSString *)arg1 value:(id)arg2 element:(XCAccessibilityElement *)arg3 reply:(void (^)(BOOL, NSError *))arg4;
- (void)setLocalizableStringsDataGatheringEnabled:(BOOL)arg1 reply:(void (^)(BOOL, NSError *))arg2;
- (void)snapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 reply:(void (^)(XCElementSnapshot *, NSError *))arg4;
- (void)unregisterForAccessibilityNotification:(NSInteger)arg1 registrationToken:(NSNumber *)arg2 reply:(void (^)(NSError *))arg3;
@end

