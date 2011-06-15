//
//  AddCommnet.h
//  MainView
//
//  Created by Najam on 31/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"MainViewAppDelegate.h"
#import "TextViewCell.h"


@interface AddCommnet : UIViewController<UITableViewDelegate ,UITableViewDataSource,UITextViewDelegate> {

	
	UITableView *tableview;
	
	MainViewAppDelegate *app;
	NSString *comment;
}

@end
