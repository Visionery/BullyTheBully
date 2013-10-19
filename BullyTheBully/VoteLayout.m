//
//  VoteLayout.m
//  BullyTheBully
//
//  Created by Atanas Bahchevanov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import "VoteLayout.h"

@implementation VoteLayout

- (id)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.itemSize = CGSizeMake(285, 100);
        self.sectionInset = UIEdgeInsetsMake(20.0, 0.0, 156.0, 0.0);
    }
    return self;
}

@end
