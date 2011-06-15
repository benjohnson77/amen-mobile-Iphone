//
//  loginpage1.m
//  uicontrols
//
//  Created by Najam on 21/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "loginpage1.h"

#import"startupPage.h"
#import"loginxml.h"
#import"MainViewAppDelegate.h"
#import"newuser.h"
#import"forgot.h"
#import"userhomepage.h"


@implementation loginpage1
@synthesize txtname ,txtpassword,btnlogin, btnforgot ,btnregister ,act,lbmain;


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
	txtname.delegate =self;
	txtpassword.delegate= self;
	self.title= @"AMENMobile";
	act.activityIndicatorViewStyle = YES;
	self.navigationItem.hidesBackButton =YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
	[textField resignFirstResponder];
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{

textField.text = @"";
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



-(IBAction)login
{
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/login.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	//[urlRequest setValue:@"kedar1" forHTTPHeaderField:@"name"];
	NSString *var1 = txtname.text;
	NSString *var2 = txtpassword.text;
	
	NSString *postString = [NSString stringWithFormat:@"name=%@&password=%@",var1,var2];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@"Request submitted");
		responseData = [[NSMutableData alloc] init];
	}
	
		
	
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   // [responseData setLength:0];
	
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   
	
	NSString *str1 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"new user message = %@", str1);
	MainViewAppDelegate  *app = [[UIApplication sharedApplication]delegate];
	
	// [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	app.recievedata =data;
	loginxml *l1 = [[loginxml alloc]init];
	NSString *str = app.userid;
	str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	str = [str stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
	
	NSString *str12 = app.loginname;
	str12 = [str12 stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	str12 = [str12 stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
	
	NSLog(@"ist  user id =%@",str);
	NSLog(@"password = %@", str12);
	
	if([str isEqualToString:@"0"] )
	{
		
		UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"login" message:@"login fail" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
		[alt show];
		[alt release];
		
		
	}
	
	else {
		
		
		//userhomepage *v1 = [[userhomepage alloc]init];
		startupPage *v1 = [[startupPage alloc]init];
		
		
		
		[self.navigationController pushViewController:v1 animated:NO];
		
		[v1 release];
	}
	
}


	
	

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// [[NSAlert alertWithError:error] runModal];
	
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Once this method is invoked, "responseData" contains the complete result
	
}




-(IBAction)fogot

{
	forgot *f1 = [[forgot alloc]init];
	[self.navigationController pushViewController:f1 animated:NO];
	[f1 release];
}
-(IBAction)registerNew
{
	newuser *n = [[newuser alloc]init];
	[self.navigationController pushViewController:n animated:YES];
	[n release];
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
