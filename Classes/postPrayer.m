    //
//  postPrayer.m
//  MainView
//
//  Created by Najam on 04/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "postPrayer.h"
#import"TextViewCell.h"
#import"startupPage.h"
#import"CoreLocationController.h"

#define kUITextViewCellRowHeight 150.0
@implementation postPrayer
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title =@"New Prayer";
	
	
	CLController = [[CoreLocationController alloc] init];
	CLController.delegate = self;
	[CLController.locMgr startUpdatingLocation];
	
	
	
	UIBarButtonItem *post = [[UIBarButtonItem alloc] initWithTitle:@"POST" style:UIBarButtonItemStyleBordered  target:self action:@selector(postprayer)];
	self.navigationItem.rightBarButtonItem = post;
	[post release];
	
	
	UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  target:self action:@selector(cancelpost)];
	self.navigationItem.leftBarButtonItem = cancel;
	[cancel release];
	
	title1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 310, 40)];
	title1.backgroundColor = [UIColor whiteColor];
	title1.textColor= [UIColor  darkTextColor];
	//title1.borderStyle = 
	title1.placeholder = @"Enter title here..";
	tableview1 =   [ [UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, 480) style:UITableViewStyleGrouped];
	tableview1.dataSource = self;
	tableview1.delegate = self;
	[self.view addSubview:tableview1];
	[self.view addSubview:title1];
	
	
}


- (void)locationUpdate:(CLLocation *)location {
	
	
	
	lati  = location.coordinate.latitude ;
	longi = location.coordinate.longitude;
}
	
-(void)postprayer
{



	TextViewCell *cell1 = (TextViewCell *) [ tableview1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	description  = [cell1.textView text];
	if([description isEqualToString: @""])
	{
		
		UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Add Prayer" message:@"Please Enter prayer" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
		[alt show];
		[alt release];
		
	
	}
	else{
	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/create_prayer.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	//[urlRequest setValue:@"kedar1" forHTTPHeaderField:@"name"];
	NSString *lang ,*lat ;
	ptitle  = title1.text;
	
	lang =  [NSString stringWithFormat: @"%f", longi];
	lat =   [NSString stringWithFormat:@"%f", lati];
	
	NSURLResponse* response;
	NSError* error = nil;
	
	NSString *postString = [NSString stringWithFormat:@"prayer[title]=%@&&prayer[description]=%@&&prayer[lang]=%@&&prayer[lat]=%@",ptitle,description,lang,lat];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
	NSString *str2 = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
	//NSLog(@"string  app data in pryaer xml = %@", str2);
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"post" message:@"post succesfully" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];
	
	
	startupPage *l1 = [[startupPage  alloc]init];
	[self.navigationController pushViewController:l1 animated:NO];
		[l1 release];
	}
}

-(void)cancelpost
{
	startupPage *s1 = [[startupPage alloc]init];
	[self.navigationController pushViewController:s1 animated:NO];
	[s1 release];


}

- (void)textViewDidEndEditing:(UITextView *)textView
{
	
	
	TextViewCell *cell = (TextViewCell *) [ tableview1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	description =   [cell.textView text];
	//NSLog(@"comment %@",);
	
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


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	
	
	
	textField.text = @"";
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CGFloat result;
	result = kUITextViewCellRowHeight;	
	return result;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TextViewCell *cell = (TextViewCell *) [tableView dequeueReusableCellWithIdentifier:kCellTextView_ID];
	
    if (cell == nil) {
		cell = [TextViewCell createNewTextCellFromNib];
    }
    
    // Set up the cell...
	//cell.textView.text = self.comment;
	//cell.textView.backgroundColor = [UIColor whiteColor];
	[cell.textView becomeFirstResponder];
	cell.textView.delegate = self;
	
    return cell;
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
