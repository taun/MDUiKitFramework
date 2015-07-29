//
//  MDKFluidTextView.m
//  FractalScapes
//
//  Created by Taun Chapman on 07/29/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import "MDKFluidTextView.h"

@implementation MDKFluidTextView

-(void)setFluidHeight:(BOOL)fluidHeight
{
    _fluidHeight = fluidHeight;
    if (fluidHeight && fluidHeight != _fluidHeight)
    {
        self.textContainer.widthTracksTextView = YES;
        self.textContainer.heightTracksTextView = YES;
        self.fluidWidth = NO;
    }
    else
    {
        self.textContainer.heightTracksTextView = NO;
    }
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

-(void)setFluidWidth:(BOOL)fluidWidth
{
    _fluidWidth = fluidWidth;
    if (fluidWidth && fluidWidth != _fluidWidth)
    {
        self.textContainer.widthTracksTextView = YES;
        self.textContainer.heightTracksTextView = YES;
        self.fluidHeight = NO;
    }
    else
    {
        self.textContainer.widthTracksTextView = NO;
    }
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

-(void)layoutIfNeeded
{
    [super layoutIfNeeded];
}

-(void)updateConstraints
{
    [super updateConstraints];
}
-(CGSize) intrinsicContentSize {
    [self layoutIfNeeded];
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat heightText = self.contentSize.height;
    CGFloat widthText = self.contentSize.width;
    CGFloat heightCont = self.textContainer.size.height;
    CGFloat widthCont = self.textContainer.size.width;
    
    
    CGSize newSize;
    if (self.fluidHeight)
    {
        newSize = CGSizeMake(UIViewNoIntrinsicMetric, widthText + 8.0);
    }
    else if (self.fluidWidth)
    {
        newSize = CGSizeMake(heightText, UIViewNoIntrinsicMetric);
    }
    else
    {
        newSize = CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
    }
    return newSize;
}

//-(void) viewFrameChanged:(UIView *)view {
//    if (self.fluidWidth || self.fluidHeight)
//    {
//        [self invalidateIntrinsicContentSize];
//        [self setNeedsLayout];
//    }
//}

@end
