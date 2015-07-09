
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Company.h"
#import "Product.h"
#import "MySingleton.h"


@class ChildViewController;

@interface qcdDemoViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) NSMutableArray *products;
@property (strong, nonatomic) NSString *productURL;
@property (nonatomic, retain) IBOutlet  ChildViewController *childVC;
@property (nonatomic, retain) MySingleton *dao;


@property (nonatomic, retain) NSMutableArray *appleDevices;
@property (nonatomic, retain) NSMutableArray *samsungDevices;
@property (nonatomic, retain) NSMutableArray *nokiaDevices;
@property (nonatomic, retain) NSMutableArray *motorolaDevices;

@end
