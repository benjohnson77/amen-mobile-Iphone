//
//  newuser.m
//  uicontrols
//
//  Created by Najam on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "newuser.h"

#import "loginpage1.h"


@implementation newuser
@synthesize img,lbtitle ,lbuserid ,lbemail,lbpassword, lbconfirm,btnregister, btnlogin,txtuserid ,txtemail, txtpassword ,txtconfirm;
@synthesize xmlobj;
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
	self.title =@"AMENMobile";
	txtemail.delegate = self;
	txtpassword.delegate = self;
	
	txtuserid.delegate = self;
	txtconfirm.delegate = self;
	
	self.navigationItem.hidesBackButton =YES;
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

-(IBAction)registernew
{
	
	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/create_user.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	//[urlRequest setValue:@"kedar1" forHTTPHeaderField:@"name"];
		NSString *user ,*email ,*pass ,*confpass;
	user = txtuserid.text;
	email = txtemail.text;
	
	pass = txtpassword.text;
	confpass = txtconfirm.text;
	
	NSString *postString = [NSString stringWithFormat:@"user[login]=%@&&user[email]=%@&&user[password]=%@&&user[password_confirmation]=%@",user,email,pass,confpass];
	
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
	NSLog(@"new user response = %@", str1);
	
    
	
	
	parser = [[NSXMLParser alloc]initWithData:data];
	
	parser.delegate = self;
	
	[parser parse];
	NSString *msg = [xmlobj objectAtIndex:0];
	msg = [msg stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	msg = [msg stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Account" message:msg delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];
	loginpage1 *l1 = [[loginpage1 alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];
	
	
	NSLog(@"message = %@" ,msg);
	
	
}


-(IBAction)login
{
	loginpage1 *l1 = [[loginpage1 alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];

}



- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// [[NSAlert alertWithError:error] runModal];
	
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Once this method is invoked, "responseData" contains the complete result
	
}





- (void)textFieldDidEndEditing:(UITextField *)textField


{
	if(textField == txtemail)
	{
		
		NSString *emailString = textField.text; // storing the entered email in a string. 
		
		// Regular expression to checl the email format. 
		NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
		
		NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg]; 
		
		if (([emailTest evaluateWithObject:emailString] != YES) || [emailString isEqualToString:@""]) 
		{ 
			UIAlertView *loginalert = [[UIAlertView alloc] initWithTitle:@" Enter Email in" message:@"abc@example.com format" delegate:self 
													   cancelButtonTitle:@"OK" otherButtonTitles:nil]; 
			
			[loginalert show]; 
			[loginalert release]; 
		} 	}
	
	
	
	
/*	
	
	
*/	
}



- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSString *errerstring = [NSString stringWithFormat:@"unable to downlaod fiel",[parseError code]];
	NSLog(@" error  parsing xmk" , errerstring);
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"error laoding xml" message:errerstring delegate:self  cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
	
	[alt show];
	
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	
	if([elementName isEqualToString:@"users"])
	{
		currentnodecontent = [[NSMutableString alloc]init];
		
		
	}else 
		if ([elementName isEqualToString:@"user"]) 
		{
			xmlobj = [[NSMutableArray alloc]init];	
		}
	
	
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	
	
	if([elementName isEqualToString:@"message"])
		
	{
		NSString *str = currentnodecontent;
		str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		str = [str stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
		
		loginmsg = str;
	}
	
	else if ([elementName isEqualToString:@"user"])
	{
		[xmlobj addObject:loginmsg];
		
	}
	
	[currentnodecontent release];
	currentnodecontent = nil;
	currentnodecontent = [[ NSMutableString alloc]init];
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	[currentnodecontent appendString: string];
	
}	  



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if(textField == txtconfirm)
	{
		NSString *pass = txtpassword.text;
		NSString   *confpass = txtconfirm.text;
		
		
		if([pass isEqualToString:confpass] )
		{
			[textField resignFirstResponder];
			return YES;		
		
	}
	else {
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"password should be same" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
		[alertView show];
		[alertView release];
		
		[textField resignFirstResponder];
	}
	}
	
	[textField resignFirstResponder];
	return YES; 	
	
	
}

 -(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	
	if(textField == txtpassword)
	{
		txtpassword.secureTextEntry =YES;
		
	}
	if(textField == txtconfirm)
	{
		txtconfirm.secureTextEntry =YES;
	}
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	
	
		
	textField.text = @"";
}

- (void)dealloc {
    [super dealloc];
}


@end
