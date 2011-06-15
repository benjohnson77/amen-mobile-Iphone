//
//  FriendList.h
//  MainView
//
//  Created by Najam on 28/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"friendsXML.h"


@interface FriendList : UIViewController<UITableViewDelegate,UITableViewDataSource> {

	
	UISegmentedControl		*barStyleSegControl;
	
	UIToolbar				*toolbar;	// created programmatically, not in IB
	
	UIBarButtonSystemItem	currentSystemItem;
	
	UITableView *tableView;
	friendsXML *s;
	
	
	UIImageView *imageView;
}

@end
