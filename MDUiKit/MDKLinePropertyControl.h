//
//  MDKLinePropertyControl.h
//  MDUiKit
//
//  Created by Taun Chapman on 11/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@import QuartzCore;

IB_DESIGNABLE

/*!
 Unused?
 
 Was intended for fractalScapes control to specify the turtle line.
 */
@interface MDKLinePropertyControl : UIControl

@property (nonatomic,assign) IBInspectable float          minLengthValue;
@property (nonatomic,assign) IBInspectable float          maxLengthValue;
@property (nonatomic,assign) IBInspectable float          stepLengthValue;

@property (nonatomic,assign) IBInspectable float          minHeightValue;
@property (nonatomic,assign) IBInspectable float          maxHeightValue;
@property (nonatomic,assign) IBInspectable float          stepHeightValue;

@property (nonatomic,assign) IBInspectable float          minAngleValue;
@property (nonatomic,assign) IBInspectable float          maxAngleValue;
@property (nonatomic,assign) IBInspectable float          stepAngleValue;

@end
