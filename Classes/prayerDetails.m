//
//  prayerDetails.m
//  uicontrols
//
//  Created by Najam on 29/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "prayerDetails.h"
#import"CommentData.h"
#import"prayerlist.h"
#import"MainViewAppDelegate.h"
#import"mapview.h"
#import"startupPage.h"

#import"AddCommnet.h"
#import"addevents.h"


@implementation prayerDetails
@synthesize image, txtprayer,seg,searchbar;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
-(id)initWithString:(NSString *)pid
{
	
	prayerid = pid;
	return self;
	

}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[txtcomment resignFirstResponder];
	MainViewAppDelegate *app = [[UIApplication sharedApplication]delegate];
	txtprayer.text = app.prayer1.description;
	self.title = app.prayer1.title1;
	self.navigationItem.hidesBackButton = YES;
	
	
	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/add_prayer_viewed.xml?"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSString *postString = [NSString stringWithFormat:@"id=%@",prayerid];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@"Request submitted");
		//responseData = [[NSMutableData alloc] init];
	}
	
	[connectionResponse release];
	
	
	
	
	
	NSString *yourString = [NSString stringWithFormat:@"%@",app.prayer1.imageurl] ;
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	NSString *param = yourString;
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image1 = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	image.image = image1;	
		
		[seg setSelectedSegmentIndex:0];
	[seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addReminder)];
	self.navigationItem.rightBarButtonItem = add;
	[add release];
	
	
	UIBarButtonItem *prayer = [[UIBarButtonItem alloc]initWithTitle:@"Prayers" style:UIBarButtonItemStyleBordered  target:self action:@selector (showprayers)];
	self.navigationItem.leftBarButtonItem = prayer;
	[prayer release];
	
	
	
	tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 320, 280) style:UITableViewStyleGrouped];
	tableView.delegate= self;
	tableView.dataSource= self;
	
	txtcomment = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
	txtcomment.text=@" Add comments here";
	txtcomment.borderStyle = UITextBorderStyleRoundedRect;
	
	txtcomment.backgroundColor = [UIColor lightGrayColor];
	
     tableView.tableHeaderView  = txtcomment ;
	txtcomment.delegate=  self;

	
		
	s= [[CommentXML alloc]initWithString:prayerid];
	NSString *pviewd = app.prayer1.prayer_viewd;
	NSString *prayed = app.prayer1.prayer_prayed;
	
	
	titlearray = [[NSMutableArray alloc]initWithObjects:@"Created By:", @"Refrence" ,@"Rank",@"People seen",@"people prayed",nil];
	valuearray =[[NSMutableArray alloc]initWithObjects:@"varun", @"kanetkar" , @"4", pviewd , prayed, nil];
	
	
	[self.view addSubview:tableView];

}

-(void)showprayers
{
	startupPage *s1 = [[startupPage alloc]init];
	[self.navigationController pushViewController:s1 animated:NO];
	[s1 release];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField

{
if (textField == txtcomment) {
	
	
	AddCommnet *n1 = [[AddCommnet alloc]init];

	//AddNoteViewController *n1 = [[AddNoteViewController alloc]initWithStyle:UITableViewStyleGrouped];
	[self.navigationController pushViewController:n1 animated:NO];
	 
	
}

}
	
-(void)addcomment
{
	[txtcommentpost resignFirstResponder];
	[txtcomment resignFirstResponder];
	txtcomment.placeholder =@"Add comment here....";
		
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/add_comment.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSString *postString = [NSString stringWithFormat:@"prayer_id=%@&comment= %@",prayerid,txtcommentpost.text];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	
	NSURLResponse* response;
	NSError* error = nil;
	
	result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
	s= [[CommentXML alloc]initWithString:prayerid];
	
	[txtcommentpost removeFromSuperview];
	[self.view addSubview:image];
	[self.view addSubview:txtprayer];
	
	
	
	[tableView reloadData];
	
	[self.view addSubview:tableView];
	[self.view addSubview:seg];
		
}
-(void)cancelpost
{
	
	[txtcommentpost resignFirstResponder];
	[self.view addSubview:image];
	[self.view addSubview:seg];
	[self.view addSubview:txtprayer];
	[self.view addSubview:tableView];
	
	UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addReminder)];
	self.navigationItem.rightBarButtonItem = add;
	[add release];
	
	UIBarButtonItem *del = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash  target:self action:@selector(removePrayer)];
	self.navigationItem.leftBarButtonItem = del;
	[del release];
	

}

