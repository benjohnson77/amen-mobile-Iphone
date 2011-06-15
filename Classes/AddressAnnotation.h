//
//  AddressAnnotation.h
//  mapviewdemo1
//
//  Created by Dipti Y on 1/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<MapKit/MapKit.h>



@interface AddressAnnotation : NSObject<MKAnnotation>
{

	
	CLLocationCoordinate2D coordinate;
	NSString *mtitle;
}
@property(nonatomic , readonly)CLLocationCoordinate2D coordinate;
@property(nonatomic , retain)NSString *mtitle;
-(id)initWithCoordinate:(CLLocationCoordinate2D) c;

@end
