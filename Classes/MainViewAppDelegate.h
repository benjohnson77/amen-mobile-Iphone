//
//  MainViewAppDelegate.h
//  MainView
//
//  Created by Najam on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pendingdata.h"
#import"PrayerData.h"
#import"CommentData.h"


@interface MainViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	NSString *userid , *loginname, *groupname;
	NSData  *recievedata;
	pendingdata *pdata1;
	PrayerData *prayer1;
	CommentData *comment1;
	UIActivityIndicatorView *act;
	

	     }

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property(nonatomic ,retain)NSString *userid , *loginname ,*groupname ;
@property(nonatomic,retain)NSData *recievedata;
@property(nonatomic,retain)pendingdata *pdata;
@property(nonatomic,retain)PrayerData *prayer1;
@property(nonatomic ,retain)CommentData *comment1;




@end

