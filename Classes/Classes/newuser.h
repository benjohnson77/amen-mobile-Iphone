//
//  newuser.h
//  uicontrols
//
//  Created by Najam on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface newuser : UIViewController <UITextFieldDelegate,NSXMLParserDelegate>{
	IBOutlet UIImageView *img;
	IBOutlet UILabel *lbtitle ,*lbuserid ,*lbemail , *lbpassword, *lbconfirm;
	IBOutlet UIButton *btnregister ,*btnlogin;
	IBOutlet UITextField *txtuserid,*txtemail ,*txtpassword ,*txtconfirm;
	NSXMLParser *parser;
	NSMutableString *currentnodecontent;
	NSMutableArray *xmlobj;
	NSString *loginmsg;
	
	
}
@property(nonatomic,retain)IBOutlet UILabel *lbtitle ,*lbuserid ,*lbemail, *lbpassword, *lbconfirm;
@property(nonatomic,retain)IBOutlet UIButton  *btnregister ,*btnlogin;
@property(nonatomic,retain)IBOutlet UIImageView *img;
@property(nonatomic ,retain)NSMutableArray *xmlobj;


@property(nonatomic,retain)IBOutlet UITextField *txtuserid , *txtemail, *txtpassword, *txtconfirm;

-(IBAction)registernew;
-(IBAction)login;

@end
