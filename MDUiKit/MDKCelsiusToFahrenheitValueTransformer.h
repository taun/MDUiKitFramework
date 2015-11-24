//
//  MDKCelsiusToFahrenheitValueTransformer.h
//  MDUiKit
//
//  Created by Taun Chapman on 11/23/15.
//  Copyright © 2015 MOEDAE LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDKCelsiusToFahrenheitValueTransformer : NSValueTransformer

+ (Class)transformedValueClass;
+ (BOOL)allowsReverseTransformation;
+ (NSString*)transformerName;

- (id)transformedValue:(id)value;
- (id)reverseTransformedValue:(id)value;

@end
