//
//  QRCodeGeneratorTests.m
//  BarcodeKitTests
//
//  Created by SAITO Tomomi on 2018/07/19.
//  Copyright © 2018年 Project Flora. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <BarcodeKit/BarcodeKit.h>

@interface QRCodeGeneratorTests : XCTestCase

@end

@implementation QRCodeGeneratorTests

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
    
    QRCodeGenerator *generator = [[QRCodeGenerator alloc] initWithString:@"Hello,world"];
    NSImage *image = generator.image;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
