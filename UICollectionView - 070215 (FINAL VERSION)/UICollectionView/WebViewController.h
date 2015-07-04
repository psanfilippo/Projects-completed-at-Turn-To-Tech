//#############################################################
//
//  WebViewController.h
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <UIKit/UIKit.h>
#import "Company.h"
#import "Product.h"


@interface WebViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString *requestString;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, retain) WebViewController *webViewController;

@property(nonatomic) BOOL scalesPageToFit;

@end
