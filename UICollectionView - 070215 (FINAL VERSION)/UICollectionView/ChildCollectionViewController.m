//#############################################################
//
//  ChildCollectionViewController.m
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import "ChildCollectionViewController.h"
#import "ParentCollectionViewController.h"
#import "MySingleton.h"


@interface ChildCollectionViewController ()

@end

@implementation ChildCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(200, 200)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewLayout = flowLayout;
    
    // Preserves selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Registers cell classes.
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cvCell"];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
       initWithTarget:self action:@selector(longPressCellToDelete:)];
    lpgr.minimumPressDuration = 0.75; //time in seconds to hold gesture
    lpgr.delegate = self;
    [self.collectionView addGestureRecognizer:lpgr];
    
}

    // Reloads data in view
-(void)viewWillAppear:(BOOL)animated {
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%@ has %lu products", self.company.name, (unsigned long)self.company.products.count);
   return [self.company.products count];
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 275, 10, 20);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Product *product = [self.company.products objectAtIndex:indexPath.row];

    static NSString *reuseIdentifier = @"cvCell";
    
    // Sets up cell identifier.
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                           forIndexPath:indexPath];
    
    UIImageView *productImage = (UIImageView *)[cell viewWithTag:100];
    productImage.image = [UIImage imageNamed:product.productLogo];
    
    return cell;
}


- (IBAction)longPressCellToDelete:(UILongPressGestureRecognizer*)gesture {
    
    CGPoint tapLocation = [gesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:tapLocation];
    
    if (indexPath && gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Image with index %ld to be deleted", indexPath.item);
        
        [[MySingleton sharedInstance] deleteProduct:[self.company.products[indexPath.row] productName] fromCompany:self.company.name];
        
        UIAlertView *deleteAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Delete?"
                                    message:@"Delete product?"
                                    delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
        [deleteAlert show];
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSLog(@"Selected button at index = %ld", buttonIndex);
    if (buttonIndex == 1) {
        
    // Deletes cell after being selected
    }
    [self.collectionView reloadData];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath; {
    WebViewController *webViewController = [[WebViewController alloc] init];
    
    webViewController.url = [NSURL URLWithString:
                             [NSString stringWithFormat:@"%@", [self.company.products[indexPath.row] productURL]]];
    
    NSLog(@"%@", webViewController.url);
    [self.navigationController pushViewController:webViewController
                                         animated:YES];
}

@end
