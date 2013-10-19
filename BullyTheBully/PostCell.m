//
//  PostCell.m
//  BullyTheBully
//
//  Created by Atanas Bahchevanov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

@synthesize title;
@synthesize description;
@synthesize coverPhoto;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, frame.size.width - 20, 25)];
        [self.title setFont:[UIFont systemFontOfSize:21.0]];
        [self.title setTextColor:[UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00]];
        [self addSubview:self.title];
        
        self.description = [[UITextView alloc] initWithFrame:CGRectMake(10, 45, frame.size.width - 20, frame.size.height - 55)];
        [self.description setFont:[UIFont systemFontOfSize:16.0]];
        [self.description setTextColor:[UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00]];
        [self.description setUserInteractionEnabled:NO];
        [self addSubview:self.description];
//       
//        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
//        [self addSubview:self.icon];
//        
        
    }
    return self;
}

- (void)loadWithDict:(NSDictionary*)info
{
    [self.title setText:[info objectForKey:@"title"]];
    [self.title setHidden:NO];
    [self.description setText:[info objectForKey:@"description"]];
    [self.description setHidden:NO];
    
}

        
//    }
//    return self;
//}

@end
