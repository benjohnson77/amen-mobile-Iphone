//
//  mapview.m
//  mapviewdemo1
//
//  Created by Dipti Y on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "mapview.h"
#import"AddressAnnotation.h"
#import<MapKit/MapKit.h>




@implementation mapview
@synthesize addfield;

-(id)initwithString:(NSString *)locstring
{
	[super init];
	location1 = locstring;
	
	map1 = [[MKMapView alloc]initWithFrame:CGRectMake(0, 60, 320, 480)];
	map1.mapType = MKMapTypeHybrid;
	map1.delegate= self;
	map1.scrollEnabled = YES;
	map1.zoomEnabled = YES;
	
	/*
	addfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 70, 50)];
	[addfield setBorderStyle:UITextBorderStyleRoundedRect];
	[addfield setBackgroundColor:[UIColor yellowColor]];
	addfield.delegate= self;
	*/
	gobtn = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
	gobtn.frame = CGRectMake(155, 0, 100, 55);
	[gobtn setTitle:@"go" forState:UIControlStateNormal];
	[gobtn addTarget:self action:@selector(showaddress) forControlEvents:UIControlEventTouchUpInside];
	
	hybridbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
	hybridbtn.frame = CGRectMake(50,430,70,30);
	[hybridbtn setTitle:@"hybrid" forState:UIControlStateNormal];
	[hybridbtn addTarget:self action:@selector(sethybrid) forControlEvents:UIControlEventTouchUpInside];
	
	
	standardbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
	standardbtn.frame = CGRectMake(200, 430, 70, 30);
	[standardbtn setTitle:@"standard" forState:UIControlStateNormal];
	[standardbtn addTarget:self action:@selector(setstandard) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:gobtn];
	[self.view addSubview:hybridbtn];
	[self.view addSubview:standardbtn];
	
	return self;
	
	
}


-(void)sethybrid
{
	map1.mapType = MKMapTypeHybrid;
}
-(void)setstandard
{
	map1.mapType = MKMapTypeStandard;
}


 -(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

-(void)showaddress
{
	//[addfield resignFirstResponder];
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta= 1;
	span.longitudeDelta = 1;
	CLLocationCoordinate2D location = [self addresslocation];
	region.span = span;
	region.center = location;
	if(addannotation != nil)
		
	{
		[map1 removeAnnotation:addannotation];
		[addannotation release];
		addannotation = nil;
		
	}
	
	addannotation = [[AddressAnnotation alloc]initWithCoordinate:location];
	addannotation.mtitle = location1;
	//[map1 addAnnotation:addannotation];
	[map1 addAnnotation:addannotation];
	
	[map1 setRegion:region animated:TRUE];
	[map1 regionThatFits: region];
	map1.delegate = self;
}

-(CLLocationCoordinate2D)addresslocation
{
	NSString *urlstring = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv" , [location1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	locationstring = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlstring]];
	NSArray *listitmes = [locationstring componentsSeparatedByString:@","];
	double latitude = 0.0;
	double longitude = 0.0;
	if([listitmes count] >= 4)
	{
		latitude = [[ listitmes objectAtIndex:2]doubleValue];
		longitude = [[listitmes objectAtIndex:3]doubleValue];
		
	}
	else
	{
		UIAlertView *alt= [[UIAlertView alloc]initWithTitle:@"error" message:@"error" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
		[alt show];
		[alt release];
		
	}
	
	CLLocationCoordinate2D location;
	location.latitude = latitude;
	location.longitude = longitude;
	return location;

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
	[self.view addSubview:map1];
	//[self.view addSubview:addfield];
	[self.view addSubview:gobtn];
	[self.view addSubview:hybridbtn];
	[self.view addSubview:standardbtn];
	
}


//Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	map1.delegate = self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKPinAnnotationView *annview  = [[ MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"current loc"];
	annview.pinColor = MKPinAnnotationColorPurple;
	annview.animatesDrop = YES;
	UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	
	rightbtn.frame = CGRectMake(0, 0, 23, 23);
	rightbtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	rightbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	[rightbtn addTarget:self action:@selector(showdetails) forControlEvents:UIControlEventTouchUpInside];
	return annview;
	
	
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}
-(void)showdetails
{

}

-(void)showdata
{
}



@end
