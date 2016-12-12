//
//  MDKUICollectionViewFlowLayoutDebug.m
//  MDUiKit
//
//  Created by Taun Chapman on 10/06/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MDKUICollectionViewFlowLayoutDebug.h"

@implementation MDKUICollectionViewFlowLayoutDebug

//-(void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems
//{
////    [self updateEdgeInsets];
//    
//    [super prepareForCollectionViewUpdates:updateItems];
//}

//-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{    
//    BOOL invalidate = [super shouldInvalidateLayoutForBoundsChange:newBounds];
////    NSLog(@"%s returns: %i", __PRETTY_FUNCTION__, invalidate);
//    return invalidate;
//}

//-(void) invalidateLayout {
//    [super invalidateLayout];
//}

//-(void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context{
//    CGSize newSize = [self newSizeForBounds: self.collectionView.bounds];
//    self.itemSize = newSize;
//}

/*!
  With FlowLayout, invalidation for bounds change is only YES when the
  direction orthogonal to the scroll direction is changed.
 */
-(UICollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds
{
    UICollectionViewFlowLayoutInvalidationContext* validationContext = (UICollectionViewFlowLayoutInvalidationContext*)[super invalidationContextForBoundsChange:newBounds];
//    NSLog(@"%s bounds: %@, %@ everything: %i, indexPaths: %@, layoutAttributes: %i, delegateMetrics: %i", __PRETTY_FUNCTION__, NSStringFromCGRect(newBounds), validationContext, validationContext.invalidateEverything,
//          validationContext.invalidatedItemIndexPaths,
//          validationContext.invalidateFlowLayoutAttributes,
//          validationContext.invalidateFlowLayoutDelegateMetrics);
    
    validationContext.invalidateFlowLayoutAttributes = YES;
    validationContext.invalidateFlowLayoutDelegateMetrics = YES; // make sure the delegate sizing method gets called

    return validationContext;
}

//-(BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
//{
//    BOOL subResponse = [super shouldInvalidateLayoutForPreferredLayoutAttributes:preferredAttributes withOriginalAttributes:originalAttributes];
//    NSLog(@"%s %i", __PRETTY_FUNCTION__, subResponse);
//    
//    return YES;
//}

//-(UICollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
//{
//    UICollectionViewFlowLayoutInvalidationContext* context = (UICollectionViewFlowLayoutInvalidationContext*)[super invalidationContextForPreferredLayoutAttributes:preferredAttributes withOriginalAttributes:originalAttributes];
//    context.contentSizeAdjustment = [self newSizeAdjustment];
//    
//    return context;
//}

//-(void)newSizeForBounds: (CGRect)bounds
//{
//    int minWidth = 150;
//    int viewWidth = (int)bounds.size.width;
//    
//    int totalRemainderSpace = viewWidth % minWidth;
//    int totalItems = viewWidth / minWidth;
//    
//    int itemMarginTotal = (totalItems - 1) * (int)self.minimumInteritemSpacing;
//    int extraSpace = totalRemainderSpace - itemMarginTotal;
//    
//    int width = MAX(minWidth, minWidth + (extraSpace / totalItems) - (int)(self.sectionInset.left + self.sectionInset.right));
//    
//    CGSize newSize = CGSizeMake(width, self.itemSize.height);
//    
//    NSLog(@"Width %@", NSStringFromCGSize(newSize));
//    
//    self.itemSize = newSize;
//}

//-(CGSize)newSizeAdjustment
//{
//    int minWidth = 150;
//    
//    CGSize newSizeAdjustment = CGSizeMake(self.itemSize.width - minWidth, 50);
//    
////    NSLog(@"Width %@", NSStringFromCGSize(newSize));
//    
//    return newSizeAdjustment;
//}

@end
