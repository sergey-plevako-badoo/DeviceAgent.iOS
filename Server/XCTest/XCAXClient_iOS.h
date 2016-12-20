//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "CDStructures.h"
#import <CoreGraphics/CoreGraphics.h>

@class NSMutableDictionary;
@class XCAccessibilityElement;

@interface XCAXClient_iOS : NSObject
{
    NSMutableDictionary *_userTestingNotificationHandlers;
    NSMutableDictionary *_cacheAccessibilityLoadedValuesForPIDs;
    unsigned long long *_alertNotificationCounter;
}

+ (id)sharedClient;
- (NSData *)screenshotData;
- (BOOL)performAction:(int)arg1 onElement:(id)arg2 value:(id)arg3 error:(id *)arg4;
- (id)parameterizedAttributeForElement:(id)arg1 attribute:(id)arg2 parameter:(id)arg3;
- (id)attributesForElement:(id)arg1 attributes:(id)arg2;
- (id)attributesForElementSnapshot:(id)arg1 attributeList:(id)arg2;
- (id)snapshotForApplication:(id)arg1 attributeList:(id)arg2 parameters:(id)arg3;
- (id)defaultParameters;
- (id)defaultAttributes;
- (void)notifyWhenViewControllerViewDidDisappearReply:(CDUnknownBlockType)arg1;
- (void)notifyWhenViewControllerViewDidAppearReply:(CDUnknownBlockType)arg1;
- (void)notifyWhenNoAnimationsAreActiveForApplication:(id)arg1 reply:(CDUnknownBlockType)arg2;
- (void)notifyWhenEventLoopIsIdleForApplication:(id)arg1 reply:(CDUnknownBlockType)arg2;
- (id)interruptingUIElementAffectingSnapshot:(id)arg1;
- (void)handleAccessibilityNotification:(int)arg1 withPayload:(id)arg2;
- (void)notifyOnNextOccurrenceOfUserTestingEvent:(id)arg1 handler:(CDUnknownBlockType)arg2;
- (void)handleUserTestingNotification:(id)arg1;
- (id)elementAtPoint:(CGPoint)arg1 error:(id *)arg2;
- (NSArray<XCAccessibilityElement *> *)activeApplications;
- (id)systemApplication;
- (BOOL)loadAccessibility:(id *)arg1;
- (BOOL)_registerForAXNotification:(int)arg1 error:(id *)arg2;
- (BOOL)_loadAccessibility:(id *)arg1;
- (id)init;

@end
