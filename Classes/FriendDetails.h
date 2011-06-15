//
//  FriendDetails.h
//  uicontrols
//
//  Created by Najam on 25/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"prayerXML.h"


@interface FriendDetails : UIViewController<UITableViewDelegate ,UITableViewDataSource> {

	
	UISegmentedControl *seg;
	UITableView *tableView;
	UIImageView *img;
	UILabel *lbtitle;
	prayerXML *s;
	NSMutableArray *arr1;
	NSString *fid1 ,*flogin1 ,*femail1 ,*fimage1;

	
}
@property(nonatomic ,retain)NSMutableArray *arr1;


-(id)initWithString:(NSString *)fid :(NSString *) flogin :(NSString *)femail :(NSString *)fimage;
@end
