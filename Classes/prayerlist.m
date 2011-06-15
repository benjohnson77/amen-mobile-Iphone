//
//  prayerlist.m
//  MainView
//
//  Created by Najam on 14/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "prayerlist.h"

#import"prayerXML.h"
#import"MainViewAppDelegate.h"
#import"startupPage.h"
#import"prayerDetails.h"

@implementation prayerlist


#pragma mark -
#pragma mark Initialization

- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
	self.navigationItem.hidesBackButton =YES;
	
	UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(showhomepage)];
	self.navigationItem.leftBarButtonItem =done;
	[done release];
	
	UIBarButtonItem *acc = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks   target:self action:@selector(showhomepage)];
	self.navigationItem.rightBarButtonItem =acc;
	[acc release];
	
	
	
	/*UIBarButtonItem *acc = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop  target:self action:@selector(showhomepage1)];
	self.navigationItem.rightBarButtonItem =acc;
	[done release];
	*/
	self.title = @"all Prayers";
     app = [[UIApplication sharedApplication]delegate];
	
	NSString *str = app.userid;
	str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	str = [str stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
	
	
	s = [[prayerXML alloc]initWithString:str];
	 PrayerData *mydata = [s.xmlobj objectAtIndex:1];
	
	NSLog(@"pryer img =%@", mydata.imageurl);
    return self;
}
-(void)showhomepage
{
	startupPage *p1 = [[startupPage alloc]init];
	[self.navigationController pushViewController:p1 animated:NO];
}


#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [s.xmlobj count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	
    PrayerData *pdata  = [[PrayerData alloc]init];
	
	
   pdata   = [s.xmlobj objectAtIndex:indexPath.row];
	cell.textLabel.text =pdata.title1;
	cell.detailTextLabel.text = pdata.description;
	
	
	
	NSString *yourString = [NSString stringWithFormat:@"%@",pdata.imageurl];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	/*
	
	NSString *param = yourString;
	
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	*/
	NSURL *url = [NSURL URLWithString:yourString];
	
	
	NSData *data = [NSData dataWithContentsOfURL:url];
	
	UIImage *img = [[UIImage alloc] initWithData:data];	
	
	
	cell.imageView.image = img;
	
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	
	
	// [ cell.contentView  addSubview:lb];
			
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	app = [[UIApplication sharedApplication]delegate];
	
		PrayerData  *pdata   = [s.xmlobj objectAtIndex:indexPath.row];
	    app.prayer1 = pdata;
		
	prayerDetails *p1 = [[prayerDetails alloc]initWithString:pdata.prayerid];
	[self.navigationController pushViewController:p1 animated:YES];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

