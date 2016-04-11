//
//  MDKLogFormatter.m
//  Daisy Sensor
//
//  Created by Taun Chapman on 04/02/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

#import "MDKLogFormatter.h"

@implementation MDKLogFormatter
- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
//    static NSString* bundleID;
    
//    if (!bundleID)
//    {
//        bundleID = [[NSBundle mainBundle] bundleIdentifier];
//    }
    
    NSString* logLevel = nil;
    
    switch (logMessage.level) {
        case DDLogLevelError : logLevel = @"E"; break;
        case DDLogLevelWarning  : logLevel = @"W"; break;
        case DDLogLevelInfo  : logLevel = @"I"; break;
        case DDLogLevelDebug  : logLevel = @"D"; break;
        default             : logLevel = @"V"; break;
    }
    
    return [NSString stringWithFormat:@"%@, [T %@],[Q %@],[%@],[Line %lu],[%@],'%@'",
            logMessage.timestamp,
            logMessage.threadName,
            logMessage.queueLabel,
            logLevel,
            logMessage.line,
            logMessage.function,
            logMessage.message];
}
@end
