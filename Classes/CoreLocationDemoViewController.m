//
//  CoreLocationDemoViewController.m
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CoreLocationDemoViewController.h"

@implementation CoreLocationDemoViewController

@synthesize CLController;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	CLController = [[CoreLocationController alloc] init];
	CLController.delegate = self;
	[CLController.locMgr startUpdatingLocation];
}

- (void)locationUpdate:(CLLocation *)location {
	
	// NSLog(@"Location: %@", [location description]);
	// locLabel.text = [location description];
}

- (void)locationError:(NSError *)error {
	//locLabel.text = @"error";
	//locLabel.text = [error description];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return YES;
}

- (void)viewDidUnload {
}

- (void)dealloc {
	[CLController release];
    [super dealloc];
}

@end
