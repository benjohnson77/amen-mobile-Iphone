//
//  userhomepage.m
//  uicontrols
//
//  Created by Najam on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "userhomepage.h"
#import"FriendList.h"
#import"loginpage1.h"
#import"prayerlist.h"
#import"PickerViewController.h"
#import"showProfile.h"
#import"addevents.h"
#import"mapview.h"





@implementation userhomepage
@synthesize btnprofile ,btnfriends ,group ,prayers ,events,btnmap,btnreminder;
@synthesize lbprofile ,lbfriends ,lbgroup ,lbprayers ,lbevents, lbtnmap,lbreminder;

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
	
	self.title = @"AMENMobile";
	
	UIBarButtonItem *logout = [[UIBarButtonItem alloc]initWithTitle:@"Logout" 
															  style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];
	self.navigationItem.leftBarButtonItem = logout;
	[logout release];
							   
}

-(void)logout
{
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/logout.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	//[urlRequest setValue:@"kedar1" forHTTPHeaderField:@"name"];
	
	
	//[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@"Request submitted");
		//responseData = [[NSMutableData alloc] init];
	}
	
	loginpage1 *l1 = [[loginpage1 alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];

}


-(IBAction)showprofile
{
	showProfile *s1 = [[showProfile alloc]init];
	[self.navigationController pushViewController:s1 animated:NO];
	[s1 release];

}
-(IBAction)showfrinds
{
	
	FriendList *f1 = [[FriendList alloc]init];
	
	//showfriends *f1 = [[showfriends alloc]initWithStyle:UITableViewStylePlain];
	[self.navigationController pushViewController:f1 animated:NO];
	[f1 release];
}
-(IBAction)showgroup
{
	PickerViewController *p1  = [[PickerViewController alloc]init];
	[self.navigationController pushViewController:p1 animated:NO];
	[p1 release];

}



-(IBAction)showevents{

	addevents *a1 = [[addevents alloc]init];
	[self.navigationController pushViewController:a1 animated:NO];
	[a1 release];
}

-(IBAction)showmap

{

	
	mapview *v1 = [[mapview alloc]initwithString:@"pune"];
				   [self.navigationController pushViewController:v1 animated:NO];
				   [v1 release];
}

-(IBAction)showreminder

{
	addevents *a1 = [[addevents alloc]init];
	[self.navigationController pushViewController:a1 animated:NO];
	[a1 release];

}

-(IBAction)showprayers

{
	prayerlist *p1 = [[prayerlist alloc]initWithStyle:UITableViewStyleGrouped];
	[self.navigationController pushViewController:p1 animated:NO];
	
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
