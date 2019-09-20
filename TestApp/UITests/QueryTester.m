#import <XCTest/XCTest.h>

@interface QueryTester : XCTestCase

@end

@implementation QueryTester

- (void)setUp {
    self.continueAfterFailure = YES;
//    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
}

- (void)openConTextPage: (XCUIApplication *) app {
    [app.buttons[@"Misc"] tap];
    NSString* rowId = @"text input row";
    [app.tables.cells[rowId] tap];
}

- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    [self openConTextPage: app];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == \"text field\" OR accessibilityIdentifier == \"text field\" OR label == \"text field\" OR accessibilityLabel == \"text field\" OR title == \"text field\" OR value == \"text field\" OR placeholderValue == \"text field\""];
    
    XCUIElementQuery *query = [app.textFields matchingPredicate: predicate];
    NSArray <XCUIElement *> *elements = [query allElementsBoundByIndex];
    XCUIElement * field = elements[0];
    
    XCTAssertNotNil(field);
    
    NSLog(@"Value = %@", field.value);
    NSLog(@"Placeholder = %@", field.placeholderValue);
    NSLog(@"Identifier = %@", field.identifier);
}

@end
