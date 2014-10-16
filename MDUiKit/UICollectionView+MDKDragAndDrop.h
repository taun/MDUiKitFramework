//
//  UICollectionView+MDKDragAndDrop.h
//  MDUiKit
//
//  Created by Taun Chapman on 10/15/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 Category to add extra drag and drop convenience methods.
 */
@interface UICollectionView (MDKDragAndDrop)

/*!
 The standard indexPathForRow: only returns an indexPath if the point is over a cell. This leaves out cases where the point
 is in between cells or at the end of a row of cells. This method includes those cases. It the insertion point is in the space
 at the end of the row, then the returned indexPath.row is one more than the items count and the underlying data source
 needs to have an additional item added before updating the collection. If the point is between items, then the index returned 
 is of the item to the right of the point so that item gets moved for the insertion of a new item. This method uses indexPathForRow: 
 and just returns that indexPath if there is one. 
 
 @param section the relevant collection section to search.
 @param point   a CGPoint in the collection coordinate space.
 
 @return an indexPath which may have a row one past the end if the point is at the end.
 */
-(NSIndexPath*) indexPathForDropInSection: (NSInteger) section atPoint:(CGPoint)point;

@end
