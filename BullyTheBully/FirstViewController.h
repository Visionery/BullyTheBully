//
//  FirstViewController.h
//  BullyTheBully
//
//  Created by Kris Parmakov on 10/19/13.
//  Copyright (c) 2013 Kris Parmakov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface FirstViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
