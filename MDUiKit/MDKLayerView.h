//
//  MDKLayerView.h
//  MDUiKit
//
//  Created by Taun Chapman on 09/24/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE


/*!
 UIView subclass which exposes the layer properties to Interface Builder for designing a theme.
 In particular used to give views a border with round corners.
 */
@interface MDKLayerView : UIView
@property (nonatomic,assign) IBInspectable BOOL           maskToBounds;
@property (nonatomic,assign) IBInspectable CGFloat        margin;
@property (nonatomic,assign) IBInspectable CGFloat        cornerRadius;
@property (nonatomic,assign) IBInspectable CGFloat        borderWidth;
@property (nonatomic,strong) IBInspectable UIColor*       borderColor;
@property (nonatomic,assign) IBInspectable CGPoint        shadowOffset;
@property (nonatomic,assign) IBInspectable UIColor*       shadowColor;
@property (nonatomic,assign) IBInspectable CGFloat        shadowOpacity;
@property (nonatomic,assign) IBInspectable CGFloat        shadowRadius;
@end
