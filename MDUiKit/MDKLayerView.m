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

@interface MDKLayerView ()
@property (nonatomic,strong) CALayer*      imageLayer;
@end


@implementation MDKLayerView

+(Class) layerClass {
    return [CAGradientLayer class];
}

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

-(CALayer*) imageLayer {
    if (!_imageLayer) {
        
        _imageLayer = [CALayer new];
        [self.layer addSublayer: _imageLayer];
        
        _imageLayer.contentsGravity = kCAGravityResize;
        _imageLayer.opaque = NO;
    }
    _imageLayer.frame = self.layer.bounds;
    return _imageLayer;
}
-(void) setBackgroundImage:(UIImage *)image {
    if (_backgroundImage != image) {
        _backgroundImage = image;
        [self updateLayerProperties];
    }
}

-(void) setStyleKitClass:(NSString *)styleKitClass {
    if (_styleKitClass != styleKitClass) {
        _styleKitClass = styleKitClass;
    }
}

-(void) setStyleKitImageMethod:(NSString *)styleKitImageMethod {
    if (_styleKitImageMethod != styleKitImageMethod) {
        _styleKitImageMethod = styleKitImageMethod;
        Class theClass = NSClassFromString(_styleKitClass);
        SEL theMethod = NSSelectorFromString(_styleKitImageMethod);
        if ([theClass respondsToSelector: theMethod]) {
            self.backgroundImage = [theClass performSelector: theMethod];
        }
    }
}

-(void) layoutSubviews {
    [super layoutSubviews];

    [self updateLayerProperties];
}

-(void) updateLayerProperties {
    CAGradientLayer* layer = (CAGradientLayer*)self.layer;
    layer.frame = CGRectInset(self.layer.frame, self.margin, self.margin);

    if (self.gradientStartColor && self.gradientStopColor) {
        layer.colors = @[(id)self.gradientStartColor.CGColor, (id)self.gradientStopColor.CGColor];
    }
    

    layer.cornerRadius = self.cornerRadius;
    layer.borderWidth = self.borderWidth;
    UIColor* theBorderColor = self.borderColor;
    layer.borderColor = theBorderColor.CGColor;
    UIColor* theShadowColor = self.shadowColor;
    layer.shadowColor = theShadowColor.CGColor;
    
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

    self.imageLayer.contents = (__bridge id)(self.backgroundImage.CGImage);
}
@end
