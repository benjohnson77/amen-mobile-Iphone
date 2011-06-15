//
//  mapview.h
//  mapviewdemo1
//
//  Created by Dipti Y on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<MapKit/MapKit.h>
#import"AddressAnnotation.h"



@interface mapview : UIViewController<MKMapViewDelegate,UITextFieldDelegate>
{

	
	UITextField *addfield;
	UIButton *gobtn;
	MKMapView *map1;
	NSString *locationstring, *location1;
	UIButton *hybridbtn , *standardbtn;
	AddressAnnotation *addannotation;
	
	
	}
@property(nonatomic , retain) UITextField *addfield;
-(CLLocationCoordinate2D)addresslocation;
-(void)showdata;
-(void)sethybrid;
-(void)setstandard;
-(void)showdetails;
-(void)showaddress;
-(id)initwithString:(NSString *)locstring;

@end
