//
//  MDKUITableViewDynamicRowHeights.h
//  MDUiKit
//
//  Created by Taun Chapman on 10/06/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//


@import Foundation;
@import UIKit;


/*!
 Class to override cell heights declared in interface builder with UITableViewAutomaticDimension.
 This is to allow autolayout to work but also let IB show a large or small enough cell.
 */
@interface MDKUITableViewDynamicRowHeights : UITableView

@end
