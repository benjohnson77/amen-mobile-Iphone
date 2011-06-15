//
//  invitefriend.m
//  MainView
//
//  Created by Najam on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "invitefriend.h"
#import"userhomepage.h"


@implementation invitefriend
@synthesize  lbtitle, lbmain,txtemail,btsend;



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
-(IBAction)sendinvitation
{

	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/friend_request"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSString *email;
	email = txtemail.text;	
	NSString *postString = [NSString stringWithFormat:@"user[email]=%@",email];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@" new user Request submitted");
		//responseData = [[NSMutableData alloc] init];
	}
	
	
	
	
	
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	// [responseData setLength:0];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	
	NSString *str1 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"invite response = %@", str1);
	
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Invite" message:str1 delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];
	txtemail.text =@"";
	
	
		
}






- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// [[NSAlert alertWithError:error] runModal];
	
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Once this method is invoked, "responseData" contains the complete result
	
}






// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
   // [super viewDidLoad];
	txtemail.delegate =self;
	self.navigationItem.hidesBackButton = YES;
	UIBarButtonItem *done  = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(reloadmainpage)];
	self.navigationItem.rightBarButtonItem = done;
	[done release];
	
}

-(void)reloadmainpage
{

	userhomepage *m = [[userhomepage alloc]init];
	[self.navigationController pushViewController:m animated:NO];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)textFieldDidEndEditing:(UITextField *)textField


{
	if(textField == txtemail)
	{
		NSArray *validateAtSymbol = [txtemail.text componentsSeparatedByString:@"@"];
		NSArray *validateDotSymbol = [txtemail.text componentsSeparatedByString:@"."];
		if(([validateAtSymbol count] != 2) || ([validateDotSymbol count] < 2)) {
			
			UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"Invalid EMail Address" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
			[alertView show];
			[alertView release];
			// whereClicked = 1;
			
		}
		
	}
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
