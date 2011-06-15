    //
//  startupPage.m
//  MainView
//
//  Created by Najam on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "startupPage.h"
#import"PrayerData.h"
#import"MainViewAppDelegate.h"
#import"userhomepage.h"
#import"prayerwizard.h"
#import"mapview.h"
#import"prayerDetails.h"
#import"notifications.h"
#import"postPrayer.h"

#define USE_CUSTOM_DRAWING 1



@implementation startupPage

@synthesize imageView;

#pragma mark -
#pragma mark Initialization





/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
-(id)init
{

	[super init];
	
	
	tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, 480) style:UITableViewStyleGrouped];
	tableView1.delegate= self;
	tableView1.dataSource= self;
	self.navigationItem.hidesBackButton = YES;
	NSString *msg =@"Welcome  ";
	app = [[UIApplication sharedApplication]delegate];
	NSString *user = app.loginname;
	self.title = [msg stringByAppendingString:user];
	
	UIBarButtonItem *acc = [[UIBarButtonItem alloc]initWithTitle:@"Account" style:UIBarButtonItemStylePlain  target:self action:@selector(showaccount)];
	
	
	self.navigationItem.leftBarButtonItem =acc;
	
	[acc release];
	
	
	UIBarButtonItem *info = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction
							 
																		 target:self action:@selector(shownotifications)];
	
	
	self.navigationItem.rightBarButtonItem =info;
	
	[info release];
	
	toolbar = [UIToolbar new];
	toolbar.barStyle = UIBarStyleDefault;
	toolbar.tintColor =nil;
	toolbar.autoresizingMask = YES;
	
	
	// create a bordered style button with custom title
	UIBarButtonItem *feed = [[[UIBarButtonItem alloc] initWithTitle:@"Prayer Feed"
															   style:UIBarButtonItemStyleBordered	
															  target:self
															  action:@selector(PrayerFeed)] autorelease];
	
	
	UIBarButtonItem *post = [[[UIBarButtonItem alloc] initWithTitle:@"Prayer Post"
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(postprayer)] autorelease];
	UIBarButtonItem *map = [[[UIBarButtonItem alloc] initWithTitle:@"Prayer Map"
															 style:UIBarButtonItemStyleBordered
															target:self
															action:@selector(showmap)] autorelease];
	
	NSArray *items = [[NSArray alloc] initWithObjects: 
					  feed,
					  post,map,
					  nil];
	toolbar.items = items;
	toolbar.frame= CGRectMake(0, 0, 320, 40);
	//toolbar.tintColor = [UIColor lightTextColor];
	[self.view addSubview:toolbar];

app = [[UIApplication sharedApplication]delegate];
	NSString *user1 = app.userid;
	
		s= [[prayerXML alloc]initWithString:user1];
	[self.view addSubview:tableView1];
	return self;
	
	
}

-(void)PrayerFeed


{
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"prayer Feed" message:@"Module Incomplete" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];

}
-(void)postprayer
{
	 
	postPrayer *p1 = [[postPrayer alloc]init];
	//prayerwizard *p1 = [[prayerwizard alloc]init];
	[self.navigationController pushViewController:p1 animated:NO];
}

-(void)showaccount
{

	userhomepage *u1 = [[userhomepage alloc]init];
	[self.navigationController pushViewController:u1 animated:NO];
	[u1 release];
}

-(void)showmap
{
	mapview *m1 = [[mapview alloc]initwithString:@"pune"];
	[self.navigationController pushViewController:m1 animated:NO];

}
-(void)shownotifications
{

	notifications *n1 = [[notifications alloc]initWithStyle:UITableViewStyleGrouped];
	[self.navigationController pushViewController:n1 animated:NO];

}

#pragma mark -
#pragma mark View lifecycle



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	tableView1.separatorStyle = UITableViewCellSeparatorStyleNone;
	tableView1.rowHeight = 100;
	tableView1.backgroundColor = [UIColor clearColor];
	imageView.image = [UIImage imageNamed:@"gradientBackground.png"];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;

}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [s.xmlobj count];
}




#pragma mark -
#pragma mark Initialization


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	
	
#if USE_CUSTOM_DRAWING
//	const NSInteger TOP_LABEL_TAG = 1001;
	//const NSInteger BOTTOM_LABEL_TAG = 1002;
	UILabel *topLabel;
	UILabel *bottomLabel;
	UILabel *comments;
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
	//	topLabel.tag = TOP_LABEL_TAG;
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
		///bottomLabel.tag = BOTTOM_LABEL_TAG;
		bottomLabel.backgroundColor = [UIColor clearColor];
		bottomLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
		bottomLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize] - 2];
		
		
		
		
		//
		comments =
		[[[UILabel alloc]
		  initWithFrame:
		  CGRectMake(
					 image.size.width + 2.0 * cell.indentationWidth,
					 1 * ((tableView.rowHeight - 2 * LABEL_HEIGHT)+  LABEL_HEIGHT),
					 tableView.bounds.size.width -
					 image.size.width - 4.0 * cell.indentationWidth
					 - indicatorImage.size.width,
					 LABEL_HEIGHT)]
		 autorelease];
		[cell.contentView addSubview:comments];
		
		//
		// Configure the properties for the text that are the same on every row
		//
	//	comments.tag = TOP_LABEL_TAG;
		comments.backgroundColor = [UIColor clearColor];
		comments.textColor = [UIColor blackColor];
		comments.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
		comments.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
		
		
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
		//topLabel = (UILabel *)[cell viewWithTag:TOP_LABEL_TAG];
		//bottomLabel = (UILabel *)[cell viewWithTag:BOTTOM_LABEL_TAG];
	}
	
	
	PrayerData *mydata = [[PrayerData alloc]init];
	
	mydata  = [s.xmlobj objectAtIndex:indexPath.row];
	
	topLabel.text = mydata.title1;
	bottomLabel.text = mydata.description;
	NSString *msg = mydata.comment_counts;
	comments.text = [msg stringByAppendingString:@"  comments"];
	
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
	
	NSString *yourString = [NSString stringWithFormat:@"%@",mydata.imageurl];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	NSString *param = yourString;
	
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	
	//CGRect CellFrame = CGRectMake(0, 0, 300, 200);
	/*
	UITableViewCell *cell1 = [[[UITableViewCell alloc] initWithFrame:CellFrame reuseIdentifier:cellIdentifier] autorelease];
	cell1.backgroundColor=[UIColor whiteColor];
    UIImageView *hello=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
	hello.tag = 1;
	hello.image = image;
	[cell.contentView addSubview:hello];
	[hello release];
	return cell1;
	 */
	
	
	//[cell.contentView addSubView:subview];
	//cell.frame = cell.bounds;
	
	//cell.imageView.frame  = CGRectMake(0,0, 30, 30);
cell.imageView.image = image;
	
	
//		
	//[cell.contentView addSubView:subview];
	
	
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
	
	app = [[UIApplication sharedApplication]delegate];
	
	PrayerData  *pdata   = [s.xmlobj objectAtIndex:indexPath.row];
	app.prayer1 = pdata;
	
	prayerDetails *p1 = [[prayerDetails alloc]initWithString:pdata.prayerid];
	[self.navigationController pushViewController:p1 animated:YES];
	
}

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
