//
//  MDKLayerView.m
//  MDUiKit
//
//  Created by Taun Chapman on 09/24/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MDKLayerView.h"

@import UIKit;
@import QuartzCore;

@implementation MDKLayerView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

-(void) layoutSubviews {
    [super layoutSubviews];
    [self updateLayerProperties];
}

-(void) updateLayerProperties {
    CALayer* layer = self.layer;
    layer.frame = CGRectInset(self.layer.frame, self.margin, self.margin);
    layer.cornerRadius = self.cornerRadius;
    layer.borderWidth = self.borderWidth;
    UIColor* theBorderColor = self.borderColor;
    layer.borderColor = theBorderColor.CGColor;
    layer.shadowColor = self.shadowColor.CGColor;
    
    CGSize shadowOffset;
#if !TARGET_INTERFACE_BUILDER
    //
    shadowOffset = CGSizeMake(self.shadowOffset.x, self.shadowOffset.y);
#else
    // flip coord
    shadowOffset = CGSizeMake(self.shadowOffset.x, -self.shadowOffset.y);
#endif    
    layer.shadowOffset = shadowOffset;
    layer.shadowOpacity = self.shadowOpacity;
    layer.shadowRadius = self.shadowRadius;
    layer.masksToBounds = self.maskToBounds;
}
@end
