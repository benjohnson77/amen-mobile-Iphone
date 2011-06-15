    //
//  Searchfriends.m
//  MainView
//
//  Created by Najam on 25/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Searchfriends.h"
#import"invitefriend.h"


@implementation Searchfriends
@synthesize mySearchBar;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];	// use the table view background color
	self.title =@"Search friends";
	self.mySearchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 44.0)] autorelease];
	//self.mySearchBar.delegate = self;
	self.mySearchBar.showsCancelButton = YES;
	
	mySearchBar.text = @"Find Friend here...";
	//self.searchDisplayController.
	//self.searchDisplayController.searchBar.showCancelButton = YES;
	
	// note: here you can also change its "tintColor" property to a different UIColor
	/*
	// create a bordered style button with custom title
	UIBarButtonItem *invite = [[[UIBarButtonItem alloc] initWithTitle:@"Invite"
															  style:UIBarButtonItemStyleBordered	
															 target:self
															 action:@selector(showinvite)] autorelease];
	self.navigationItem.rightBarButtonItem = invite;
	[invite release];
	*/
	
	
	UIBarButtonItem  *invite = [[UIBarButtonItem alloc]initWithTitle:@"Invite" style:UIBarButtonItemStyleBordered target:self action:@selector(showinvite)];
	self.navigationItem.rightBarButtonItem = invite;
	[invite release];
	 	[self.view addSubview: self.mySearchBar];
	
}
-(void)showinvite
{
	invitefriend *n1 = [[invitefriend alloc]init];
	[self.navigationController pushViewController:n1 animated:YES];
	 
	/*
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Friends" message:@"No friends Added" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];
	
*/

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
