//
//  forgot.m
//  uicontrols
//
//  Created by Najam on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "forgot.h"
#import"loginpage1.h"


@implementation forgot
@synthesize  lbtitle ,lbemail ,lberrormsg,txteail,btnsubmit, btnlogin;


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"AMENMobile";
	self.navigationItem.hidesBackButton= YES;
	
	[txteail becomeFirstResponder];
	txteail.delegate= self;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	
	
	
txteail.text =@"";

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
-(IBAction)login

{
	loginpage1 *l1 = [[loginpage1 alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];
}
-(IBAction)submit
{

}


@end
