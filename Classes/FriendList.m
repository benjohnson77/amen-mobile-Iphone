    //
//  FriendList.m
//  MainView
//
//  Created by Najam on 28/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendList.h"
#import"friendsData.h"
#import"friendsXML.h"
#import"FriendDetails.h"
#import"Searchfriends.h"
#import"userhomepage.h"
#import"PickerViewController.h"

#define USE_CUSTOM_DRAWING 1
@implementation FriendList

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


-(id)init
{
	
	[super init];
	
	
	tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, 480) style:UITableViewStyleGrouped];
	tableView.delegate= self;
	tableView.dataSource= self;
	self.navigationItem.hidesBackButton = YES;
	/*NSString *msg =@"Welcome  ";
	app = [[UIApplication sharedApplication]delegate];
	NSString *user = app.loginname;
	self.title = [msg stringByAppendingString:user];
	 */
	
	
	 UIBarButtonItem *search = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch 
	 
	 target:self action:@selector(searchfriend)];
	 
	 
	 self.navigationItem.rightBarButtonItem =search;
	 
	 [search release];
	 
	
	
	UIBarButtonItem *info = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction
							 
																		 target:self action:@selector(showAccount)];
	
	
	self.navigationItem.leftBarButtonItem =info;
	
	[info release];
	
	toolbar = [UIToolbar new];
	toolbar.barStyle = UIBarStyleDefault;
	toolbar.tintColor = nil;
	toolbar.autoresizingMask = YES;
	
	
	// create a bordered style button with custom title
	UIBarButtonItem *feed = [[[UIBarButtonItem alloc] initWithTitle:@"Friends"
															  style:UIBarButtonItemStyleBordered	
															 target:self
															 action:@selector(PrayerFeed)] autorelease];
	
	
	UIBarButtonItem *group = [[[UIBarButtonItem alloc] initWithTitle:@"Groups"
															  style:UIBarButtonItemStyleBordered
															 target:self
															 action:@selector(showgroup)] autorelease];
	UIBarButtonItem *request = [[[UIBarButtonItem alloc] initWithTitle:@"Invite"
															 style:UIBarButtonItemStyleBordered
															target:self
															action:@selector(Invitefriend)] autorelease];
	
	NSArray *items = [NSArray arrayWithObjects: 
					  feed,
					  group,request,
					  nil];
	toolbar.items = items;
	toolbar.frame= CGRectMake(0, 0, 320, 40);
	//toolbar.tintColor = [UIColor lightTextColor];
	[self.view addSubview:toolbar];
		
	s= [[friendsXML alloc]init];
	if([s.xmlobj1 count] == 0)
	{
		
		UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Friends" message:@"No friends Added" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
		[alt show];
		[alt release];
		
		
	 
		
	
	}
	
	
	[self.view addSubview:tableView];
	return self;
	
	
}



-(void)Invitefriend
{
	Searchfriends *s1 = [[Searchfriends alloc]init];
	[self.navigationController pushViewController:s1 animated:NO];


}
-(void)showgroup
{
	PickerViewController *p1 = [[PickerViewController alloc]init];
	[self.navigationController pushViewController:p1 animated:YES];

}

-(void)showAccount
{
	userhomepage *u1 = [[userhomepage alloc]init];
	[self.navigationController pushViewController:u1 animated:NO];
	
}

-(void)searchfriend
{
	
	
	Searchfriends *s1 = [[Searchfriends alloc]init];
	[self.navigationController pushViewController:s1 animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView.rowHeight = 100;
	tableView.backgroundColor = [UIColor clearColor];
	imageView.image = [UIImage imageNamed:@"gradientBackground.png"];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
	
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [s.xmlobj1 count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	
	
#if USE_CUSTOM_DRAWING
	const NSInteger TOP_LABEL_TAG = 1001;
	const NSInteger BOTTOM_LABEL_TAG = 1002;
	UILabel *topLabel;
	UILabel *bottomLabel;
#endif
	
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		//
		// Create the cell.
		//
		cell =
		[[[UITableViewCell alloc]
		  initWithFrame:CGRectZero
		  reuseIdentifier:CellIdentifier]
		 autorelease];
		
#if USE_CUSTOM_DRAWING
		UIImage *indicatorImage = [UIImage imageNamed:@"indicator.png"];
		cell.accessoryView =
		[[[UIImageView alloc]
		  initWithImage:indicatorImage]
		 autorelease];
		
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		const CGFloat LABEL_HEIGHT = 20;
		UIImage *image = [UIImage imageNamed:@"imageA.png"];
		
		//
		// Create the label for the top row of text
		//
		topLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT),
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:topLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		topLabel.tag = TOP_LABEL_TAG;
		topLabel.backgroundColor = [UIColor clearColor];
		topLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
		topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
		//
		// Create the label for the top row of text
		//
		
		bottomLabel =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT) + LABEL_HEIGHT,
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		
		[cell.contentView addSubview:bottomLabel];
		
		//
		// Configure the properties for the text that are the same on every row
		//
		bottomLabel.tag = BOTTOM_LABEL_TAG;
		bottomLabel.backgroundColor = [UIColor clearColor];
		bottomLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
		bottomLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		
		//
		// Create a background image view.
		//
		cell.backgroundView =
		[[[UIImageView alloc] init] autorelease];
		cell.selectedBackgroundView =
		[[[UIImageView alloc] init] autorelease];
#endif
	}
	
	
	
	//#if USE_CUSTOM_DRAWING
	else
	{
		topLabel = (UILabel *)[cell viewWithTag:TOP_LABEL_TAG];
		bottomLabel = (UILabel *)[cell viewWithTag:BOTTOM_LABEL_TAG];
	}
	
	
	friendsData   *mydata = [[friendsData  alloc]init];
	
	mydata  = [s.xmlobj1  objectAtIndex:indexPath.row];
	
	topLabel.text = mydata.frind_login;
	bottomLabel.text = mydata.friendid;
	
	//
	// Set the background and selected background images for the text.
	// Since we will round the corners at the top and bottom of sections, we
	// need to conditionally choose the images based on the row index and the
	// number of rows in the section.
	//
	UIImage *rowBackground;
	UIImage *selectionBackground;
	NSInteger sectionRows = [tableView numberOfRowsInSection:[indexPath section]];
	NSInteger row = [indexPath row];
	if (row == 0 && row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
	}
	else if (row == 0)
	{
		rowBackground = [UIImage imageNamed:@"topRow.png"];
		selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
	}
	else if (row == sectionRows - 1)
	{
		rowBackground = [UIImage imageNamed:@"bottomRow.png"];
		selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
	}
	else
	{
		rowBackground = [UIImage imageNamed:@"middleRow.png"];
		selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
	}
	((UIImageView *)cell.backgroundView).image = rowBackground;
	((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
	
	NSString *yourString = [NSString stringWithFormat:@"%@",mydata.fr_image];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	NSString *param = yourString;
	
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	
	cell.imageView.image = image;
	
		
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	
	return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	friendsData *mydata = [s.xmlobj1 objectAtIndex:indexPath.row];
	NSString *fid, *flogin ,*femail,*fimage;
	fid = mydata.friendid;
	flogin = mydata.frind_login;
	femail = mydata.fr_email;
	fimage = mydata.fr_image;
	
	
	FriendDetails *p1 = [[FriendDetails alloc]initWithString:fid:flogin:femail:fimage];
	[self.navigationController pushViewController:p1 animated:YES];
	
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
