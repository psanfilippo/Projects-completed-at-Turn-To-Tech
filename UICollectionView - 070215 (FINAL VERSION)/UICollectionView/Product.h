//#############################################################
//
//  Product.h
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <Foundation/Foundation.h>
#import "Company.h"

@interface Product : NSObject <NSCoding>

@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productLogo;
@property (strong, nonatomic) NSString *productURL;


- (id)initWithProductName:(NSString *)productName
              productLogo:(NSString *)productLogo
               productURL:(NSString *)productURL;

@end
