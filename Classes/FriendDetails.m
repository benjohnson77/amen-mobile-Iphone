    //
//  FriendDetails.m
//  uicontrols
//
//  Created by Najam on 25/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FriendDetails.h"
#import"PrayerData.h"


@implementation FriendDetails
@synthesize arr1;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
-(id)initWithString:(NSString *)fid :(NSString *) flogin :(NSString *)femail :(NSString *)fimage
{
	[super init];
	
		fid1 = fid;
	NSString *str12 =fid1 ;
	str12 = [str12 stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	str12 = [str12 stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
	
	s= [[prayerXML alloc]initWithString:str12];

	flogin1 = flogin;
	femail1 = femail;
	fimage1 = fimage;
	arr1 = [[NSMutableArray alloc]initWithObjects:fid1,flogin1,femail1,nil];
		
	NSString *yourString = [NSString stringWithFormat:@"%@",fimage];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	NSString *param = yourString;
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	
	if([s.xmlobj count] == 0)
	{
		
		UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"prayer list" message:@"no prayers" delegate:self 
										   cancelButtonTitle:@"cancel"  otherButtonTitles:@"ok",nil];
		[alt show];
		[alt release];
		
		}
	else {
		
		tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 110, 320, 480) style:UITableViewStyleGrouped];
		tableView.delegate= self;
		tableView.dataSource= self;
		[self.view addSubview:tableView];
		

		
			}

	lbtitle = [[UILabel alloc]initWithFrame:CGRectMake(200, 50, 100, 40)];
	lbtitle.text = flogin;
	lbtitle.textColor = [UIColor blackColor];
	img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 100, 100)];
	//UIImage *pic = [UIImage imageNamed:@"Touch4.png"];
	img.image = image;
	[self.view addSubview:lbtitle];
	[self.view addSubview:img];
	
	
	seg = [[UISegmentedControl alloc] initWithItems:
		   [NSArray arrayWithObjects:@"prayers", @"Profile" , @"Comments",nil]];
	
	//seg = [[UISegmentedControl alloc]init];
	[seg setSegmentedControlStyle:UISegmentedControlStyleBar];
	seg.backgroundColor =[UIColor redColor];
	[seg setSelectedSegmentIndex:0];
	[seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	seg.frame = CGRectMake(0, 380, 320, 40);
	
	[self.view addSubview:seg];
	

	
	
	
	return self;

}


- (void)segmentAction:(id)sender

{
	if(seg.selectedSegmentIndex ==0)
	{
		
				
			
		[tableView reloadData];

	}

		
			//[toolbar removeFromSuperview];
	
	
	else if(seg.selectedSegmentIndex ==2)
		
	{
		//s= [[prayerXML alloc]initWithString:fid1];	
		[tableView reloadData];
	}
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	
	/*
	if(seg.selectedSegmentIndex ==0)
	{
	return 1;
	}
	else if(seg.selectedSegmentIndex ==1)
	{
		return 2;
	}
	

	 */
	return 1;
	 }


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

	
/*	if(seg.selectedSegmentIndex ==0)
{
	return [s.xmlobj count];
}
	else if(seg.selectedSegmentIndex ==1)
	{
		return [arr1 count];
	}
*/
	return [s.xmlobj count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier] autorelease];
    }

	
	   
	PrayerData   *mydata = [s.xmlobj objectAtIndex:indexPath.row];
	
	cell.textLabel.text = mydata.title1  ;
	cell.detailTextLabel.text = mydata.description ;
	// [ cell.contentView  addSubview:lb];
	
	NSString *yourString = [NSString stringWithFormat:@"%@",mydata.imageurl];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	NSString *param = yourString;
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	//finalImage = image;
	
	
	
	
	cell.imageView.image = image;
	
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	
	
	  

	
	
	
	
	return cell;

}	
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	}


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
