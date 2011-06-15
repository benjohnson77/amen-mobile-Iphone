//
//  prayerXML.h
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"PrayerData.h"
#import"MainViewAppDelegate.h"


@interface prayerXML : NSObject<NSXMLParserDelegate > {
	NSXMLParser *parser;
	NSMutableString *currentnodecontent;
		
	PrayerData *mydata;
	NSMutableArray *xmlobj;
		NSString *var1;
	NSURL *webServiceURL;
	NSMutableURLRequest *urlRequest ;
	NSData* result ;
	MainViewAppDelegate *app;
	
}
@property(nonatomic ,retain)NSMutableArray *xmlobj;

-(id)initWithString:(NSString *)userid;
@end
