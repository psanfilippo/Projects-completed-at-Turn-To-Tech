
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//  Company.h
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Company : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSMutableArray *urlList;
@property (strong, nonatomic) NSString *productURL;
@property (strong, nonatomic) NSString *companyID;

@end
