//
//  MDKLogFormatter.m
//  Daisy Sensor
//
//  Created by Taun Chapman on 04/02/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

#import "MDKLogFormatter.h"

//#define XCODE_COLORS_ESCAPE_MAC @"\033["
//#define XCODE_COLORS_ESCAPE_IOS @"\xC2\xA0["

//#if TARGET_OS_IPHONE
//#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_IOS
//#else
//#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_MAC
//#endif

//#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
//#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
//#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

//#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

@implementation MDKLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
//    static NSString* bundleID;
    
//    if (!bundleID)
//    {
//        bundleID = [[NSBundle mainBundle] bundleIdentifier];
//    }

    NSString* logFlag = nil;
    
    
    if ((logMessage.flag & DDLogFlagError) == DDLogFlagError)
    {
        logFlag = @"E💔";
    }
    else if ((logMessage.flag & DDLogFlagWarning) == DDLogFlagWarning)
    {
        logFlag = @"W💛";
    }
    else if ((logMessage.flag & DDLogFlagInfo) == DDLogFlagInfo)
    {
        logFlag = @"I💙";
    }
    else if ((logMessage.flag & DDLogFlagVerbose) == DDLogFlagVerbose)
    {
        logFlag = @"V♡";
    }
    else if ((logMessage.flag & DDLogFlagDebug) == DDLogFlagDebug)
    {
        logFlag = @"D💚";
    }

    return [NSString stringWithFormat:@"(Q %@),(%@),(Line %lu),(%@),'%@'",
            logMessage.queueLabel,
            logFlag,
            (unsigned long)logMessage.line,
            logMessage.function,
            logMessage.message];
}

@end
