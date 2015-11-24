//
//  MDKCelsiusToFahrenheitValueTransformer.m
//  MDUiKit
//
//  Created by Taun Chapman on 11/23/15.
//  Copyright © 2015 MOEDAE LLC. All rights reserved.
//

#import "MDKCelsiusToFahrenheitValueTransformer.h"

@implementation MDKCelsiusToFahrenheitValueTransformer

+ (Class)transformedValueClass
{
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

+(NSString *)transformerName
{
    return @"MDKCelsiusToFahrenheitValueTransformer";
}

- (id)transformedValue:(id)value
{
    if (value == nil) return nil;
    
    if (![value respondsToSelector: @selector(doubleValue)]) {
        [NSException raise:NSInternalInconsistencyException format:@"Value does not respond to -doubleValue.  No idea what to do. (Value is an instance of %@).",
         [value class]];
    }
    
    double centigradeInterimValue = [value doubleValue]; // handles NSString and NSNumber
    double fahrenheitOutputValue = (1.8 * centigradeInterimValue) + 32;
    
    return [NSNumber numberWithDouble: fahrenheitOutputValue];
}

- (id)reverseTransformedValue:(id)value
{
    if (value == nil) return nil;
    
    if (![value respondsToSelector: @selector(doubleValue)]) {
        [NSException raise:NSInternalInconsistencyException format:@"Value does not respond to -doubleValue.  No idea what to do. (Value is an instance of %@).",
         [value class]];
    }
    
    double fahrenheitInputValue = [value doubleValue];
    double centigradeInterimValue = ((fahrenheitInputValue - 32.0) / 1.8);
    
    // convert from centigrade to kelvin and return....
    return [NSNumber numberWithDouble: centigradeInterimValue];
}
@end
