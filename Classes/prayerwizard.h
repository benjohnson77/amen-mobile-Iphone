//
//  prayerwizard.h
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"CoreLocationController.h"

@interface prayerwizard : UIViewController<UITextFieldDelegate,UITextViewDelegate> {
	IBOutlet UILabel *title1 ,*desc , *location ,*type;
	IBOutlet UIButton *post ,*reset;
	IBOutlet UITextField *txttitle  ,*txtloc , *txttype;
	IBOutlet UITextView *txtdesc;
	CoreLocationController *CLController;
	double lati;
	double longi;

}

@property(nonatomic ,retain)IBOutlet UILabel *title1 ,*desc , *location ,*type;
@property(nonatomic,retain)IBOutlet UIButton *post ,*reset;
@property (nonatomic, retain) CoreLocationController *CLController;
@property(nonatomic ,retain)IBOutlet UITextView *txtdesc;

@property (nonatomic ,retain)IBOutlet UITextField *txttitle  ,*txtloc , *txttype;



-(IBAction)postprayer;
-(IBAction)resetpost;

@end
