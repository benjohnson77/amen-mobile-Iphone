//
//  CommentData.h
//  MainView
//
//  Created by Najam on 28/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CommentData : NSObject {
	NSString *cid , *comments ,*user_name ,*c_time, *C_image;
	
}
@property(nonatomic ,retain)NSString *cid , *comments ,*user_name ,*c_time, *C_image;

@end
