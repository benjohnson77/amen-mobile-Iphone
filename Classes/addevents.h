//
//  addevents.h
//  MainView
//
//  Created by Najam on 08/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>


@interface addevents : UIViewController< UINavigationBarDelegate, UITableViewDelegate,UITableViewDataSource, EKEventEditViewDelegate, UINavigationControllerDelegate, UIActionSheetDelegate> 
	
	{
		
		

	
	EKEventViewController *detailViewController;
	EKEventStore *eventStore;
	EKCalendar *defaultCalendar;
	NSMutableArray *eventsList;
		UITableView *tableView;
}

@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic, retain) EKCalendar *defaultCalendar;
@property (nonatomic, retain) NSMutableArray *eventsList;
@property (nonatomic, retain) EKEventViewController *detailViewController;
@property(nonatomic,retain)UITableView *tableView;

- (NSArray *) fetchEventsForToday;
- (IBAction) addEvent:(id)sender;





@end
