//
//  PickerViewController.h
//  PickerDemo
//
//  Created by System Administrator on 9/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
	UIPickerView *picker;
	UILabel *lblSelected;
	NSMutableArray *colors;
}

@end
