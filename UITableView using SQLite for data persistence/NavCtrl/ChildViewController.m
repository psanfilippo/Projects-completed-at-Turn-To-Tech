
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController


- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        
    // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Displays an Edit button in the navigation bar for this view controller
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
        
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Disposes of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Returns the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Returns the number of rows in the section.
    return [self.company.products count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    }
    
    // Configures the cell...
    NSString *productName = [[self.company.products objectAtIndex:[indexPath row]] productName];
    cell.textLabel.text = productName;
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg", productName];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;

}

//################# EDIT UITableView ################

    // Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


    // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * productName = [[self.company.products objectAtIndex:indexPath.row] productName];
    [self.company.products removeObjectAtIndex:indexPath.row];
    [self.company.urlList removeObjectAtIndex:indexPath.row];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [tableView beginUpdates];
        
        // Deletes the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [[MySingleton sharedInstance] deleteProduct:productName];
        [tableView endUpdates];
    }
}


    // Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSString *stringToMove = self.company.products[sourceIndexPath.row];
    NSString *urlToMove = self.company.urlList[sourceIndexPath.row];
    
    [self.company.products removeObjectAtIndex:sourceIndexPath.row];
    [self.company.products insertObject:stringToMove atIndex:destinationIndexPath.row];
    [self.company.urlList removeObjectAtIndex:sourceIndexPath.row];
    [self.company.urlList insertObject:urlToMove atIndex:destinationIndexPath.row];

}


#pragma mark - Table view delegate
 
    // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     WebViewController *webViewController = [[WebViewController alloc] init];

        webViewController.url = [NSURL URLWithString:
                                     [NSString stringWithFormat:@"%@", [self.company.products[indexPath.row] productURL]]];
        [self.tableView reloadData];

    NSLog(@"%@", webViewController.url);
    [self.navigationController pushViewController:webViewController animated:YES];

}

@end
