//
//  UICollectionView+MDKDragAndDrop.m
//  MDUiKit
//
//  Created by Taun Chapman on 10/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "UICollectionView+MDKDragAndDrop.h"

@implementation UICollectionView (MDKDragAndDrop)

-(NSIndexPath*) indexPathForDropInSection: (NSInteger) section atPoint:(CGPoint)point {
    NSIndexPath* indexPath = [self indexPathForItemAtPoint: point];

    if (indexPath == nil) {
        // not over a cell, at the end?
        NSInteger lastCellRow = [self numberOfItemsInSection: section] - 1;
        NSIndexPath* lastItemIndexPath = [NSIndexPath indexPathForRow: lastCellRow inSection: section];
        NSIndexPath* lastItemPlusOneIndexPath = [NSIndexPath indexPathForRow: lastCellRow+1 inSection: section];

        NSInteger itemSpacing = 0;
        UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
        if ([layout isKindOfClass:[UICollectionViewFlowLayout class]]) {
            itemSpacing = layout.minimumInteritemSpacing;
        }
        
        UICollectionViewLayoutAttributes* lastItemAttrs = [self layoutAttributesForItemAtIndexPath: lastItemIndexPath];
        CGRect lastItemFrame = lastItemAttrs.frame;
        CGFloat cellRightX = lastItemFrame.origin.x + lastItemFrame.size.width;
        CGFloat cellTopY = lastItemFrame.origin.y;
        CGFloat collRightX = self.bounds.origin.x + self.bounds.size.width;
        CGFloat collBottomY = self.bounds.origin.y + self.bounds.size.height;
        CGRect lastSpaceRect = CGRectMake(cellRightX, cellTopY, collRightX-cellRightX, collBottomY-cellTopY);
        
        if (CGRectContainsPoint(lastSpaceRect, point)) {
            indexPath = lastItemPlusOneIndexPath;
        }
    }
    return indexPath;
}

@end
