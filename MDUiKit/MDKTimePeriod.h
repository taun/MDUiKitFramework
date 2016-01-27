//
//  MDKTimePeriod.h
//  MDUiKit
//
//  Created by Taun Chapman on 01/26/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

@import Foundation;

@interface MDKTimePeriod : NSObject

@property(nonatomic,readonly) NSTimeInterval      period;
@property(nonatomic,readonly) NSCalendarUnit      unit;

+(instancetype) newPeriodWithPeriod: (NSTimeInterval)period unit: (NSCalendarUnit) unit;
-(instancetype) initWithPeriod: (NSTimeInterval)period unit: (NSCalendarUnit) unit;

-(void)setPeriod:(NSTimeInterval)period setUnit: (NSCalendarUnit)unit;

-(void) fromTimeInterval: (NSTimeInterval)interval;

-(NSTimeInterval)asTimeInterval;

-(NSDate*)asDateFromNow;

-(NSString*)asFormattedString;

-(BOOL)isEqualToMDKTimePeriod:(MDKTimePeriod*)object;

@end
