//
//  FirstViewController.m
//  BullyTheBully
//
//  Created by Kris Parmakov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import "FirstViewController.h"
#import "VoteCell.h"
#import "VoteLayout.h"
@interface FirstViewController ()
{
    NSMutableArray *_votesInfo;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.collectionView setCollectionViewLayout:[[VoteLayout alloc] init]];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView registerClass:[VoteCell class] forCellWithReuseIdentifier:@"VoteCell"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Vote"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error){
        if (error) {
            NSLog(@"Error");
        } else {
            _votesInfo = [self sortArray:array];
            [self.collectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_votesInfo.count == 0) {
        return 0;
    }
    return _votesInfo.count + 1;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VoteCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.layer.borderWidth = 0.5f;
    cell.layer.borderColor = [UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00].CGColor;
    
    if (indexPath.row == _votesInfo.count)
    {
        [((VoteCell*)cell).AddVote setHidden:NO];
        [((VoteCell*)cell).name setHidden:YES];
        [((VoteCell*)cell).SchoolClass setHidden:YES];
        [((VoteCell*)cell).CountHugs setHidden:YES];
        [((VoteCell*)cell).icon setHidden:YES];
        [((VoteCell*)cell).peopleIcon setHidden:YES];
    }
    else
    {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[_votesInfo[indexPath.row] objectForKey:@"description"], @"name", [_votesInfo[indexPath.row] objectForKey:@"schoolClass"], @"schoolClass", [_votesInfo[indexPath.row] objectForKey:@"hugsCount"], @"hugsCount", [_votesInfo[indexPath.row] objectForKey:@"iconName"], @"iconName", nil];
        [cell loadWithDict:dict];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _votesInfo.count)
    {
        NSLog(@"Opps");
    }
    else
    {
        PFObject *vote = [PFObject objectWithoutDataWithClassName:@"Vote" objectId:((PFObject*)_votesInfo[indexPath.row]).objectId];
        [vote setObject:[NSString stringWithFormat:@"%d",[[_votesInfo[indexPath.row] objectForKey:@"hugsCount"] integerValue] + 1] forKey:@"hugsCount"];
        [vote save];
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"Vote"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error){
        if (error) {
            NSLog(@"Error");
        } else {
            _votesInfo = [self sortArray:array];
            [self.collectionView reloadData];
        }
    }];
}

-(NSMutableArray*)sortArray:(NSArray*)source
{
    NSArray *sortedArray;
    sortedArray = [source sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        int first = [[(NSDictionary*)a objectForKey:@"hugsCount"] integerValue];
        int second = [[(NSDictionary*)b objectForKey:@"hugsCount"] integerValue];
        if (first > second) {
            return NSOrderedAscending;
        } else if (first < second) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    return [NSMutableArray arrayWithArray:sortedArray];
}

@end
