//#############################################################
//
//  ParentCollectionViewController.m
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import "ParentCollectionViewController.h"
#import "ChildCollectionViewController.h"

@interface ParentCollectionViewController ()

@end

@implementation ParentCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Preserves selection between presentations
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Registers cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    self.dao = [MySingleton sharedInstance];
    self.companyList = self.dao.companyList;
    self.title = @"Mobile Device Makers";
    
    [[MySingleton sharedInstance] saveData];

    // Configures layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    [flowLayout setItemSize:CGSizeMake(200, 200)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.companyList count];
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 275, 10, 20);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Sets up cell identifier
    static NSString *cellIdentifier = @"cvCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *companyImage = (UIImageView *)[cell viewWithTag:100];
    companyImage.image = [UIImage imageNamed:[self.companyList[indexPath.row] logo]];
    
    return cell;
}

     
#pragma mark <UICollectionViewDelegate>


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath; {
    
    // Configures layout.
    self.childVC = [[ChildCollectionViewController alloc]initWithNibName:@"ChildCollectionViewController" bundle:nil];
    
    self.childVC.company = self.companyList[indexPath.row];
    self.childVC.title = self.childVC.company.name;
    
    //[self.childVC.collectionView reloadData];
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController pushViewController:self.childVC
                                         animated:YES];
    
}

@end
