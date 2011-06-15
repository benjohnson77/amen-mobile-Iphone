//
//  pendingDetails.h
//  MainView
//
//  Created by Najam on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface pendingDetails : UIViewController<UITextFieldDelegate> {
	IBOutlet UIImageView *img;
	IBOutlet UILabel *lbname ,*lbemail;
	IBOutlet UIButton *btaccept ,*btnreject;
	NSString *friendid;
}
@property(nonatomic,retain)IBOutlet UIImageView *img;
@property(nonatomic,retain)IBOutlet UILabel *lbname ,*lbemail;
@property(nonatomic,retain)IBOutlet UIButton *btaccept ,*btnreject;
-(IBAction)accept;
-(IBAction)reject;
@end
