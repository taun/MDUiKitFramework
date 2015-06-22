//
//  NSString+MDKConvenience.m
//  MDUiKit
//
//  Created by Taun Chapman on 04/25/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "NSString+MDKConvenience.h"

@implementation NSString (MDKConvenience)

+(NSString*) mdbStringByAppendingOrIncrementingCount:(NSString *)originalString
{
    NSArray* substrings = [originalString componentsSeparatedByString: @" "];
    NSString* lastComponent = [substrings lastObject];
    NSInteger lastCopyInteger = [lastComponent integerValue]; // 0 if not a number so never use 0
    NSMutableArray* newComponents = [substrings mutableCopy];
    if (!lastCopyInteger) {
        // equal 0 so last compoenent was not a number
        [newComponents addObject: @" 1"];
    } else {
        //increment
        [newComponents removeLastObject];
        NSString* newCopyNumber = [NSString stringWithFormat: @" %ld", (long)++lastCopyInteger];
        [newComponents addObject: newCopyNumber];
    }
    
    NSString* newString = [newComponents componentsJoinedByString: @" "];
    return newString;
}

/*
 utility method to return the contents of a plist
 */
-(id) fromPListFileNameToObject {
    NSError* error;
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource: self ofType: @"plist"];
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath: plistPath];
    
    id tempDefaults = [NSPropertyListSerialization propertyListWithData: plistXML
                                                                options: 0
                                                                 format: NULL
                                                                  error: &error];
    
    if (!tempDefaults) {
        NSLog(@"Error reading plist: %@", error);
    }
    return tempDefaults;
}

-(BOOL)isNonEmptyString
{
    return ([self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]].length > 0);
}

@end
