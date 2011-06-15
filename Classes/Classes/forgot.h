//
//  forgot.h
//  uicontrols
//
//  Created by Najam on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface forgot : UIViewController<UITextFieldDelegate> {
	IBOutlet UILabel *lbtitle ,*lbemail ,*lberrormsg;
	IBOutlet UITextField *txteail;
	IBOutlet UIButton *btnsubmit, *btnlogin;
	
	

}

@property(nonatomic,retain)IBOutlet UILabel *lbtitle ,*lbemail ,*lberrormsg;
@property(nonatomic,retain)IBOutlet UITextField *txteail;
@property(nonatomic,retain)IBOutlet UIButton *btnsubmit, *btnlogin;
-(IBAction)login;
-(IBAction)submit;

@end
