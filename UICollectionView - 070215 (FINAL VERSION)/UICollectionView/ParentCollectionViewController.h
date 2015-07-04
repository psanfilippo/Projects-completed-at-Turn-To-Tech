//#############################################################
//
//  ParentCollectionViewController.h
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <UIKit/UIKit.h>
#import "Company.h"
#import "Product.h"
#import "MySingleton.h"

@class ChildCollectionViewController;

@interface ParentCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, strong) NSString *productURL;
@property (nonatomic, strong) UINib *cellNib;

@property (nonatomic, retain) ChildCollectionViewController *childVC;
@property (nonatomic, retain) MySingleton *dao;

@property (nonatomic, retain) NSMutableArray *appleDevices;
@property (nonatomic, retain) NSMutableArray *samsungDevices;
@property (nonatomic, retain) NSMutableArray *nokiaDevices;
@property (nonatomic, retain) NSMutableArray *motorolaDevices;

@end
