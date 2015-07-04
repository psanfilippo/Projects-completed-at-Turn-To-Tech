//#############################################################
//
//  WebViewController.m
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import "WebViewController.h"


@interface WebViewController ()

@end

@implementation WebViewController


- (void)loadRequest {
    
    NSURLRequest *requestedWebPage = [NSURLRequest requestWithURL:self.url];
    _webView.scalesPageToFit = YES;
    [self.webView loadRequest:requestedWebPage];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadRequest];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
