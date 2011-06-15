//
//  showProfile.h
//  MainView
//
//  Created by Najam on 04/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"ELCTextfieldCell.h"


@interface showProfile : UIViewController<ELCTextFieldDelegate,UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UISegmentedControl *seg;
	IBOutlet UIImageView *img;
	IBOutlet UILabel *loginname;
	
	NSArray *labels,*label1, *passwordlabel;
	NSArray *placeholders ,*fieldresult ,*pwdplaceholder;
	
	UITableView *tableview1,*tableview2;
	UIButton *btnnew;

}


@property(nonatomic,retain)IBOutlet UISegmentedControl *seg;
@property(nonatomic,retain)IBOutlet UIImageView *img;
@property(nonatomic,retain)IBOutlet UILabel *loginname;




@property (nonatomic, retain) NSArray *labels,*label1,*passwordlabel,*pwdplaceholder;
@property (nonatomic, retain) NSArray *placeholders ,*fieldresult;


@end
