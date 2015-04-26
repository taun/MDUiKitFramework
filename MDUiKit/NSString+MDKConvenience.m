//
//  NSString+MDKConvenience.m
//  MDUiKit
//
//  Created by Taun Chapman on 04/25/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "NSString+MDKConvenience.h"

@implementation NSString (MDKConvenience)

-(BOOL)isNonEmptyString
{
    return (self && [self stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]].length > 0);
}

@end
