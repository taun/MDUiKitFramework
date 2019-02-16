//
//  MDBResizingWidthFlowLayoutDelegate.h
//  FractalScapes
//
//  Created by Taun Chapman on 12/10/16.
//  Copyright © 2016 MOEDAE LLC. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface MDBResizingWidthFlowLayoutDelegate : NSObject <UICollectionViewDelegateFlowLayout>

+(void)invalidateFlowLayoutFlowLayoutDelegateMetricsForLayout:(UICollectionViewFlowLayout *)collectionViewLayout;
+(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath withBaseSize: (CGSize)baseSize;

@end
