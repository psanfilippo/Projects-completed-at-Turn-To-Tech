
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

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
    
    // Do any additional setup after loading the view from its nib.
    [self loadRequest];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
