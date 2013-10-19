//
//  WallLayout.m
//  BullyTheBully
//
//  Created by Atanas Bahchevanov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import "WallLayout.h"

@implementation WallLayout

- (id)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.itemSize = CGSizeMake(285, 160);
        self.sectionInset = UIEdgeInsetsMake(85.0, 0.0, 70.0, 0.0);
    }
    return self;
}

@end
