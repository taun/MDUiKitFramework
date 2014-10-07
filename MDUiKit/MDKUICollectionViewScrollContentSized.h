//
//  MDKUICollectionViewScrollContentSized.h
//  MDUiKit
//
//  Created by Taun Chapman on 10/02/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 Subclass to make UICollectionView show the full contentView when embedded in another views scrollview.
 The initial example was embedding a collectionView in a tableView row. The tableView already has a scrollView
 and we don't want to have to scroll the collectionView within the row of the tableView. We want the collectionView
 to be large enough to show the full contents without needing to scroll the collectionView scrollView.
 This is done by overriding the updateConstraints to set the collectionView height to the contentView height.
 */
@interface MDKUICollectionViewScrollContentSized : UICollectionView

@property (nonatomic,strong) NSLayoutConstraint* currentHeightConstraint;

@end
