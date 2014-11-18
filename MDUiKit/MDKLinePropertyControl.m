//
//  MDKLinePropertyControl.m
//  MDUiKit
//
//  Created by Taun Chapman on 11/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MDKLinePropertyControl.h"


@interface MDKLinePropertyControl ()

@property (nonatomic,strong) UIColor*       lineColor;
@property (nonatomic,strong) UIColor*       white70;
@property (nonatomic,strong) UIColor*       transformActionColor;
@property (nonatomic,strong) UIColor*       controlDialShadow;
@property (nonatomic,assign) CGSize         controlDialShadowOffset;
@property (nonatomic,assign) CGFloat        controlDialShadowBlurRadius;

@property (nonatomic,strong) CALayer*       dialLayer;
@property (nonatomic,strong) UIImage*       dialImage;
@property (nonatomic,strong) CALayer*       tickLayer;
@property (nonatomic,strong) CALayer*       lineHorizontalLayer;
@property (nonatomic,strong) CALayer*       lineAngleLayer;
@property (nonatomic,strong) UIImage*       angleControlImage;


@end

@implementation MDKLinePropertyControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        [self initializeDefaultValues];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        [self initializeDefaultValues];
    }
    return self;
}

-(void) awakeFromNib {
    [super awakeFromNib];
}

-(void) initializeDefaultValues {
    _lineColor = [UIColor colorWithRed: 0.044 green: 0.451 blue: 0.782 alpha: 1];
    _white70 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.692];
    _transformActionColor = [UIColor colorWithRed: 0.8 green: 0.32 blue: 0.32 alpha: 0.509];

    _controlDialShadow = [UIColor.blackColor colorWithAlphaComponent: 0.55];
    _controlDialShadowOffset = CGSizeMake(0.1, 2.1);
    _controlDialShadowBlurRadius = 4;

    _minLengthValue = 1.0;
    _maxLengthValue = 10.0;
    _stepLengthValue = 0.5;
    
    _minHeightValue = 1.0;
    _maxHeightValue = 10.0;
    _stepHeightValue = 0.5;
    
    _minAngleValue  = -360.0;
    _maxAngleValue  = 360.0;
    _stepAngleValue = 1.0;
    
    [self setupDialLayer];
    [self setupAngleControlLayer];
}

-(void) setupDialLayer {
    _dialLayer = [CALayer new];
    [self.layer addSublayer: _dialLayer];
    
    _dialLayer.contentsGravity = kCAGravityResize;
    _dialLayer.opaque = NO;
    _dialLayer.frame = self.layer.bounds;
    [_dialLayer setNeedsDisplayOnBoundsChange: YES];
}
-(void) setupAngleControlLayer {
    _lineAngleLayer = [CALayer new];
    [self.layer addSublayer: _lineAngleLayer];
    
    _lineAngleLayer.contentsGravity = kCAGravityResize;
    _lineAngleLayer.opaque = NO;
    _lineAngleLayer.frame = self.layer.bounds;
    [_dialLayer setNeedsDisplayOnBoundsChange: YES];
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    [self updateDialLayer];
    [self updateAngleControlLayer];
}
-(void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
}

-(void) updateDialLayer {
    _dialLayer.frame = self.layer.bounds;
    if (!_dialImage || !CGSizeEqualToSize(_dialImage.size, _dialLayer.bounds.size)) {
        UIGraphicsBeginImageContextWithOptions(_dialLayer.bounds.size, NO, 0.0f);
        [self drawDialLayerSize: _dialLayer.bounds.size];
        
        _dialImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        _dialLayer.contents = (__bridge id)(_dialImage.CGImage);
    }
}
-(void) updateAngleControlLayer {
    _lineAngleLayer.frame = self.layer.bounds;
    if (!_angleControlImage || !CGSizeEqualToSize(_angleControlImage.size, _lineAngleLayer.bounds.size)) {
        UIGraphicsBeginImageContextWithOptions(_lineAngleLayer.bounds.size, NO, 0.0f);
        [self drawAngleControlImageSize: _lineAngleLayer.bounds.size];
        
        _angleControlImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        _lineAngleLayer.contents = (__bridge id)(_angleControlImage.CGImage);
    }
}
-(void) drawDialLayerSize: (CGSize) size {

    float scale = size.width/350.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// OuterCircle Drawing
    UIBezierPath* outerCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(scale*82.5, scale*82.5, scale*185, scale*185)];
    [UIColor.lightGrayColor setStroke];
    outerCirclePath.lineWidth = 3;
    [outerCirclePath stroke];
    
    
    //// ZeroDegreeTick Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, scale*175, scale*175);
    
    UIBezierPath* zeroDegreeTickPath = UIBezierPath.bezierPath;
    [zeroDegreeTickPath moveToPoint: CGPointMake(scale*93, 0)];
    [zeroDegreeTickPath addLineToPoint: CGPointMake(scale*83, 0)];
    [UIColor.grayColor setStroke];
    zeroDegreeTickPath.lineWidth = 2;
    [zeroDegreeTickPath stroke];
    
    CGContextRestoreGState(context);
    
    float angleIncrement = 15.0;
    
    for (float angle = angleIncrement ; angle < 360; angle+=angleIncrement) {
        BOOL ninety = fmodf(angle, 90.0) == 0.0;
        BOOL fortyfive = fmodf(angle, 45.0) == 0.0;
        BOOL fifteen = fmodf(angle, 15.0) == 0.0;
        
        float tickWidth = ninety + fortyfive + fifteen;
        float length = ninety*4 + fortyfive*3 + fifteen*3;
        //// NinetyDegreeTick Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, scale*175, scale*175);
        CGContextRotateCTM(context, angle * M_PI / 180);
        
        UIBezierPath* ninetyDegreeTickPath = UIBezierPath.bezierPath;
        [ninetyDegreeTickPath moveToPoint: CGPointMake(scale*93, 0)];
        [ninetyDegreeTickPath addLineToPoint: CGPointMake(scale*(93-length), 0)];
        [UIColor.grayColor setStroke];
        ninetyDegreeTickPath.lineWidth = tickWidth;
        [ninetyDegreeTickPath stroke];
        
        CGContextRestoreGState(context);
    }
    
}

-(void) drawAngleControlImageSize: (CGSize) size {

    float scale = size.width/350.0;

    CGContextRef context = UIGraphicsGetCurrentContext();

    //// AngleDragCircle Drawing
    UIBezierPath* angleDragCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(scale*252.5, scale*158.5, scale*32, scale*32)];
    [_white70 setFill];
    [angleDragCirclePath fill];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, _controlDialShadowOffset, _controlDialShadowBlurRadius, [_controlDialShadow CGColor]);
    [_transformActionColor setStroke];
    angleDragCirclePath.lineWidth = 3;
    [angleDragCirclePath stroke];
    CGContextRestoreGState(context);

}


@end
