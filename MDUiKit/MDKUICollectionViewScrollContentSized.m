//
//  MDKUICollectionViewScrollContentSized.m
//  MDUiKit
//
//  Created by Taun Chapman on 10/02/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MDKUICollectionViewScrollContentSized.h"

@interface MDKUICollectionViewScrollContentSized ()


@end

@implementation MDKUICollectionViewScrollContentSized

-(void) awakeFromNib {
    [super awakeFromNib];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    //    self.scrollEnabled = NO;
    
    [self configureConstraints];
}
<<<<<<< HEAD
-(void) configureConstraints {
    CGFloat currentHeight = self.bounds.size.height;
    _currentHeightConstraint = [NSLayoutConstraint constraintWithItem: self
                                                            attribute: NSLayoutAttributeHeight
                                                            relatedBy: NSLayoutRelationEqual
                                                               toItem: nil
                                                            attribute: NSLayoutAttributeNotAnAttribute
                                                           multiplier: 1.0
                                                             constant: currentHeight];
    // Priority 999 seems necessary to stop autolayout constraint conflicts between desired height and UIView-Encapsulated-Layout-Height set by table class.
    _currentHeightConstraint.priority = 999;
    
    [self addConstraint: _currentHeightConstraint];
=======
#pragma message "Can we just use setNeedsUpdateConstraints here then check at the delegate level? Reload cell if needsUpdate..."
-(BOOL) nextItemWillWrapLine {
    BOOL willWrap = NO;
    
    CGFloat cellWidth = self.bounds.size.width;
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
    NSInteger itemsPerLine = (cellWidth / (layout.itemSize.width+layout.minimumInteritemSpacing));
    NSInteger items = [self numberOfItemsInSection: 0];
    CGFloat remainder = fmodf(items, itemsPerLine);
    if (remainder == 0.0) {
        // flag to relayout collection with additional row
        willWrap = YES;
    }
    
    return willWrap;
}
-(BOOL) willScrollVertically {

    CGFloat boundsHeight = self.bounds.size.height;
    CGFloat contentHeight = self.contentSize.height;
    
    return (boundsHeight > 0 && boundsHeight < contentHeight);
}
-(NSLayoutConstraint*) currentHeightConstraint {
    if (!_currentHeightConstraint) {
        _currentHeightConstraint = [NSLayoutConstraint constraintWithItem: self
                                                                attribute: NSLayoutAttributeHeight
                                                                relatedBy: NSLayoutRelationEqual
                                                                   toItem: nil
                                                                attribute: NSLayoutAttributeNotAnAttribute
                                                               multiplier: 1.0
                                                                 constant: 26.0];
        // Priority 999 seems necessary to stop autolayout constraint conflicts between desired height and UIView-Encapsulated-Layout-Height set by table class.
        _currentHeightConstraint.priority = 999.0;

        [self addConstraint: _currentHeightConstraint];
    }
    return _currentHeightConstraint;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat frameHeight = self.frame.size.height;
    
    if (self.contentSize.height != self.currentHeightConstraint.constant) {
        [self setNeedsUpdateConstraints];
    }
    if (self.contentSize.height != frameHeight) {
        // update superview
        [self.superview.superview setNeedsLayout];
    }
>>>>>>> DetachedHeadDial
}
//-(CGSize)sizeThatFits:(CGSize)size {
//    CGSize bestSize = CGSizeMake(size.width, self.contentSize.height);
//    return bestSize;
//}
//-(void)layoutSubviews {
//    [super layoutSubviews];
//    CGPoint origin = self.frame.origin;
//    CGSize size = self.frame.size;
//    
//    if (self.contentSize.height != self.currentHeightConstraint.constant) {
//        [self setNeedsUpdateConstraints];
//    }
//    if (self.contentSize.height != size.height) {
//        // update superview
////        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.contentSize.height);
//        // [self.superview setNeedsLayout];
//    }
//    [super layoutSubviews];
//}

-(void)updateConstraints {
    
//    CGFloat newHeight = self.contentSize.height;
//    
//    BOOL test = newHeight > 140.0;
//    
//    if (newHeight == 0) {
//        self.currentHeightConstraint.constant = 26.0;
//    } else {
//        self.currentHeightConstraint.constant = newHeight;
//    }
    // change constraints above
    [super updateConstraints];
//    [self.superview.superview.superview.superview setNeedsLayout];
//    NSString* constraintsString = [self.constraints description];
}
//-(CGSize) intrinsicContentSize {
//    CGFloat height = self.contentSize.height;
//    CGSize newSize = CGSizeMake(UIViewNoIntrinsicMetric, height);
//    return newSize;
//}

//-(void) viewFrameChanged:(UIView *)view {
//    [self invalidateIntrinsicContentSize];
//}
@end
