//
//  MDKLayerViewDesignable.m
//  MDUiKit
//
//  Created by Taun Chapman on 09/24/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MDKLayerViewDesignable.h"


@interface MDKLayerViewDesignable ()
@property (nonatomic,strong) CALayer*      imageLayer;
@end


@implementation MDKLayerViewDesignable

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

- (void)prepareForInterfaceBuilder
{
    [self updateLayerProperties];
    [self setNeedsDisplay];
}

-(void)setMaskToBounds:(BOOL)maskToBounds
{
    if (_maskToBounds != maskToBounds)
    {
        _maskToBounds = maskToBounds;
        self.layer.masksToBounds = _maskToBounds;
        [self setNeedsDisplay];
    }
}

-(void)setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    self.layer.shadowOffset = shadowOffset;
    [self setNeedsDisplay];
}

-(void)setShadowColor:(UIColor *)shadowColor
{
    _shadowColor = shadowColor;
    self.layer.shadowColor = shadowColor.CGColor;
    [self setNeedsDisplay];
}

-(void)setShadowRadius:(CGFloat)shadowRadius
{
    _shadowRadius = shadowRadius;
    self.layer.shadowRadius = shadowRadius;
    [self setNeedsDisplay];
}

-(void)setShadowOpacity:(CGFloat)shadowOpacity
{
    _shadowOpacity = shadowOpacity;
    self.layer.shadowOpacity = shadowOpacity;
    [self setNeedsDisplay];
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

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
#pragma clang diagnostic pop

-(void) layoutSubviews {
    [super layoutSubviews];

    [self updateLayerProperties];
}

-(void)updateConstraints
{
    [super updateConstraints];
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
    shadowOffset = CGSizeMake(self.shadowOffset.width, self.shadowOffset.height);
#else
    // flip coord
    shadowOffset = CGSizeMake(self.shadowOffset.width, -self.shadowOffset.height);
#endif    
    layer.shadowOffset = shadowOffset;
    layer.shadowOpacity = self.shadowOpacity;
    layer.shadowRadius = self.shadowRadius;
    layer.masksToBounds = self.maskToBounds;

    self.imageLayer.contents = (__bridge id)(self.backgroundImage.CGImage);
}
@end
