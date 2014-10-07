//
//  MDKUITableViewDynamicRowHeights.m
//  MDUiKit
//
//  Created by Taun Chapman on 10/06/14.
//  Copyright (c) 2014 MOEDAE LLC. All rights reserved.
//

#import "MDKUITableViewDynamicRowHeights.h"

@implementation MDKUITableViewDynamicRowHeights

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) awakeFromNib {
    [super awakeFromNib];
    self.rowHeight = UITableViewAutomaticDimension;
}

@end
