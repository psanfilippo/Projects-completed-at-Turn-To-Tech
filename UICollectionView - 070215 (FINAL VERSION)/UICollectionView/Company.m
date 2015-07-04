//#############################################################
//
//  Company.m
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import "Company.h"


@implementation Company

- (id)initWithName:(NSString *)name
          products:(NSMutableArray *)products
              logo:(NSString *)logo
           urlList:(NSMutableArray *)urlList
        productURL:(NSString *)productURL
{
    
    self = [super init];
    
    if(self)
        
    {
        [self setName:name];
        [self setProducts:products];
        [self setLogo:logo];
        [self setUrlList:urlList];
        [self setProductURL:productURL];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    
    // Encode sproperties and other class variables
    NSLog(@"Encoder Called");
    
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.products forKey:@"products"];
    [encoder encodeObject:self.logo forKey:@"logo"];
    [encoder encodeObject:self.urlList forKey:@"urlList"];
    [encoder encodeObject:self.productURL forKey:@"productURL"];
    
}


- (id)initWithCoder:(NSCoder *)decoder {
    
    NSLog(@"Decoder Called");
    
    self = [super init];
    
    if(self)
        
    {
        // Decodes properties and other class variables
        [self setName:[decoder decodeObjectForKey:@"name"]];
        [self setProducts:[decoder decodeObjectForKey:@"products"]];
        [self setLogo:[decoder decodeObjectForKey:@"logo"]];
        [self setUrlList:[decoder decodeObjectForKey:@"urlList"]];
        [self setProductURL:[decoder decodeObjectForKey:@"productURL"]];
        
    }
    
    return self;
}

@end
