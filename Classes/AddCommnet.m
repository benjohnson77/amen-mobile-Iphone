    //
//  AddCommnet.m
//  MainView
//
//  Created by Najam on 31/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddCommnet.h"
#import"TextViewCell.h"


#import"prayerDetails.h"


#define kUITextViewCellRowHeight 150.0
@implementation AddCommnet

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
	self.title =@"Comments";
	
	
	TextViewCell *cell1 = (TextViewCell *) [ tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	//comment  = [cell1.textView text];
	cell1.textView.text = @"";
	
	
	UIBarButtonItem *post = [[UIBarButtonItem alloc] initWithTitle:@"POST" style:UIBarButtonItemStyleBordered  target:self action:@selector(addcomment)];
	self.navigationItem.rightBarButtonItem = post;
	[post release];
	
	
	UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel  target:self action:@selector(cancelpost)];
	self.navigationItem.leftBarButtonItem = cancel;
	[cancel release];
	tableview =   [ [UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStyleGrouped];
	tableview.dataSource = self;
	tableview.delegate = self;
	[self.view addSubview:tableview];
	
	
}


-(void)addcomment
{
	app = [[UIApplication sharedApplication]delegate];
	
	
	TextViewCell *cell1 = (TextViewCell *) [ tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	comment  = [cell1.textView text];
	
	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/add_comment.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSString *postString = [NSString stringWithFormat:@"prayer_id=%@&comment= %@",app.prayer1.prayerid,comment];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	
	NSURLResponse* response;
	NSError* error = nil;
	
	NSData *result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
	
	
	prayerDetails *p1 = [[prayerDetails alloc]initWithString:app.prayer1.prayerid];
	[self.navigationController pushViewController:p1 animated:NO];
	
	
	
}




-(void)cancelpost
{
	
	app = [[UIApplication sharedApplication]delegate];
	prayerDetails *p1 = [[prayerDetails alloc]initWithString:app.prayer1.prayerid];
	[self.navigationController pushViewController:p1 animated:NO];
	
	
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}



- (void)textViewDidEndEditing:(UITextView *)textView
{
	
	
	TextViewCell *cell = (TextViewCell *) [ tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	comment =   [cell.textView text];
	NSLog(@"comment %@",comment);
	
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
