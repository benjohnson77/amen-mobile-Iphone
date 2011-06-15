//
//  loginxml.m
//  testconnection
//
//  Created by Najam on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "loginxml.h"


@implementation loginxml
@synthesize xmlobj;

-(id)init

{
	xmlobj = [[NSMutableArray alloc]init];
	
	
	app = [[UIApplication sharedApplication]delegate];

	NSString *str2 = [[NSString alloc]initWithData:app.recievedata encoding:NSUTF8StringEncoding];
	NSLog(@"string  in login  xml class  = %@", str2);
	
	parser = [[NSXMLParser alloc]initWithData:app.recievedata];
	
	parser.delegate = self;
	
	[parser parse];
	
	NSString *str = app.userid;
	str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	str = [str stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
	
	
	NSLog(@"userid = %@", str);
	
		
	
	return self;
	
	
	
}



- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSString *errerstring = [NSString stringWithFormat:@"unable to downlaod fiel",[parseError code]];
	NSLog(@" error  parsing xmk" , errerstring);
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"error laoding login xml" message:errerstring delegate:self  cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
	
	[alt show];
	
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	
	if([elementName isEqualToString:@"users"])
	{
		currentnodecontent = [[NSMutableString alloc]init];
		
		
	}else 
		if ([elementName isEqualToString:@"user"]) 
		{
			app = [[UIApplication sharedApplication]delegate];			
		}
	
	
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	
	
	if([elementName isEqualToString:@"id"])
		
	{
		NSString *str = currentnodecontent;
		str = [str stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		str = [str stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
		
		app.userid = str;
	}
	else if([elementName isEqualToString:@"login"])
	{
		NSString *str1 = currentnodecontent;
		str1 = [str1 stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		str1 = [str1 stringByTrimmingCharactersInSet:[NSCharacterSet  whitespaceCharacterSet]];
		
		
		app.loginname = str1;
		
	}
	else if ([elementName isEqualToString:@"user"])
	{
		[xmlobj addObject:app];
				
	}
	
	[currentnodecontent release];
	currentnodecontent = nil;
	currentnodecontent = [[ NSMutableString alloc]init];
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	[currentnodecontent appendString: string];
	
}	  


@end
