//
//  NSString+MDKConvenience.h
//  MDUiKit
//
//  Created by Taun Chapman on 04/25/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 MOEDAE Convenience methods for NSString.
 */
@interface NSString (MDKConvenience)

/*!
 A generic class method which takes a string such as a resource name and appends a number to it or if there is already a number, increments the number.
 
 Good for copying a resource and renaming the copy so its name does not clash with the original.
 
 @param originalString the original name
 
 @return A new string with a number appended or incremented.
 */
+(NSString*) mdbStringByAppendingOrIncrementingCount: (NSString*)originalString;

/*!
 Take the receiving string and look up the file resource with the string name in the current bundle.
 
 @return a property list object
 */
-(id) fromPListFileNameToObject;

/*!
 Test that the receiver either has a length of zero or only has whitespace.
 
 @return BOOL indicating whether the string has non-whitespace characters.
 */
-(BOOL)isNonEmptyString;

@end
