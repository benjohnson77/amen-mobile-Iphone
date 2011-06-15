//
//  pendingXML.h
//  MainView
//
//  Created by Najam on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewAppDelegate.h"
#import"pendingdata.h"


@interface pendingXML : NSObject<NSXMLParserDelegate > {
	NSXMLParser *parser;
	NSMutableString *currentnodecontent;
	pendingdata   *mydata;
	NSMutableArray *xmlobj1;
	MainViewAppDelegate *app;
	
}
@property(nonatomic ,retain)NSMutableArray *xmlobj1;

@end
