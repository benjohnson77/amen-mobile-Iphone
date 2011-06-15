//
//  showProfile.m
//  MainView
//
//  Created by Najam on 04/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "showProfile.h"


@implementation showProfile


@synthesize seg,img,loginname;

@synthesize labels ,label1 , fieldresult,pwdplaceholder,passwordlabel;
@synthesize placeholders;



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"My Profile";
	img.image = [UIImage imageNamed:@"furl.png"];
		
	 
		
	
   tableview1  = [[UITableView alloc]initWithFrame:CGRectMake(0, 120, 320, 200) style:UITableViewStyleGrouped];
	tableview1.delegate= self;
	tableview1.dataSource= self;
	[seg setSelectedSegmentIndex:0];
	[seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	
	btnnew = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[btnnew setTitle:@"Update Profile" forState:UIControlStateNormal];
	[btnnew addTarget:self action:@selector(update) forControlEvents:UIControlEventTouchUpInside];
	btnnew.frame = CGRectMake( 50, 350, 200, 50);
	[self.view addSubview:btnnew];
	
	
	
	self.labels = [NSArray arrayWithObjects:@"First Name", 
				   @"Last Name", 
				   @"Email", 
				   @"Phone Number", 
				   nil];
	
	self.placeholders = [NSArray arrayWithObjects:@"Sadaf", 
						 @"Perween", 
						 @"sadafper@gmail.com", 
						 @"+91-8055357857", 
						 nil];
	[self.view addSubview:tableview1];
		
}
	

-(void)update
{

UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Edit Profile" message:@"updated successfully" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
[alt show];
[alt release];

}

- (void)segmentAction:(id)sender

{
	
	
	if(seg.selectedSegmentIndex ==2)
	{
		UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Change password" message:@"module incomplete" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
		[alt show];
		[alt release];
		
		[tableview1 removeFromSuperview];
		[btnnew removeFromSuperview];
		
	
	}	
	if(seg.selectedSegmentIndex ==0)
	{
	[self.view addSubview:tableview1];
	
	}
	if(seg.selectedSegmentIndex ==1)
	{
	[self.view addSubview:tableview1];
	
	}
	
	 
	 
}

- (void)configureCell:(ELCTextfieldCell *)cell atIndexPath:(NSIndexPath *)indexPath {
	
	cell.leftLabel.text = [self.labels objectAtIndex:indexPath.row];
	cell.rightTextField.placeholder = [self.placeholders objectAtIndex:indexPath.row];
	cell.indexPath = indexPath;
	cell.delegate = self;
	
	
}

	


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
	/*
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier] autorelease];
		
	}
   	
	if(seg.selectedSegmentIndex == 0)
	{
	
		
	cell.textLabel.text = @"hello"; 
		
		
	}

	else {
		
	
*/

   static NSString *CellIdentifier = @"Cell";
    
    ELCTextfieldCell *cell = (ELCTextfieldCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ELCTextfieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	[self configureCell:cell atIndexPath:indexPath];
	


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
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

#pragma mark ELCTextFieldCellDelegate Methods

-(void)textFieldDidReturnWithIndexPath:(NSIndexPath*)indexPath {
			
		[[(ELCTextfieldCell*)[tableview1 cellForRowAtIndexPath:indexPath] rightTextField] resignFirstResponder];
	
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