-(void)addReminder
{
	addevents *a1 = [[addevents alloc]init];
	[self.navigationController pushViewController:a1 animated:NO];
	[a1 release];
		
}
-(void)removePrayer
{

	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/delete_prayer.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSString *postString = [NSString stringWithFormat:@"id=%@",prayerid];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@"Request submitted");
		//responseData = [[NSMutableData alloc] init];
	}
	
	prayerlist *p1 = [[prayerlist alloc]initWithStyle:UITableViewStyleGrouped];
	[self.navigationController pushViewController:p1 animated:NO];
	
	[connectionResponse release];


}

- (void)segmentAction:(id)sender

{
	if(seg.selectedSegmentIndex ==0)
	{
		s= [[CommentXML alloc]initWithString:prayerid];
		
		
		
		tableView.tableHeaderView = txtcomment;
				self.title =@"comments";
		[tableView reloadData];
		[self.view addSubview:tableView];

	}
	
	else if(seg.selectedSegmentIndex ==1)
		
		
		
	{   tableView.tableHeaderView = nil;
		tableView.frame = CGRectMake(0, 0, 320, 380);
		[tableView reloadData];	
		
		self.title =@"Status";
		
		
		[self.view addSubview:tableView];

	}
	else if(seg.selectedSegmentIndex ==2)
	{
	
	txtprayer.text= @"feed";
		
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Payer Feed" message:@" Module incomplete" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
		[alertView show];
		[alertView release];
		[tableView removeFromSuperview];
		
		
		
		NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/add_prayer_prayed.xml"];
		NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
		[urlRequest setHTTPMethod:@"POST"];
		NSString *postString = [NSString stringWithFormat:@"id=%@",prayerid];
		
		[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
		
		NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
		if (!connectionResponse) {
			NSLog(@"Failed to submit request");
		} else {
			NSLog(@"Request submitted");
			//responseData = [[NSMutableData alloc] init];
		}
		
	}
}
		
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if(seg.selectedSegmentIndex==0)
	{
		
		return 1;		
	}
	
	else {
		
		return 3;
	}
	
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
	
	if(seg.selectedSegmentIndex == 0)
	{
	
		return nil;
	}else
	{
	NSString *title = nil;
    // Return a title or nil as appropriate for the section.
    switch (section) {
        case 0:
            title = @"prayer";
            break;
        case 1:
            title = @"Prayer Map";
            break;
		case 2:
			title = @"prayer status";
			break;
			
        default:
            break;
    }
    return title;
}
	
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
	if(seg.selectedSegmentIndex== 0)
	{
		
		return [s.xmlobj count];
	}
	if(seg.selectedSegmentIndex==1)
	{
		
		NSInteger rows = 0;
		
		/*
		 The number of rows depends on the section.
		 In the case of ingredients, if editing, add a row in editing mode to present an "Add Ingredient" cell.
		 */
		switch (section) {
			case 0:
			case 1:
				rows = 1;
				break;
			case 2:
				rows = [titlearray count];
				
				break;
			default:
				
				break;
		}
		return rows;
		
	}
	
	else {
		return 5;
	}
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier] autorelease];
    }
 	if(seg.selectedSegmentIndex==0)
	{
		
		CommentData  *mydata1 = [s.xmlobj objectAtIndex:indexPath.row];
		
		cell.textLabel.text = mydata1.user_name;
		cell.detailTextLabel.text = mydata1.comments;
		// [ cell.contentView  addSubview:lb];
		NSString *yourString = [NSString stringWithFormat:@"%@",mydata1.C_image ];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		
		NSString *param = yourString;
		
		NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
		NSURL *url = [NSURL URLWithString:urlString];
		UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
		//finalImage = image;
		
		
		//UIImage *image = [UIImage imageNamed:@"furl.png"];
		cell.imageView.image = image;
		
		
		
		//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		
		
	}
	else if(seg.selectedSegmentIndex==1)
	{
		
		
		
		cell.textLabel.text =@"sattus";
		cell.detailTextLabel.text  = @"details of code";
		cell.imageView.image = [UIImage imageNamed:@"furl.png"];
		
		//cell.imageView.image = image;
		
		//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		
		
		
	    
		
		
	}
	else {
		cell.textLabel.text = @"feed";
	}

	if(seg.selectedSegmentIndex ==1)
	{
	
	
		if (indexPath.section == 2) {
			NSUInteger DeatilCount = [titlearray  count];
			NSInteger row = indexPath.row;
			
			if (indexPath.row < DeatilCount) {
				// If the row is within the range of the number of ingredients for the current recipe, then configure the cell to show the ingredient name and amount.
				static NSString *IngredientsCellIdentifier = @"IngredientsCell";
				
				cell = [tableView dequeueReusableCellWithIdentifier:IngredientsCellIdentifier];
				
				if (cell == nil) {
					// Create a cell to display an ingredient.
					cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IngredientsCellIdentifier] autorelease];
					cell.accessoryType = UITableViewCellAccessoryNone;
				}
				
				// Ingredient *ingredient = [ingredients objectAtIndex:row];
				cell.textLabel.text = [titlearray objectAtIndex:row];
				cell.detailTextLabel.text = [valuearray objectAtIndex:row];
			} else {
				// If the row is outside the range, it's the row that was added to allow insertion (see tableView:numberOfRowsInSection:) so give it an appropriate label.
				static NSString *AddIngredientCellIdentifier = @"AddIngredientCell";
				
				cell = [tableView dequeueReusableCellWithIdentifier:AddIngredientCellIdentifier];
				if (cell == nil) {
					// Create a cell to display "Add Ingredient".
					cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AddIngredientCellIdentifier] autorelease];
					cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				}
				cell.textLabel.text = @"Add Ingredient";
			}
		} else {
			// If necessary create a new cell and configure it appropriately for the section.  Give the cell a different identifier from that used for cells in the Ingredients section so that it can be dequeued separately.
			static NSString *MyIdentifier = @"GenericCell";
			
			cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			}
			
			NSString *text = nil;
			
			switch (indexPath.section) {
				case 0: // type -- should be selectable -> checkbox
					text = @"prayer title";
					cell.accessoryType = UITableViewCellAccessoryNone;
					cell.imageView.image = [UIImage imageNamed:@"Mail.png"];
					cell.textLabel.text = text;
					cell.detailTextLabel.text =@"description";
					// cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
					break;
				case 1: // instructions
					text = @" Where people prayed";
					cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
					cell.textLabel.text = text;
					// cell.editingAccessoryType = UITableViewCellAccessoryNone;
					break;
				default:
					break;
			}
			
			
		}
		
	
	
	
	}
	
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
	if(seg.selectedSegmentIndex ==1)
	{
		
		NSInteger section = indexPath.section;
		if(section == 1)
		{
			mapview   *p1  = [[mapview alloc]initwithString:@"pune"];
			[self.navigationController pushViewController:p1 animated:NO];
			
			
		}
				
	}
	
	//grouplist *p1 = [[grouplist alloc]init];
	//[self.navigationController pushViewController:p1 animated:YES];
	
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
