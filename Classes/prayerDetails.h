//
//  prayerDetails.h
//  uicontrols
//
//  Created by Najam on 29/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"CommentXML.h"

@interface prayerDetails : UIViewController <UITableViewDelegate ,UITableViewDataSource,UITextFieldDelegate>{
	IBOutlet UIImageView *image ;
	IBOutlet UITextView *txtprayer ;
	IBOutlet UISegmentedControl *seg;
	UITableView *tableView;
	CommentXML *s;
	NSString *prayerid;
	 IBOutlet  UISearchBar *searchbar;
	UITextField *txtcomment  ;
	
	UITextView *txtcommentpost;
	NSData *result;
	NSMutableArray *titlearray ,*valuearray;
	
	
}
@property(nonatomic ,retain)IBOutlet UIImageView *image ;
@property(nonatomic,retain)IBOutlet UITextView *txtprayer;

@property(nonatomic,retain)IBOutlet UISegmentedControl *seg;
@property(nonatomic,retain)IBOutlet  UISearchBar *searchbar;
@end
