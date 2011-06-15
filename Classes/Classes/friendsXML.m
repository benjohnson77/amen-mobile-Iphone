//
//  friendsXML.m
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "friendsXML.h"



@implementation friendsXML
@synthesize xmlobj1;


-(id)init
{

	xmlobj1 = [[[NSMutableArray alloc]init]retain];
		
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/get_friend_list.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSURLResponse* response;
	NSError* error = nil;
	
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
	//NSString *str2 = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
	//NSLog(@"string  app data in pryaer xml = %@", str2);
	
	
	parser = [[NSXMLParser alloc]initWithData:result];
	
	parser.delegate = self;
	
	[parser parse];
	
	return self;
	
	
	
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	// [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	// [responseData appendData:data];
	NSData *file = [[NSData alloc]initWithData:data];
	
	
	NSString *str2 = [[NSString alloc]initWithData:file encoding:NSUTF8StringEncoding];
	NSLog(@"string  app data in frinds xml = %@", str2);
	
	
	parser = [[NSXMLParser alloc]initWithData:file];
	
	parser.delegate = self;
	
	[parser parse];
	
}





- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// [[NSAlert alertWithError:error] runModal];
	
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Once this method is invoked, "responseData" contains the complete result
}









- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
	NSString *errerstring = [NSString stringWithFormat:@"unable to downlaod fiel",[parseError code]];
	NSLog(@" error  parsing xmk" , errerstring);
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"error laoding pryaer  xml" message:errerstring delegate:self  cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
	
	[alt show];
	
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	
	if([elementName isEqualToString:@"friendlist"])
	{
		currentnodecontent = [[NSMutableString alloc]init];
		
		
	}else 
		if ([elementName isEqualToString:@"friend"]) 
		{
			mydata= [[friendsData  alloc]init];
			
		}
	
	
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	
	
	if([elementName isEqualToString:@"fr_id"])
		
	{
		mydata.friendid  = currentnodecontent;
	}
	else if([elementName isEqualToString:@"fr_login"])
	{
		mydata.frind_login  = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"fr_email"])
	{
		mydata.fr_email  = currentnodecontent;
		
	}
	
	else if([elementName isEqualToString:@"fr_image_url"])
		
		
	{
		NSString *yourString = currentnodecontent;
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];

		mydata.fr_image  = yourString;
	}
	
	
	
	
	else if ([elementName isEqualToString:@"friend"])
	{
		[xmlobj1 addObject:mydata];
		
		NSLog(@"parsing frinds completed");
		NSInteger count1 = [xmlobj1 count];
		NSLog(@"count = %d",count1);
		[mydata release];
		
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
