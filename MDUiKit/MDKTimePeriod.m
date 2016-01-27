//
//  MDKTimePeriod.m
//  MDUiKit
//
//  Created by Taun Chapman on 01/26/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

#import "MDKTimePeriod.h"

@implementation MDKTimePeriod

@synthesize unit = _unit, period = _period;

+(NSDictionary*)unitToIntervalMap
{
    static NSDictionary* map;
    
    if (!map) map = @{@(NSCalendarUnitSecond): @(1.0),
                      @(NSCalendarUnitMinute): @(60.0),
                      @(NSCalendarUnitHour): @(60*60),
                      @(NSCalendarUnitDay): @(60.0*60.0*24.0)};
    
    return map;
}

+(NSDictionary*)unitToStringMap
{
    static NSDictionary* map;
    
    if (!map) map = @{@(NSCalendarUnitSecond): @"sec(s)",
                      @(NSCalendarUnitMinute): @"min(s)",
                      @(NSCalendarUnitHour): @"hour(s)",
                      @(NSCalendarUnitDay): @"day(s)"};
    
    return map;
}

+(instancetype)newPeriodWithPeriod:(NSTimeInterval)period unit:(NSCalendarUnit)unit
{
    return [[[self class]alloc] initWithPeriod: period unit: unit];
}

- (instancetype)initWithPeriod: (NSTimeInterval)period unit: (NSCalendarUnit) unit
{
    self = [super init];
    if (self) {
        _period = floor(fabs(period));
        _unit = unit;
        
        [self normalize];
    }
    return self;
}

-(void)setPeriod:(NSTimeInterval)period setUnit:(NSCalendarUnit)unit
{
    if (_period != period && _unit != unit)
    {
        _period = period;
        _unit = unit == 0 ? NSCalendarUnitSecond : unit;
        
        [self normalize];
    }
}

-(double)multiplierForUnit: (NSCalendarUnit)unit
{
    return [[[[self class] unitToIntervalMap] objectForKey: @(unit)] doubleValue];
}

-(NSTimeInterval)asTimeInterval
{
    return _period * [self multiplierForUnit: _unit];
}

-(BOOL)isEqualToMDKTimePeriod:(MDKTimePeriod *)object
{
    BOOL equal = NO;
    
    if ([object isMemberOfClass: [self class]])
    {
        equal = [self asTimeInterval] == [object asTimeInterval];
    }
    
    return equal;
}

-(BOOL)isEqual:(id)object
{
    if (self == object) return YES;
    
    if (![object isMemberOfClass: [self class]]) return NO;
    
    return [self isEqualToMDKTimePeriod: object];
}

-(id)copy
{
    return [MDKTimePeriod newPeriodWithPeriod: _period unit: _unit];
}

-(NSString*)unitString
{
    return [[[self class] unitToStringMap]objectForKey: @(_unit)];
}

-(NSDate *)asDateFromNow
{
    return [NSDate dateWithTimeIntervalSinceNow: [self asTimeInterval]];
}

-(void)fromTimeInterval:(NSTimeInterval)interval
{
    _period = floor(fabs(interval));
    _unit = NSCalendarUnitSecond;
    [self normalize];
}

-(void)normalize
{
    if (_period == 0)
    {
        return;
    }
    
    if (_unit == NSCalendarUnitSecond && _period < 60.0)
    {
        return;
    }
    
    if (_unit == NSCalendarUnitMinute && _period < 60.0)
    {
        return;
    }
    
    if (_unit == NSCalendarUnitHour && _period < 24.0)
    {
        return;
    }
 
    NSTimeInterval newPeriod = 0;
    NSCalendarUnit newUnit = NSCalendarUnitSecond;
    
    double timeInterval = _period * [self multiplierForUnit: _unit];
    
    double oneMinute = [self multiplierForUnit: NSCalendarUnitMinute];
    double oneHour = [self multiplierForUnit: NSCalendarUnitHour];
    double oneDay = [self multiplierForUnit: NSCalendarUnitDay];
    
    if (timeInterval < oneHour)
    {
        newUnit = NSCalendarUnitMinute;
        newPeriod = floor(timeInterval/oneMinute);
    }
    else if (timeInterval < oneDay)
    {
        newUnit = NSCalendarUnitHour;
        newPeriod = floor(timeInterval/oneHour);
    }
    else
    {
        newUnit = NSCalendarUnitDay;
        newPeriod = floor(timeInterval/oneDay);
    }

    _period = newPeriod;
    _unit = newUnit;
}

-(NSString *)asFormattedString
{
    NSString* result;
    
    result = [NSString stringWithFormat: @"%2.0f %@",_period, [self unitString]];
    
    return result;
}

-(id)debugQuickLookObject
{
    return [self asFormattedString];
}

-(NSString *)description
{
    return [self asFormattedString];
}

-(NSString *)debugDescription
{
    return [NSString stringWithFormat: @"<%@: %p> period: %f unit: %lu", NSStringFromClass([self class]),self, _period, (unsigned long)_unit];
}

@end
