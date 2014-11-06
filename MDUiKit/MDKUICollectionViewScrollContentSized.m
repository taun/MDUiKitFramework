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

-(NSInteger) numberOfItems {
    NSInteger items = [self numberOfItemsInSection: 0];
    return items;
}

-(void) awakeFromNib {
    [super awakeFromNib];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    //    self.scrollEnabled = NO;
    self.currentHeightConstraint.constant = 44.0;
}
-(void) initialConstraints {
    
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
        // 999 vs 1000 makes no difference in end result.
        _currentHeightConstraint.priority = 999;

        [self addConstraint: _currentHeightConstraint];
    }
    return _currentHeightConstraint;
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
