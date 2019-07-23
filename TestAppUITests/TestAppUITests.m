//
//  TestAppUITests.m
//  TestAppUITests
//
//  Created by  Sergey Dolin on 23/07/2019.
//  Copyright © 2019 Calabash. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TestAppUITests : XCTestCase

@end

@implementation TestAppUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = YES;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testUIWebView {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    [app.buttons[@"Misc"] tap];
    [app.tables.cells[@"text input row"] tap];
    
    XCUIElement* textField = [app.textFields elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"123"];
    XCUIElement *q = app.textFields[@"text field"];
    NSString* v = q.value;
    NSLog(@"%@", v);
    XCTAssertEqualObjects(v, @"123");
    
}


@end

