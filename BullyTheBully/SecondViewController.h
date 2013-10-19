//
//  SecondViewController.h
//  BullyTheBully
//
//  Created by Kris Parmakov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface SecondViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewWall;

@end
