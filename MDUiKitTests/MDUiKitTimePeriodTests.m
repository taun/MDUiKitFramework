//
//  MDUiKitStringCategoryTests.m
//  MDUiKit
//
//  Created by Taun Chapman on 01/26/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "MDKTimePeriod.h"

@interface MDUiKitTimePeriodTests : XCTestCase

@end


@implementation MDUiKitTimePeriodTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCopy
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod1 = [MDKTimePeriod newPeriodWithPeriod: 32 unit: NSCalendarUnitSecond];
    MDKTimePeriod* timePeriod2 = [timePeriod1 copy];
    
    XCTAssertEqualObjects(timePeriod1,timePeriod2, @"Period1 %@ should be equal to copy Period2 %@", timePeriod1, timePeriod2);
}


- (void)test32Seconds
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 32 unit: NSCalendarUnitSecond];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @"32 sec(s)"]);
}

- (void)test1Minute
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 1 unit: NSCalendarUnitMinute];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @" 1 min(s)"]);
}

- (void)test59Minute
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitMinute];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @"59 min(s)"]);
}

- (void)testEqualitySameUnit
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod1 = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitMinute];
    MDKTimePeriod* timePeriod2 = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitMinute];
    
    XCTAssertEqualObjects(timePeriod1,timePeriod2, @"Period1 %@ should be equal Period2 %@", timePeriod1, timePeriod2);
}

- (void)testEqualityDifferentUnit
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod1 = [MDKTimePeriod newPeriodWithPeriod: 59*60 unit: NSCalendarUnitSecond];
    MDKTimePeriod* timePeriod2 = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitMinute];
    
    XCTAssertEqualObjects(timePeriod1,timePeriod2, @"Period1 %@ should be equal Period2 %@", timePeriod1, timePeriod2);
}


- (void)testInEquality1
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod1 = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitSecond];
    MDKTimePeriod* timePeriod2 = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitMinute];
    
    XCTAssertNotEqualObjects(timePeriod1,timePeriod2, @"Period1 %@ should not be equal Period2 %@", timePeriod1, timePeriod2);
}

- (void)testInEquality2
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod1 = [MDKTimePeriod newPeriodWithPeriod: 58 unit: NSCalendarUnitMinute];
    MDKTimePeriod* timePeriod2 = [MDKTimePeriod newPeriodWithPeriod: 59 unit: NSCalendarUnitMinute];
    
    XCTAssertNotEqualObjects(timePeriod1, timePeriod2, @"Period1 %@ should not be equal Period2 %@", timePeriod1, timePeriod2);
}

- (void)test130Minute
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 130 unit: NSCalendarUnitMinute];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    NSString* correctAnswer = @" 2 hour(s)";
    XCTAssert([secondsString isEqualToString: correctAnswer], @"should be: %@ is: %@",correctAnswer, secondsString);
    
    double interval = [timePeriod asTimeInterval];
    double correctInterval = 2.0*60.0*60.0;
    
    XCTAssert(correctInterval == interval, @"should be: %f is: %f",correctInterval, interval);
}

- (void)testMinus130Minute
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: -130 unit: NSCalendarUnitMinute];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    NSString* correctAnswer = @" 2 hour(s)";
    XCTAssert([secondsString isEqualToString: correctAnswer], @"should be: %@ is: %@",correctAnswer, secondsString);
    
    double interval = [timePeriod asTimeInterval];
    double correctInterval = 2.0*60.0*60.0;
    
    XCTAssert(correctInterval == interval, @"should be: %f is: %f",correctInterval, interval);
}

- (void)test1Hour
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 1 unit: NSCalendarUnitHour];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @" 1 hour(s)"]);
}

- (void)test6Hour
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 6 unit: NSCalendarUnitHour];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @" 6 hour(s)"]);
    
    [timePeriod fromTimeInterval: 60*60*6];
    
    secondsString = [timePeriod asFormattedString];

    NSString* correctAnswer = @" 6 hour(s)";
    XCTAssert([secondsString isEqualToString: correctAnswer], @"should be: %@ is: %@",correctAnswer, secondsString);
}

- (void)testMinus6Hour
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 6 unit: NSCalendarUnitHour];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @" 6 hour(s)"]);
}


- (void)test1Day
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    MDKTimePeriod* timePeriod = [MDKTimePeriod newPeriodWithPeriod: 1 unit: NSCalendarUnitDay];
    
    NSString* secondsString = [timePeriod asFormattedString];
    
    XCTAssert([secondsString isEqualToString: @" 1 day(s)"]);
}


@end
