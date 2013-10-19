//
//  SecondViewController.m
//  BullyTheBully
//
//  Created by Kris Parmakov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import "SecondViewController.h"
#import "WallLayout.h"
#import "PostCell.h"

@interface SecondViewController ()
{
    NSMutableArray *_wallInfo;
}
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.collectionViewWall setCollectionViewLayout:[[WallLayout alloc] init]];
    [self.collectionViewWall setDataSource:self];
    [self.collectionViewWall setDelegate:self];
    [self.collectionViewWall registerClass:[PostCell class] forCellWithReuseIdentifier:@"PostCell"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Wall"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error){
        if (error) {
            NSLog(@"Error");
        } else {
            _wallInfo = [NSMutableArray arrayWithArray:array];
            [self.collectionViewWall reloadData];
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_wallInfo.count == 0) {
        return 0;
    }
    return _wallInfo.count + 1;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.layer.borderWidth = 0.5f;
    cell.layer.borderColor = [UIColor colorWithRed:0.74 green:0.47 blue:0.80 alpha:1.00].CGColor;
    
    if (indexPath.row == 0)
    {
        [((PostCell*)cell).title setHidden:YES];
        [((PostCell*)cell).description setHidden:YES];
    }
    else
    {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[_wallInfo[indexPath.row - 1] objectForKey:@"title"], @"title", [_wallInfo[indexPath.row - 1] objectForKey:@"description"], @"description", nil];
        [cell loadWithDict:dict];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return CGSizeMake(265, 100.0);
    }
    else {
        CGSize size = [[_wallInfo[indexPath.row - 1] objectForKey:@"description"] sizeWithFont:[UIFont systemFontOfSize:16.0]
                                                                         constrainedToSize:CGSizeMake(265.0, 100000.0)];
        return CGSizeMake(265, size.height + 45.0);
    }
    
}

@end
