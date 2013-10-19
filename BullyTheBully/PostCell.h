//
//  PostCell.h
//  BullyTheBully
//
//  Created by Atanas Bahchevanov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UITextView *description;
@property (nonatomic, strong) UILabel *commentsLabel;
@property (nonatomic, strong) UIImageView *coverPhoto;

- (void)loadWithDict:(NSDictionary*)info;

@end
