//
//  invitefriend.h
//  MainView
//
//  Created by Najam on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface invitefriend : UIViewController<UITextFieldDelegate> {

	IBOutlet  UILabel *lbtitle, *lbmain;
	IBOutlet UITextField *txtemail;
	IBOutlet UIButton *btsend;
	
}
@property(nonatomic ,retain)IBOutlet  UILabel *lbtitle, *lbmain;
@property(nonatomic,retain)IBOutlet UITextField *txtemail;
@property(nonatomic ,retain)IBOutlet UIButton *btsend;
-(IBAction)sendinvitation;

@end
