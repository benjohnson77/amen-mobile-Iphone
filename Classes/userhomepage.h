//
//  userhomepage.h
//  uicontrols
//
//  Created by Najam on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface userhomepage : UIViewController {
	IBOutlet UIButton *btnprofile ,*btnfriends ,*group ,*prayers ,*events, *btnmap,*btnreminder;
	IBOutlet UILabel   *lbprofile ,*lbfriends ,*lbgroup ,*lbprayers ,*lbevents, *lbtnmap,*lbreminder;
}

@property(nonatomic ,retain)IBOutlet UIButton *btnprofile ,*btnfriends ,*group ,*prayers ,*events, *btnmap,*btnreminder;
@property(nonatomic,retain)IBOutlet UILabel   *lbprofile ,*lbfriends ,*lbgroup ,*lbprayers ,*lbevents, *lbtnmap,*lbreminder;


-(IBAction)showprofile;
-(IBAction)showfrinds;
-(IBAction)showgroup;
-(IBAction)showevents;
-(IBAction)showmap;
-(IBAction)showreminder;
-(IBAction)showprayers;
@end
