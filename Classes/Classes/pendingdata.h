//
//  pendingdata.h
//  MainView
//
//  Created by Najam on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface pendingdata : NSObject {
	NSString *userid ,*loginname ,*email, *imageurl;
}
@property(nonatomic ,retain)NSString *userid ,*loginname ,*email, *imageurl;

@end
