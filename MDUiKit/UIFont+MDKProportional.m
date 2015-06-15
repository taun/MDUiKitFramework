//  Created by Taun Chapman on 06/15/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "UIFont+MDKProportional.h"
@import CoreText;


@implementation UIFont (MDKProportional)

+(UIFont*)proportionalForExistingFont: (UIFont*)existingFont
{
UIFontDescriptor *const existingDescriptor = [existingFont fontDescriptor];

NSDictionary *const fontAttributes = @{
                                       // Here comes that array of dictionaries each containing UIFontFeatureTypeIdentifierKey
                                       // and UIFontFeatureSelectorIdentifierKey that the reference mentions.
                                       UIFontDescriptorFeatureSettingsAttribute: @[
                                               @{
                                                   UIFontFeatureTypeIdentifierKey: @(kNumberSpacingType),
                                                   UIFontFeatureSelectorIdentifierKey: @(kProportionalNumbersSelector)
                                                   }]
                                       };

UIFontDescriptor *const proportionalDescriptor = [existingDescriptor fontDescriptorByAddingAttributes: fontAttributes];
    
return  [UIFont fontWithDescriptor: proportionalDescriptor size: [existingFont pointSize]];
}
@end
