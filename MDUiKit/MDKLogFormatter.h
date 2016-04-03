//
//  MDKLogFormatter.h
//  Daisy Sensor
//
//  Created by Taun Chapman on 04/02/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>


@interface MDKLogFormatter : NSObject <DDLogFormatter>

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage;

@end
