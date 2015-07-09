
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//  MySingleton.m
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "MySingleton.h"
#import "Company.h"

@implementation MySingleton

{
    sqlite3 *mobileCompanyDB;

}

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
        
        [self createCompaniesAndProducts];
    }
    return self;
}

-(void)createCompaniesAndProducts {
    
    self.documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    self.databasePath = [self.documentsDirectory stringByAppendingPathComponent:@"mobileCompany.db"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:self.databasePath];
    if (!fileExists) {

        [self createDatabaseWithFilename:@"/Users/phil/Desktop/mobileCompany.db"];
    }

    [self retrieveCompanyData];

}


    // ############# SQLite database #############

-(instancetype)createDatabaseWithFilename:(NSString *)dbFileName {
        
        // Sets the documents directory path to the documentsDirectory property
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.documentsDirectory = [paths objectAtIndex:0];
        
        // Keeps the database filename
        self.databaseFilename = dbFileName;
        
        // Copies the database file into the documents directory if necessary
        [self copyDatabaseIntoDocumentsDirectory];
        
    
    return self;
}


-(void)copyDatabaseIntoDocumentsDirectory {
    
    // Checks to see if the database already exists in the documents directory
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.databasePath]) {
        
        // If the database file does not exist in the documents directory, copy it in from the main bundle
        NSString *sourcePath = self.databaseFilename;
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath
                                                toPath:self.databasePath
                                                 error:&error];
        
        // Creates tables
        if (sqlite3_open([[self databaseFilename] UTF8String], &mobileCompanyDB) == SQLITE_OK) {
            
            const char *sql_stmt = "CREATE TABLE IF NONE EXISTS";
            if(sqlite3_exec(mobileCompanyDB, sql_stmt, NULL, NULL, nil) == SQLITE_OK) {
                
                // Executes SQL statement
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"CREATE"
                                                               message:@"CREATE TABLE"
                                                              delegate:self
                                                     cancelButtonTitle:@"CLOSE" otherButtonTitles:nil];
                
                [alert show];
            }
            
            sqlite3_close(mobileCompanyDB);
            
        } else {
            NSLog(@"%@", [error localizedDescription]);
            
        }
    }
    [self retrieveCompanyData];
}


- (void)retrieveCompanyData {
    
    const char *paths = [self.databasePath UTF8String];
    sqlite3_stmt *queryStatement;
    
    if (sqlite3_open(paths, &mobileCompanyDB) == SQLITE_OK) {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT companyName, companyLogo, companyID FROM Companies"];
        
        const char *query_sql = [querySQL UTF8String];
        sqlite3_prepare(mobileCompanyDB, query_sql, -1, &queryStatement, NULL);
        
        self.companyList = [[NSMutableArray alloc]init];
        NSLog(@"%d",sqlite3_prepare(mobileCompanyDB, query_sql, -1, &queryStatement, NULL));
        if (sqlite3_prepare(mobileCompanyDB, query_sql, -1, &queryStatement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(queryStatement)== SQLITE_ROW) {
                
                NSString *companyName = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 0)];
                NSString *companyLogo = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 1)];
                NSString *companyID = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 2)];
                
                Company *newCompany = [[Company alloc]init];
                newCompany.name = companyName;
                newCompany.logo = companyLogo;
                newCompany.companyID = companyID;
                newCompany.products = [[NSMutableArray alloc]init];
                
            [self.companyList addObject:newCompany];
                NSLog(@"%@, %@, %@", companyName, companyLogo, companyID);
                
            }
            sqlite3_finalize(queryStatement);
            sqlite3_close(mobileCompanyDB);
            
            [self retrieveProductData];
            
        }
        
    }
    
}

- (void)retrieveProductData {
    
    const char *paths = [self.databasePath UTF8String];
    sqlite3_stmt *queryStatement;
    
    if (sqlite3_open(paths, &mobileCompanyDB) == SQLITE_OK) {
        
        NSString *querySQL = [NSString stringWithFormat:@"SELECT productName, productLogo, productURL, productID FROM Products"];
        
        const char *query_sql = [querySQL UTF8String];
        sqlite3_prepare(mobileCompanyDB, query_sql, -1, &queryStatement, NULL);
        
        self.productList = [[NSMutableArray alloc]init];
        
        if (sqlite3_prepare(mobileCompanyDB, query_sql, -1, &queryStatement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(queryStatement)== SQLITE_ROW) {
                
                NSString *productName = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 0)];
                NSString *productLogo = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 1)];
                NSString *productURL = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 2)];
                NSString *productID = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(queryStatement, 3)];
                
                Product *newProduct = [[Product alloc]init];
                newProduct.productName = productName;
                newProduct.productLogo = productLogo;
                newProduct.productURL = productURL;
                newProduct.productID = productID;
                
            [self.productList addObject:newProduct];
                NSLog(@"%@, %@, %@, %@", productName, productLogo, productURL, productID);
                
            }
            
            sqlite3_finalize(queryStatement);
            sqlite3_close(mobileCompanyDB);
            
            [self associateProductsWithCompanies];
            
        }
        
    }
    
}


-(void)associateProductsWithCompanies {
    
    for(int i = 0; i < self.companyList.count; i++) {
        
        for(int j = 0; j < self.productList.count; j++) {
            
            if ([[self.productList[j] productID] isEqualToString:[self.companyList[i] companyID]]) {
                [[self.companyList[i] products] addObject:self.productList[j]];
            }
        }
    }
}


    // Deletes the product from the database
- (void) deleteProduct:(NSString *)productName {
    
    const char *paths = [self.databasePath UTF8String];
    if (sqlite3_open(paths, &mobileCompanyDB) == SQLITE_OK) {
        
        NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM Products WHERE productName IS '%@'", productName];
        
        const char *query_sql = [deleteSQL UTF8String];
        char *error;
        if (sqlite3_exec(mobileCompanyDB, query_sql, NULL, NULL, &error)==SQLITE_OK) {
            NSLog(@"Product Deleted");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"DELETE PRODUCT"
                                                           message:@"Product deleted."
                                                          delegate:self
                                                 cancelButtonTitle:@"Close"
                                                 otherButtonTitles:nil];
            [alert show];
        }
    }
}

@end
