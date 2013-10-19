//
//  VoteCell.m
//  BullyTheBully
//
//  Created by Atanas Bahchevanov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import "VoteCell.h"


@implementation VoteCell

@synthesize name;
@synthesize SchoolClass;
@synthesize CountHugs;
@synthesize icon;
@synthesize AddVote;
@synthesize peopleIcon;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(60, 22, frame.size.width - 70, 33)];
        [self.name setFont:[UIFont systemFontOfSize:28.0]];
        [self.name setTextColor:[UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00]];
        [self addSubview:self.name];
        
        self.SchoolClass = [[UILabel alloc] initWithFrame:CGRectMake(60, 55, (frame.size.width - 70) / 2, 25)];
        [self.SchoolClass setFont:[UIFont systemFontOfSize:21.0]];
        [self.SchoolClass setTextColor:[UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00]];
        [self addSubview:self.SchoolClass];
    
        self.CountHugs = [[UILabel alloc] initWithFrame:CGRectMake(100 + (frame.size.width - 70) / 2, 55, (frame.size.width - 70) / 2, 25)];
        [self.CountHugs setFont:[UIFont systemFontOfSize:21.0]];
        [self.CountHugs setTextColor:[UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00]];
        [self addSubview:self.CountHugs];
        
        self.peopleIcon = [[UIImageView alloc] initWithFrame:CGRectMake(70 + (frame.size.width - 70) / 2, 60, 25, 15)];
        [self.peopleIcon setImage:[UIImage imageNamed:@"public"]];
        [self addSubview:self.peopleIcon];
    
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        [self addSubview:self.icon];

    
        self.AddVote = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 285.0, 100.0)];
        [self.AddVote setUserInteractionEnabled:YES];
        [self.AddVote setHidden:YES];
        [self.AddVote setImage:[UIImage imageNamed:@"add_vote"]];
        [self addSubview:self.AddVote];
        
    }
    return self;
}

- (void)loadWithDict:(NSDictionary*)info
{
    [self.name setText:[info objectForKey:@"name"]];
    [self.name setHidden:NO];
    [self.SchoolClass setText:[info objectForKey:@"schoolClass"]];
    [self.SchoolClass setHidden:NO];
    [self.CountHugs setText:[info objectForKey:@"hugsCount"]];
    [self.CountHugs setHidden:NO];
    [self.icon setImage:[UIImage imageNamed:[info objectForKey:@"iconName"]]];
    [self.icon setHidden:NO];
    [self.peopleIcon setHidden:NO];
    [self.AddVote setHidden:YES];
}

@end
