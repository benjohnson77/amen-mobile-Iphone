//
//  friendsData.h
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface friendsData : NSObject {
	NSString *friendid , *frind_login , *fr_email ,*fr_image;

}
@property(nonatomic ,retain)NSString *friendid , *frind_login , *fr_email ,*fr_image;
@end
