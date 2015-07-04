//#############################################################
//
//  Product.m
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import "Product.h"


@implementation Product

- (id)initWithProductName:(NSString *)productName
              productLogo:(NSString *)productLogo
               productURL:(NSString *)productURL
{
    
    self = [super init];
    if(self)
        
    {
        [self setProductName:productName];
        [self setProductLogo:productLogo];
        [self setProductURL:productURL];
        
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    
    // Encodes properties and other class variables
    NSLog(@"Encoder Called");
    
    [encoder encodeObject:[self productName] forKey:@"productName"];
    [encoder encodeObject:[self productLogo] forKey:@"productLogo"];
    [encoder encodeObject:[self productURL] forKey:@"productURL"];
    
}


- (id)initWithCoder:(NSCoder *)decoder {
    
    NSLog(@"Decoder Called");
    
    self = [super init];
    if(self)
    {
        // Decodes properties and other class variables
        [self setProductName:[decoder decodeObjectForKey:@"productName"]];
        [self setProductLogo:[decoder decodeObjectForKey:@"productLogo"]];
        [self setProductURL:[decoder decodeObjectForKey:@"productURL"]];
        
    }
    
    return self;
}

@end
