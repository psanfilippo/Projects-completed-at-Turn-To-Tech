//#############################################################
//
//  MySingleton.h
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"


@interface MySingleton : NSObject

+ (MySingleton*) sharedInstance;

@property (strong, nonatomic) NSMutableArray *companyList;
@property (strong, nonatomic) NSMutableArray *productList;

-(void)deleteProduct:(NSString *)productName fromCompany:(NSString*)companyName;
-(void)saveData;
-(void)readData;

@end
