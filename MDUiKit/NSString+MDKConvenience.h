//
//  NSString+MDKConvenience.h
//  MDUiKit
//
//  Created by Taun Chapman on 04/25/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MDKConvenience)

+(NSString*) mdbStringByAppendingOrIncrementingCount: (NSString*)originalString;

/*!
 Take the receiving string and look up the file resource with the string name in the current bundle.
 
 @return a property list object
 */
-(id) fromPListFileNameToObject;

-(BOOL)isNonEmptyString;

@end
