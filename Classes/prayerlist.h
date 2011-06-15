//
//  prayerlist.h
//  MainView
//
//  Created by Najam on 14/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"prayerXML.h"
#import"MainViewAppDelegate.h"



@interface prayerlist : UITableViewController {
	prayerXML *s;
	MainViewAppDelegate *app;
	
}

@end
