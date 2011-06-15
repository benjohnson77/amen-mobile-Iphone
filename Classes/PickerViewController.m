//
//  PickerViewController.m
//  PickerDemo
//
//  Created by System Administrator on 9/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PickerViewController.h"
#import"MainViewAppDelegate.h"
#import"grouplist.h"
#import"startupPage.h"


@implementation PickerViewController

-(id)init
{
	if(self==[super init])
	{
		picker =[[UIPickerView alloc]init];//WithFrame:CGRectMake(10, 10, 300,)];
		picker.delegate=self;
		self.title = @"your Group";
		//self.navigationItem.hidesBackButton = YES;
		picker.showsSelectionIndicator=YES;
		colors =[[NSMutableArray alloc]initWithObjects:@"group1", @"group2", @"Group3", @"group4", @"group5", nil];
		UIBarButtonItem *btnhome = [[UIBarButtonItem alloc]initWithTitle:@"HOME" style:UIBarButtonItemStyleBordered  target:self action:@selector(gohome)];
		self.navigationItem.rightBarButtonItem = btnhome;
		[btnhome release];
		
		UIButton *btnnew = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[btnnew setTitle:@"Create New Group" forState:UIControlStateNormal];
		[btnnew addTarget:self action:@selector(newgroup) forControlEvents:UIControlEventTouchUpInside];
		btnnew.frame = CGRectMake( 50, 300, 200, 50);
		[self.view addSubview:btnnew];

		
	}
	return self;
}

-(void)newgroup
{

	
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"New Group" message:@"Module Incomplete" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok",nil];
	[alt show];
	[alt release];
	
}

-(void)gohome
{
	startupPage *s1 = [[startupPage alloc]init];
	[self.navigationController pushViewController:s1 animated:NO];
	[s1 release];


}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
	MainViewAppDelegate *app = [[UIApplication sharedApplication]delegate];
	
	//lblSelected =[[UILabel alloc]initWithFrame:CGRectMake(20, 300, 200, 40)];
	
	app.groupname = [colors objectAtIndex:row];
	// app.groupname  = [NSString stringWithFormat:[colors objectAtIndex:row]];
	grouplist *g1 = [[grouplist alloc]init];
	[self.navigationController pushViewController:g1 animated:YES];
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//	UIView *v1=[[UIView alloc]init];
//	UILabel *lblText=[[UILabel alloc]init];//WithFrame:CGRectMake(0, 0, 100, 30)];
//	lblText.text=[colors objectAtIndex:row];
//	[v1 addSubview:lblText];
//	[picker addSubview:v1];
//	return v1;
//}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

	//UILabel *lblText=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 20)];
	return [colors objectAtIndex:row];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [colors count];
}



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	[self.view addSubview:picker];
	[self.view addSubview:lblSelected];
	
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
