//#############################################################
//
//  ChildCollectionViewController.h
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "Company.h"
#import "Product.h"
#import "MySingleton.h"

@interface ChildCollectionViewController : UICollectionViewController <UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

@property (nonatomic, retain) Company *company;
@property (nonatomic, strong) NSMutableArray *urlList;
@property (nonatomic, strong) NSString *productList;
@property (nonatomic, strong) NSString *productURL;
@property (nonatomic, strong) NSString *productName;

@property (nonatomic, retain) WebViewController *webViewController;


@property (nonatomic, strong) NSString *deleteProduct;
@property (nonatomic, weak) IBOutlet UICollectionView *gesture;

@end
