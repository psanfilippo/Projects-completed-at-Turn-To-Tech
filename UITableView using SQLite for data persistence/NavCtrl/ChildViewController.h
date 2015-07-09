
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "Company.h"
#import "MySingleton.h"
#import "sqlite3.h"

@interface ChildViewController : UITableViewController

@property (nonatomic, retain) Company *company;
@property (nonatomic, strong) NSMutableArray *urlList;
@property (nonatomic, strong) NSString *productList;
@property (nonatomic, strong) NSString *productURL;

@end
