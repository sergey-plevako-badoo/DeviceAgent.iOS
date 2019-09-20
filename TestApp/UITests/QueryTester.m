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
    
    NSString *enteredValue = @"qwertyuiop";
    [field doubleTap];
    [field typeText:enteredValue];
    
    NSLog(@"Value = %@", field.value);
    XCTAssertEqual(field.value, enteredValue);
    NSLog(@"Placeholder = %@", field.placeholderValue);
    NSLog(@"Identifier = %@", field.identifier);
//    NSLog(@"Type = %@", field.elementType);
    
    
//    id applicationQuery = [XCUIApplication cbxQuery:self];
//
//    [XCUIApplication cbxResolveApplication:self
//                          applicationQuery:applicationQuery];
//
//    Class klass = NSClassFromString(@"XCApplicationQuery");
//    SEL selector = NSSelectorFromString(@"descendantsMatchingType:");
//
//    NSMethodSignature *signature;
//    signature = [klass instanceMethodSignatureForSelector:selector];
//    NSInvocation *invocation;
//
//    invocation = [NSInvocation invocationWithMethodSignature:signature];
//    invocation.target = applicationQuery;
//    invocation.selector = selector;
//
//    XCUIElementType elementType = XCUIElementTypeAny;
//    [invocation setArgument:&elementType atIndex:2];
//
//    void *buffer = nil;
//    [invocation invoke];
//    [invocation getReturnValue:&buffer];
//    XCUIElementQuery *query = (__bridge XCUIElementQuery *)buffer;
//
//
//    for (QuerySpecifier *specifier in self.queryConfiguration.selectors) {
//        query = [specifier applyToQuery:query];
//    }
//
//    NSArray <XCUIElement *> *elements = [query allElementsBoundByIndex];
}

@end
