//
//  QuartzHelpers.c
//  FractalScape
//
//  Created by Taun Chapman on 01/12/12.
//  Copyright (c) 2012 MOEDAE LLC. All rights reserved.
//

#include "QuartzHelpers.h"

CGPoint CGPointConfineToRect(CGPoint p, CGRect r) {
    CGPoint constrainedPoint = CGPointZero;
    
    if (CGRectContainsPoint(r, p)) {
        constrainedPoint = p;
    } else {
        CGFloat limitedX;
        CGFloat limitedY;
        limitedX = p.x < CGRectGetMinX(r) ? CGRectGetMinX(r) : p.x;
        limitedX = p.x > CGRectGetMaxX(r) ? CGRectGetMaxX(r) : limitedX;
        limitedY = p.y < CGRectGetMinY(r) ? CGRectGetMinY(r) : p.y;
        limitedY = p.y > CGRectGetMaxY(r) ? CGRectGetMaxY(r) : limitedY;
        constrainedPoint = CGPointMake(limitedX, limitedY);
    }
    return constrainedPoint;
}

CGColorRef CreateDeviceGrayColor(CGFloat w, CGFloat a)
{
	CGColorSpaceRef gray = CGColorSpaceCreateDeviceGray();
	CGFloat comps[] = {w, a};
	CGColorRef color = CGColorCreate(gray, comps);
	CGColorSpaceRelease(gray);
	return color;
}

CGColorRef CreateDeviceRGBColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a)
{
	CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
	CGFloat comps[] = {r, g, b, a};
	CGColorRef color = CGColorCreate(rgb, comps);
	CGColorSpaceRelease(rgb);
	return color;
}

CGColorRef graphBackgroundColor(void)
{
	static CGColorRef c = NULL;
	if(c == NULL)
	{
		c = CreateDeviceGrayColor(0.6, 1.0);
	}
	return c;
}

#pragma mark - copied from GeekGameBoard QuartzUtils.m

static void drawPatternImage (void *info, CGContextRef ctx)
{
    CGImageRef image = (CGImageRef) info;
    CGContextDrawImage(ctx, 
                       CGRectMake(0,0, CGImageGetWidth(image),CGImageGetHeight(image)),
                       image);
}

// callback for CreateImagePattern.
static void releasePatternImage( void *info )
{
    CGImageRelease( (CGImageRef)info );
}

CGColorRef CreatePatternColor( CGImageRef image )
{
    CGPatternRef pattern = CreateImagePattern(image);
    CGColorSpaceRef space = CGColorSpaceCreatePattern(NULL);
    CGFloat components[1] = {1.0};
    CGColorRef color = CGColorCreateWithPattern(space, pattern, components);
    CGColorSpaceRelease(space);
    CGPatternRelease(pattern);
    return color;
}

CGPatternRef CreateImagePattern( CGImageRef image )
{
//    NSCParameterAssert(image);
    unsigned long width = CGImageGetWidth(image);
    unsigned long height = CGImageGetHeight(image);
    static const CGPatternCallbacks callbacks = {0, &drawPatternImage, &releasePatternImage};
    return CGPatternCreate (image,
                            CGRectMake (0, 0, width, height),
                            CGAffineTransformMake (1, 0, 0, 1, 0, 0),
                            width,
                            height,
                            kCGPatternTilingConstantSpacing,
                            true,
                            &callbacks);
}

CGRect CGRectAspectSizeInSize(CGSize sourceSize, CGSize destinationSize, bool fill)
{
    CGRect scaledImageRect = CGRectZero;
    
    CGFloat aspectWidth = destinationSize.width / sourceSize.width;
    CGFloat aspectHeight = destinationSize.height / sourceSize.height;
    CGFloat aspectRatio;
    if (fill)
    {
        aspectRatio = MAX( aspectWidth, aspectHeight );
    }
    else
    {
        aspectRatio = MIN( aspectWidth, aspectHeight );
    }
    
    scaledImageRect.size.width = sourceSize.width * aspectRatio;
    scaledImageRect.size.height = sourceSize.height * aspectRatio;
    scaledImageRect.origin.x = (destinationSize.width - scaledImageRect.size.width) / 2.0f;
    scaledImageRect.origin.y = (destinationSize.height - scaledImageRect.size.height) / 2.0f;
    
    return scaledImageRect;
}



//CGColorRef GetCGPatternFromUIImage( UIImage *uImage )         // can be resource name or abs. path
//{
//    
//    CGColorRef pattern = CreatePatternColor( uImage.CGImage );
//    return pattern;
//}

