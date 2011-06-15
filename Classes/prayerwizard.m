//
//  prayerwizard.m
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "prayerwizard.h"

#import"MainViewAppDelegate.h"
#import"userhomepage.h"
#import"startupPage.h"


@implementation prayerwizard
@synthesize title1 ,desc , location ,type, post ,reset, txttitle ,txtdesc ,txtloc , txttype;
@synthesize CLController;




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
	self.title = @"New Prayer";
	
	CLController = [[CoreLocationController alloc] init];
	CLController.delegate = self;
	[CLController.locMgr startUpdatingLocation];
	
	txtloc.delegate= self;
	txtdesc.delegate = self;
	txttitle.delegate = self;
	txttype.delegate =self;
	self.navigationItem.hidesBackButton = YES;
	
	UIBarButtonItem *btnpost = [[UIBarButtonItem alloc]initWithTitle:@"POST" style:UIBarButtonItemStyleBordered target:self action:@selector(postprayer)];
	self.navigationItem.rightBarButtonItem = btnpost;
	[btnpost release];
	UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
							   
																		target:self action:@selector(gohome)];
	self.navigationItem.leftBarButtonItem = cancel;
	[cancel release];
	
	
}
-(void)gohome
{

	startupPage *l1 = [[startupPage alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];
	[l1 release];
}
- (void)locationUpdate:(CLLocation *)location {
	
	
	
	  lati  = location.coordinate.latitude ;
	 longi = location.coordinate.longitude;
	
	
	// NSLog(@"Location: %@", [location description]);
	// locLabel.text = [location description];
}

- (void)locationError:(NSError *)error {
	//locLabel.text = @"error";
	//locLabel.text = [error description];
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

-(IBAction)postprayer

{
	
	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/create_prayer.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	//[urlRequest setValue:@"kedar1" forHTTPHeaderField:@"name"];
	NSString *title2 ,*desc1 ,*lang ,*lat;
	title2 = txttitle.text;
	desc1 = txtdesc.text;
	lang =  [NSString stringWithFormat: @"%f", longi];
	lat =   [NSString stringWithFormat:@"%f", lati];
	
	NSURLResponse* response;
	NSError* error = nil;
	
	NSString *postString = [NSString stringWithFormat:@"prayer[title]=%@&&prayer[description]=%@&&prayer[lang]=%@&&prayer[lat]=%@",title2,desc1,lang,lat];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
	NSString *str2 = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
	NSLog(@"string  app data in pryaer xml = %@", str2);
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"post" message:@"post succesfully" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];
	
	
	startupPage *l1 = [[startupPage  alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];
	[l1 release];
	
	
	
	/*
	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@" new prayer submitted");
		
		
		UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"post" message:@"post succesfully" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
		[alt show];
		[alt release];
		userhomepage *l1 = [[userhomepage alloc]init];
		[self.navigationController pushViewController:l1 animated:NO];
		[l1 release];
		
		
		//responseData = [[NSMutableData alloc] init];
	}
	
	
	*/
	
	
	
	
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	// [responseData setLength:0];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	
	
	NSString *str1 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"new prayer response = %@", str1);
	
    
	
		
}






- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// [[NSAlert alertWithError:error] runModal];
	
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
	/*
	// Once this method is invoked, "responseData" contains the complete result
	int statusCode = [request responseStatusCode];
	NSString *statusMessage = [request responseStatusMessage];
	if([statusMessage isEqualToString:@"HTTP/1.1 201 Created"] )
	{
	}	
	
	
	NSLog(@"satatus code = %d", statusCode);
	//NSLog(@"message= %@" , statusMessage);  */
}




-(IBAction)resetpost

{
txtloc.text = @"";
	txtdesc.text  =@"";
	
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
	[textView resignFirstResponder];
	return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
	
}

@end
