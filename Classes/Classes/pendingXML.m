//
//  pendingXML.m
//  MainView
//
//  Created by Najam on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "pendingXML.h"

#import"MainViewAppDelegate.h"
#import"pendingdata.h"


@implementation pendingXML
@synthesize xmlobj1;

-(id)init
{

	xmlobj1 = [[NSMutableArray alloc]init];
	
	NSURL *webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/get_invitation_pending.xml"];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	NSURLResponse* response;
	NSError* error = nil;
	
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
	NSString *str2 = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
	NSLog(@"string  app data in pending list = %@", str2);
	
	
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
	UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"error laoding pending list   xml" message:errerstring delegate:self  cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
	
	[alt show];
	
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
	
	if([elementName isEqualToString:@"invitation_pending"])
	{
		currentnodecontent = [[NSMutableString alloc]init];
		
		
	}else 
		if ([elementName isEqualToString:@"pending_user"]) 
		{
			mydata = [[pendingdata   alloc]init];
			
		}
	
	
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	
	
	if([elementName isEqualToString:@"pn_us_id"])
		
	{
		mydata.userid  = currentnodecontent;
	}
	else if([elementName isEqualToString:@"pn_us_login"])
	{
		mydata.loginname  = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"pn_us_email"])
	{
		mydata.email  = currentnodecontent;
		
	}
	
	else if([elementName isEqualToString:@"pn_us_image_url"])
		
		
	{
		NSString *yourString = currentnodecontent;
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		
		mydata.imageurl  = yourString;
	}
	
	
	
	
	else if ([elementName isEqualToString:@"pending_user"])
	{
		[xmlobj1 addObject:mydata];
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
