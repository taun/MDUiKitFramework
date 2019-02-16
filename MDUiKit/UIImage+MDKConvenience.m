//
//  UIImage+MDKConvenience.m
//  Daisy Sensor
//
//  Created by Taun Chapman on 12/17/15.
//  Copyright © 2015 MOEDAE LLC. All rights reserved.
//

#import "UIImage+MDKConvenience.h"
#import "QuartzHelpers.h"
@import UIKit;


@implementation UIImage (MDKConvenience)

-(UIImage *)imageAspectFitInSize:(CGSize)sizeToFit opaque: (BOOL)isOpaque
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sizeToFit.width, sizeToFit.height), isOpaque, 0.0f);
    
    [self drawInRect: CGRectAspectSizeInSize(self.size, sizeToFit, true)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

@end
