//
//  pendingDetails.m
//  MainView
//
//  Created by Najam on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "pendingDetails.h"
#import"MainViewAppDelegate.h"
#import"userhomepage.h"



@implementation pendingDetails
@synthesize img, lbname ,lbemail, btaccept , btnreject;


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
	
	MainViewAppDelegate *app = [[UIApplication  sharedApplication]delegate];
	NSString *name = app.pdata.loginname;
	NSString *email = app.pdata.email;
	NSString *imageurl= app.pdata.imageurl;
	lbname.text =name;
	lbemail.text= email;
	
	NSString *yourString = [NSString stringWithFormat:@"%@",imageurl];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	
	NSString *param = yourString;
	
	NSString *encodedParam = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSString *urlString = [NSString stringWithFormat: @"%@", encodedParam];
	NSURL *url = [NSURL URLWithString:urlString];
	UIImage *image = [[UIImage imageWithData: [NSData dataWithContentsOfURL: url]] retain];
	img.image =image;
	
	
	UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone  target:self action:@selector(finished)];
	self.navigationItem.rightBarButtonItem =done;
	[done release];
	
}

-(void)finished
{

	userhomepage *mv = [[userhomepage alloc]init];
	
	[self.navigationController pushViewController:mv animated:NO];
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
-(IBAction)accept
{
	 MainViewAppDelegate  *app = [[UIApplication sharedApplication]delegate];
	
	friendid = app.pdata.userid;
	
	NSURL *url = [NSURL URLWithString:@"http://192.168.1.19:3001/api/accept_invitation.xml"];
	NSString *userid , *accept;
	userid = app.userid;
	accept =@"1";
		
}
-(IBAction)reject
{

	
	 MainViewAppDelegate  *app = [[UIApplication sharedApplication]delegate];
	
	friendid = app.pdata.userid;
	
	NSURL *url = [NSURL URLWithString:@"http://192.168.1.19:3001/api/accept_invitation.xml"];
	NSString *userid , *accept;
	userid = app.userid;
	accept =@"0";
	
		
}






@end
