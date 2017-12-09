//
//  MGNetworkTests.m
//  MGNetworkTests
//
//  Created by Gohary on 12/9/17.
//  Copyright © 2017 Mohammed ElGohary. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGNetworkDownloader.h"
#import "NSDictionary+encoding.h"

@interface MGNetworkTests : XCTestCase

@end

@implementation MGNetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)testGetParamsEncoding{
    NSString *str = [@{@"key":@"value", @"key1":@"value 2", @"key2":@123, @"key3":@"%$#"} prepareGetRequestParameters];
    XCTAssertEqualObjects(str, @"key3=%25$%23&key1=value%202&key=value&key2=123");
}

- (void)testEmptyParametersEncoding{
    NSString *str = [@{} prepareGetRequestParameters];
    XCTAssertEqualObjects(str, @"");
}

- (void)testURLRequest{
    XCTestExpectation *expectation = [self expectationWithDescription:@"do get request without parameters"];

    [MGNetworkDownloader get:@"https://apple.com" andResult:^(NSData *data, NSURLResponse *response, NSError *error){
        XCTAssertNil(error, @"request failed with error %@", error);
        NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
        XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", statusCode);
        XCTAssert(data, @"received data is nil");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testURLRequestWithNilParameters{
    XCTestExpectation *expectation = [self expectationWithDescription:@"do get request with nil parameters parameters"];
    [MGNetworkDownloader get:@"https://apple.com" andParameters:nil andResult:^(NSData *data, NSURLResponse *response, NSError *error){
        XCTAssertNil(error, @"request failed with error %@", error);
        NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
        XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", statusCode);
        XCTAssert(data, @"received data is nil");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testURLRequestWithParameters{
    XCTestExpectation *expectation = [self expectationWithDescription:@"do get request with dictionary parameters parameters"];
    [MGNetworkDownloader get:@"https://apple.com" andParameters:nil andResult:^(NSData *data, NSURLResponse *response, NSError *error){
        XCTAssertNil(error, @"request failed with error %@", error);
        NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
        XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", statusCode);
        XCTAssert(data, @"received data is nil");
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
}
@end
