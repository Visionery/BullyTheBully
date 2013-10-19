//
//  VoteCell.h
//  BullyTheBully
//
//  Created by Atanas Bahchevanov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoteCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *SchoolClass;
@property (nonatomic, strong) UILabel *CountHugs;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIImageView *AddVote;
@property (nonatomic, strong) UIImageView *peopleIcon;
- (void)loadWithDict:(NSDictionary*)info;

@end
