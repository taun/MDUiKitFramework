//
//  MDKFluidTextView.h
//  FractalScapes
//
//  Created by Taun Chapman on 07/29/15.
//  Copyright (c) 2015 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


/*!
 FluidTextView let's you fix either the width or height and derives the other dimension based on the contents. 
 This allows you to embed the FluidTextView with other views in a scrollView and not have to scroll the textView
 within the scrollView. This is particularly useful with adaptive layouts where you always want all of the text showing.
 */
@interface MDKFluidTextView : UITextView

/*!
 Changing one to YES makes the other NO.
 If both are NO, the FluidTextView acts as a standard UITextView
 */
@property (nonatomic,assign) IBInspectable BOOL       fluidHeight;
/*!
 Changing one to YES makes the other NO.
 If both are NO, the FluidTextView acts as a standard UITextView
 */
@property (nonatomic,assign) IBInspectable BOOL       fluidWidth;

@end
