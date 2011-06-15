//
//  CommentXML.h
//  MainView
//
//  Created by Najam on 28/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"MainViewAppDelegate.h"
#import"CommentData.h"


@interface CommentXML : NSObject<NSXMLParserDelegate> {

	
	NSXMLParser *parser;
	NSMutableString *currentnodecontent;
	
	CommentData *mydata;
	NSMutableArray *xmlobj;
	NSString *pid;
	NSURL *webServiceURL;
	NSMutableURLRequest *urlRequest ;
	NSData* result ;
	MainViewAppDelegate *app;
	
}

@property(nonatomic ,retain)NSMutableArray *xmlobj;

-(id)initWithString:(NSString *)prayerid;


@end
