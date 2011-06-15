//
//  friendsXML.h
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import"MainViewAppDelegate.h"
#import"friendsData.h"


@interface friendsXML : NSObject<NSXMLParserDelegate > {
	NSXMLParser *parser;
	NSMutableString *currentnodecontent;
	friendsData  *mydata;
	NSMutableArray *xmlobj1;
	MainViewAppDelegate *app;
}
@property(nonatomic ,retain)NSMutableArray *xmlobj1;

@end
