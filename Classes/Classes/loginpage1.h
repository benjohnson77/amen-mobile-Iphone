//
//  loginpage1.h
//  uicontrols
//
//  Created by Najam on 21/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface loginpage1 : UIViewController<UITextFieldDelegate > {
	IBOutlet UITextField *txtname ,*txtpassword;
	IBOutlet UIButton *btnlogin, *btnregister, *btnforgot;
	IBOutlet UIActivityIndicatorView *act;
	IBOutlet UILabel *lbmain;
	NSData *responseData;
	
}
@property(nonatomic,retain)IBOutlet UITextField *txtname ,*txtpassword;
@property(nonatomic ,retain)IBOutlet UIButton *btnlogin ,*btnforgot ,*btnregister;
@property(nonatomic ,retain)IBOutlet UIActivityIndicatorView *act;
@property(nonatomic,retain)IBOutlet UILabel *lbmain;


-(IBAction)login;
-(IBAction)fogot;
-(IBAction)registerNew;

@end
