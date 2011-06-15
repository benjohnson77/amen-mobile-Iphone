//
//  CoreLocationDemoViewController.h
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocationController.h"

@interface CoreLocationDemoViewController : UIViewController <CoreLocationControllerDelegate> {
	CoreLocationController *CLController;
	IBOutlet UILabel *locLabel;
}

@property (nonatomic, retain) CoreLocationController *CLController;

@end

