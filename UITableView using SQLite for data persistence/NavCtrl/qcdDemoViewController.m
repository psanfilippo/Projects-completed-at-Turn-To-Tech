
//##########################################
//
//  Navigation Controller
//  UITableView and UIWebView
//
//  Created by Phil San Filippo - April 2015
//
//##########################################

#import "qcdDemoViewController.h"
#import "ChildViewController.h"


@interface qcdDemoViewController ()

@end


@implementation qcdDemoViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) {
    // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated {
     self.navigationItem.rightBarButtonItem = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Preserves selection between presentations
    self.clearsSelectionOnViewWillAppear = NO;
    
    self.dao = [MySingleton sharedInstance];
    self.companyList = self.dao.companyList;
    self.title = @"Mobile Device Makers";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.companyList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
 
    cell.textLabel.text = [[self.companyList objectAtIndex:indexPath.row] name];
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg", [[self.companyList objectAtIndex:indexPath.row] name]];
    [[cell imageView] setImage: [UIImage imageNamed:imageName]];
    
    return cell;
}


    // Override to support conditional editing of the table view
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if the specified item should not be editable
    return YES;
}


    // Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         
         // Delete the row from the data source
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
         
     } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
     }
 
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if the item should not be re-orderable
    return YES;
    
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}


#pragma mark - Table view delegate

    // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    self.childVC.company = self.companyList[indexPath.row];
    self.childVC.title = self.childVC.company.name;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController pushViewController:self.childVC
                                         animated:YES];
}

@end
