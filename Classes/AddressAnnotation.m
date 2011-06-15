//
//  AddressAnnotation.m
//  mapviewdemo1
//
//  Created by Dipti Y on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddressAnnotation.h"
#import"mapview.h"


@implementation AddressAnnotation
@synthesize coordinate;
@synthesize mtitle;


-(NSString *)subtitle
{
return @"subtitel";
	
}

-(NSString *)title
{
	return self.mtitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c;

{

	coordinate = c;
	NSLog(@"%f  , %f ", c.latitude ,c.longitude);
	return self;
}
@end
