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

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{    
    return YES;
}

//-(void) invalidateLayout {
//    [super invalidateLayout];
//}

//-(void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context{
//    CGSize newSize = [self newSizeForBounds: self.collectionView.bounds];
//    self.itemSize = newSize;
//}

-(UICollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds
{
    UICollectionViewFlowLayoutInvalidationContext* context = (UICollectionViewFlowLayoutInvalidationContext*)[super invalidationContextForBoundsChange:newBounds];
    [self newSizeForBounds: newBounds];
    context.invalidateFlowLayoutAttributes = YES;
    context.contentSizeAdjustment = [self newSizeAdjustment];
    return context;
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

-(void)newSizeForBounds: (CGRect)bounds
{
    int minWidth = 150;
    int viewWidth = (int)bounds.size.width;
    
    int totalRemainderSpace = viewWidth % minWidth;
    int totalItems = viewWidth / minWidth;
    
    int itemMarginTotal = (totalItems - 1) * (int)self.minimumInteritemSpacing;
    int extraSpace = totalRemainderSpace - itemMarginTotal;
    
    int width = MAX(minWidth, minWidth + (extraSpace / totalItems) - (int)(self.sectionInset.left + self.sectionInset.right));
    
    CGSize newSize = CGSizeMake(width, self.itemSize.height);
    
    NSLog(@"Width %@", NSStringFromCGSize(newSize));
    
    self.itemSize = newSize;
}

-(CGSize)newSizeAdjustment
{
    int minWidth = 150;
    
    CGSize newSizeAdjustment = CGSizeMake(self.itemSize.width - minWidth, 50);
    
//    NSLog(@"Width %@", NSStringFromCGSize(newSize));
    
    return newSizeAdjustment;
}

@end
