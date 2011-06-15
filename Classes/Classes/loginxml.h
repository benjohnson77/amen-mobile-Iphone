//
//  loginxml.h
//  testconnection
//
//  Created by Najam on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"MainViewAppDelegate.h"
@interface loginxml : NSObject<NSXMLParserDelegate> {
	
	NSXMLParser *parser;
	NSMutableString *currentnodecontent;
	NSMutableArray *xmlobj;
	MainViewAppDelegate *app;
	
}
@property(nonatomic ,retain)NSMutableArray *xmlobj;


@end
