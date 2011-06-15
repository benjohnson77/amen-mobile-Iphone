//
//  postPrayer.h
//  MainView
//
//  Created by Najam on 04/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"TextViewCell.h"
#import"CoreLocationController.h"



@interface postPrayer : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UITextViewDelegate> {
	UITableView *tableview1 ;
	NSString *ptitle ,*description;
	CoreLocationController *CLController;
	double lati;
	double longi;
	UITextField *title1;
}
@property(nonatomic,retain)CoreLocationController *CLController;

@end
