//
//  MDBResizingWidthFlowLayoutDelegate.m
//  FractalScapes
//
//  Created by Taun Chapman on 12/10/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

#import "MDBResizingWidthFlowLayoutDelegate.h"

@implementation MDBResizingWidthFlowLayoutDelegate

+(void)invalidateFlowLayoutFlowLayoutDelegateMetricsForLayout:(UICollectionViewFlowLayout *)collectionViewLayout
{
    UICollectionViewFlowLayoutInvalidationContext* validationContext = [UICollectionViewFlowLayoutInvalidationContext new];
    validationContext.invalidateFlowLayoutDelegateMetrics = YES;
    validationContext.invalidateFlowLayoutAttributes = YES;
    
//    NSLog(@"%s %@ everything: %i, indexPaths: %@, layoutAttributes: %i, delegateMetrics: %i", __PRETTY_FUNCTION__, validationContext, validationContext.invalidateEverything,
//          validationContext.invalidatedItemIndexPaths,
//          validationContext.invalidateFlowLayoutAttributes,
//          validationContext.invalidateFlowLayoutDelegateMetrics);

    [collectionViewLayout invalidateLayoutWithContext: validationContext];
}

+(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath withBaseSize:(CGSize)baseSize
{
    int minWidth = baseSize.width;
    int minHeight = baseSize.height;
    
    // Should have a test for layout type
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)collectionViewLayout;
    
    CGRect bounds = collectionView.bounds;
    
    int margins = (int)(layout.sectionInset.left + layout.sectionInset.right);
    
    int collectionWidth = (int)bounds.size.width - margins;
    
    int totalItems = (collectionWidth + (int)layout.minimumInteritemSpacing) / (minWidth + (int)layout.minimumInteritemSpacing);
    
    int largeWidth = (collectionWidth - (totalItems * (int)layout.minimumInteritemSpacing)) / totalItems;
    
    int width = MAX(minWidth, largeWidth);
    
    int newHeight = minHeight;
    
    if (width > (minWidth + 23))
    {
        newHeight = minHeight + 24; // at least one character line extra. Should check font size but can't really, ... not in cell layout class.
    }
    
    CGSize newSize = CGSizeMake(width, newHeight);
    
    //NSLog(@"Class %@ Bounds: %@ Size: %@", NSStringFromClass([self class]),NSStringFromCGRect(bounds), NSStringFromCGSize(newSize));
    
    return newSize;
}

@end
