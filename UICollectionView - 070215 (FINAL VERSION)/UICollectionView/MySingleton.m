//#############################################################
//
//  MySingleton.m
//  UICollectionView
//
//  Created by Philip San Filippo on 6/17/15.
//  Copyright (c) 2015 Philip San Filippo. All rights reserved.
//
//#############################################################

#import <Foundation/Foundation.h>
#import "MySingleton.h"


@implementation MySingleton

    // Declares a static instance of singleton object and initializes it to nil.
    // Generates an instance of the class but only if the static instance is nil.

+ (id)sharedInstance {
    
    static MySingleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
    
}


    // Method that gets called the first time the singleton is used.
- (id)init {
    
    if (self = [super init]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *encodedObject = [defaults objectForKey:@"NSUDS-SAVE-DATA"];
        if (encodedObject) {
            [self readData];
        } else {
            [self createCompaniesAndProducts];
        }
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    
    // Encode properties
    [encoder encodeObject:self.companyList forKey:@"companyList"];
    
}


- (id)initWithCoder:(NSCoder *)decoder {
    
    self = [super init];
    if( self != nil ) {
        
        self.companyList = [decoder decodeObjectForKey:@"companyList"];
    }
    return self;
}


-(void)createCompaniesAndProducts {
    
    // APPLE ###########
    Company *apple = [[Company alloc]init];
    apple.name = @"Apple";
    apple.logo = @"Apple.jpg";
    apple.products = [[NSMutableArray alloc]init];
    apple.urlList = [[NSMutableArray alloc]init];
    
    Product *iPhone = [[Product alloc]init];
    iPhone.productName = @"iPhone";
    iPhone.productLogo = @"iPhone.jpg";
    iPhone.productURL = @"http://www.apple.com/iphone/";
    
    Product *iPad = [[Product alloc]init];
    iPad.productName = @"iPad";
    iPad.productLogo = @"iPad.jpg";
    iPad.productURL = @"http://www.apple.com/ipad/";
    
    Product *iPod = [[Product alloc]init];
    iPod.productName = @"iPod";
    iPod.productLogo = @"iPod.jpg";
    iPod.productURL = @"http://www.apple.com/ipod/";
    
    [apple.products addObject:iPhone];
    [apple.products addObject:iPad];
    [apple.products addObject:iPod];
    
    [apple.urlList addObject:@"http://www.apple.com/iphone/"];
    [apple.urlList addObject:@"http://www.apple.com/ipad/"];
    [apple.urlList addObject:@"http://www.apple.com/ipod/"];
    
    
    // SAMSUNG ###########
    Company *samsung = [[Company alloc]init];
    samsung.name = @"Samsung";
    samsung.logo = @"Samsung.jpg";
    samsung.products = [[NSMutableArray alloc]init];
    samsung.urlList = [[NSMutableArray alloc]init];
    
    Product *galaxy = [[Product alloc]init];
    galaxy.productName = @"Galaxy S4";
    galaxy.productLogo = @"Galaxy S4.jpg";
    galaxy.productURL = @"http://www.samsung.com/us/mobile/cell-phones/SCH-I545ZWBVZW";
    
    Product *galaxyNote = [[Product alloc]init];
    galaxyNote.productName = @"Galaxy Note";
    galaxyNote.productLogo = @"Galaxy Note.jpg";
    galaxyNote.productURL = @"http://www.samsung.com/us/explore/galaxy-note-4-features-and-specs/";
    
    Product *galaxyTab = [[Product alloc]init];
    galaxyTab.productName = @"Galaxy Tab";
    galaxyTab.productLogo = @"Galaxy Tab.jpg";
    galaxyTab.productURL = @"http://www.samsung.com/us/mobile/galaxy-tab/";
    
    [samsung.products addObject:galaxy];
    [samsung.products addObject:galaxyNote];
    [samsung.products addObject:galaxyTab];
    
    [samsung.urlList addObject:@"http://www.samsung.com/us/mobile/cell-phones/SCH-I545ZWBVZW"];
    [samsung.urlList addObject:@"http://www.samsung.com/us/explore/galaxy-note-4-features-and-specs/"];
    [samsung.urlList addObject:@"http://www.samsung.com/us/mobile/galaxy-tab/"];
    
    
    // NOKIA ###########
    Company *nokia = [[Company alloc]init];
    nokia.name = @"Nokia";
    nokia.logo = @"Nokia.jpg";
    nokia.products = [[NSMutableArray alloc]init];
    nokia.urlList = [[NSMutableArray alloc]init];
    
    Product *lumia640XL = [[Product alloc]init];
    lumia640XL.productName = @"Lumia 640XL";
    lumia640XL.productLogo = @"Lumia 640XL.jpg";
    lumia640XL.productURL = @"http://www.microsoft.com/en-us/mobile/phone/lumia640-xl";
    
    Product *lumia640 = [[Product alloc]init];
    lumia640.productName = @"Lumia 640";
    lumia640.productLogo = @"Lumia 640.jpg";
    lumia640.productURL = @"http://www.microsoft.com/en-us/mobile/phone/lumia640";
    
    Product *lumia635 = [[Product alloc]init];
    lumia635.productName = @"Lumia 635";
    lumia635.productLogo = @"Lumia 635.jpg";
    lumia635.productURL = @"http://www.microsoft.com/en-us/mobile/phone/lumia635";
    
    [nokia.products addObject:lumia640XL];
    [nokia.products addObject:lumia640];
    [nokia.products addObject:lumia635];
    
    [nokia.urlList addObject:@"http://www.microsoft.com/en-us/mobile/phone/lumia640-xl"];
    [nokia.urlList addObject:@"http://www.microsoft.com/en-us/mobile/phone/lumia640"];
    [nokia.urlList addObject:@"http://www.microsoft.com/en-us/mobile/phone/lumia635"];
    
    
    // MOTOROLA ###########
    Company *motorola = [[Company alloc]init];
    motorola.name = @"Motorola";
    motorola.logo = @"Motorola.jpg";
    motorola.products = [[NSMutableArray alloc]init];
    motorola.urlList = [[NSMutableArray alloc]init];
    
    Product *motoX = [[Product alloc]init];
    motoX.productName = @"Moto X";
    motoX.productLogo = @"Moto X.jpg";
    motoX.productURL = @"http://www.motorola.com/us/motomaker?pid=FLEXR2";
    
    Product *motoG = [[Product alloc]init];
    motoG.productName = @"Moto G";
    motoG.productLogo = @"Moto G.jpg";
    motoG.productURL = @"http://www.motorola.com/us/smartphones/moto-g-2nd-gen/moto-g-2nd-gen.html";
    
    Product *motoE = [[Product alloc]init];
    motoE.productName = @"Moto E";
    motoE.productLogo = @"Moto E.jpg";
    motoE.productURL = @"http://www.motorola.com/us/smartphones/moto-e-2nd-gen/moto-e-2nd-gen.html";
    
    [motorola.products addObject:motoX];
    [motorola.products addObject:motoG];
    [motorola.products addObject:motoE];
    
    [motorola.urlList addObject:@"http://www.motorola.com/us/motomaker?pid=FLEXR2"];
    [motorola.urlList addObject:@"http://www.motorola.com/us/smartphones/moto-g-2nd-gen/moto-g-2nd-gen.html"];
    [motorola.urlList addObject:@"http://www.motorola.com/us/smartphones/moto-e-2nd-gen/moto-e-2nd-gen.html"];
    
    
    self.companyList = [[NSMutableArray alloc] init];
    [self.companyList addObject:apple];
    [self.companyList addObject:samsung];
    [self.companyList addObject:nokia];
    [self.companyList addObject:motorola];
    
}


-(void)deleteProduct:(NSString *)productName fromCompany:(NSString*)companyName {
     
    for (int i = 0; i < self.companyList.count; i++) {
        if ([[self.companyList[i] name] isEqualToString:companyName]) {
            
            for (int j = 0; j < [[self.companyList[i] products] count]; j++) {
                if ([[[[self.companyList[i] products] objectAtIndex:j] productName] isEqualToString:productName]) {
                    
                    [[self.companyList[i] products] removeObjectAtIndex:j];
                    [self saveData];
                    
                    return;
                }
            }
        }
    }
}


-(void)saveData {
    
    // Saving custom object data to NSUserDefaults.
    
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.companyList];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"NSUDS-SAVE-DATA"];
    [defaults synchronize];
    
    NSLog(@"Data Saved");
    
}


-(void)readData {
    
    // Fetching saved custom object data from NSUserDefaults.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"NSUDS-SAVE-DATA"];
    
    self.companyList = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSLog(@"Data Fetched");
}


@end
