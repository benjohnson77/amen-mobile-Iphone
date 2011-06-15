//
//  startupPage.h
//  MainView
//
//  Created by Najam on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"prayerXML.h"
#import"MainViewAppDelegate.h"



@interface startupPage : UIViewController<UITableViewDelegate ,UITableViewDataSource>
{
	UISegmentedControl		*barStyleSegControl;
	
	UIToolbar				*toolbar;	// created programmatically, not in IB
	
	UIBarButtonSystemItem	currentSystemItem;
	
	UITableView *tableView1;
	prayerXML *s;
	
	MainViewAppDelegate *app;
	UIImageView *imageView;
}
@property(nonatomic,retain)UIImageView *imageView;
@end
