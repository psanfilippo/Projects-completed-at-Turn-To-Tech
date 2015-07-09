
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//  MySingleton.h
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"


@interface MySingleton : NSObject

+ (MySingleton*) sharedInstance;

@property (strong, nonatomic) NSMutableArray *companyList;
@property (strong, nonatomic) NSMutableArray *productList;
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *companyID;
@property (strong, nonatomic) NSMutableArray *urlList;

@property (strong, nonatomic) NSString *productName;


-(instancetype)createDatabaseWithFilename:(NSString *)dbFileName;
- (void) deleteProduct:(NSString *)productName;
@property (strong, nonatomic) NSString *documentsDirectory;
@property (strong, nonatomic) NSString *databaseFilename;
@property (strong, nonatomic) NSString *databasePath;


@end
