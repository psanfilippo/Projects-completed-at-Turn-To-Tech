//#############################################################
//
//  Company.h
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Company : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSMutableArray *urlList;
@property (strong, nonatomic) NSString *productURL;


- (id) initWithName:(NSString *)name
   products:(NSMutableArray *)products
       logo:(NSString *)logo
    urlList:(NSMutableArray *)urlList
 productURL:(NSString *)productURL;

@end
