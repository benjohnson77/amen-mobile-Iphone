//
//  PrayerData.h
//  testconnection
//
//  Created by Najam on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PrayerData : NSObject {
	
	NSString *prayerid ,*title1 , *description , *lat ,*longt,*imageurl,*comment_counts, *ptime, *prayer_viewd , *prayer_prayed ;
	

} @property(nonatomic ,retain)NSString *prayerid ,*title1 , *description , *lat , *longt,*imageurl,*comment_counts, *ptime,*prayer_viewd , *prayer_prayed;

@end
