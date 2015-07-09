
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

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
