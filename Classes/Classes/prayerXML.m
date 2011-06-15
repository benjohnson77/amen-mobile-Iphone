//
//  prayerXML.m
//  MainView
//
//  Created by Najam on 15/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "prayerXML.h"

#import"MainViewAppDelegate.h"


@implementation prayerXML
@synthesize xmlobj;


-(id)initWithString:(NSString *)userid
{

	xmlobj = [[[NSMutableArray alloc]init]retain];
	
	app = [[UIApplication sharedApplication]delegate];
	if([app.userid isEqualToString:userid])
		
	{
		webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/prayers.xml"];
		urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
		[urlRequest setHTTPMethod:@"POST"];

		
	}
	else {
		var1 =userid;
	   webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/selected_user_prayers.xml"];
		
			urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
		[urlRequest setHTTPMethod:@"POST"];

		NSString *postString = [NSString stringWithFormat:@"id=%@",var1];
		
		[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	}
	
	
	
	

		//[urlRequest setValue:@"kedar1" forHTTPHeaderField:@"name"];
	
			
	 
	
	
	NSURLResponse* response;
	NSError* error = nil;
	
	result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
//	NSString *str2 = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
//	NSLog(@"string  app data in pryaer xml = %@", str2);
	
	
	
	parser = [[NSXMLParser alloc]initWithData:result];
	
	parser.delegate = self;
	
	[parser parse];
	
		
			
	
	return self;
	
	
	
		
	
	
}






- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	// [responseData setLength:0];
}
/*
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	// [responseData appendData:data];
	NSData *file = [[NSData alloc]initWithData:data];
	
	
	NSString *str2 = [[NSString alloc]initWithData:file encoding:NSUTF8StringEncoding];
	NSLog(@"string  app data in pryaer xml = %@", str2);
	
	
	parser = [[NSXMLParser alloc]initWithData:file];
	
	parser.delegate = self;
	
	[parser parse];
		
}
*/




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
	
	if([elementName isEqualToString:@"prayers"])
	{
		currentnodecontent = [[NSMutableString alloc]init];
		
		
	}else 
		if ([elementName isEqualToString:@"prayer"]) 
		{
			mydata= [[PrayerData alloc]init];
			
						
		}
	
	
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	
	
	if([elementName isEqualToString:@"id"])
		
	{
		mydata.prayerid = currentnodecontent;
	}
	else if([elementName isEqualToString:@"title"])
	{
		mydata.title1 = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"description"])
	{
		mydata.description = currentnodecontent;
		
	}
	
	else if([elementName isEqualToString:@"comments_count"])
	{
		mydata.comment_counts = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"prayer_time"])
	{
		mydata.ptime = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"prayer_viewed"])
	{
		mydata.prayer_viewd  = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"prayer_prayed"])
	{
		mydata.prayer_prayed  = currentnodecontent;
		
	}
	
	
	else if([elementName isEqualToString:@"lat"])
	{
		mydata.lat = currentnodecontent;
	}
	else if([elementName isEqualToString:@"long"])
	{
		mydata.longt = currentnodecontent;
	}
	else if([elementName isEqualToString:@"prayer_image"])
	{
		
		NSString *yourString = [NSString stringWithFormat:@"%@",currentnodecontent];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		mydata.imageurl =yourString;
	
	}
	
	
	
	
	else if ([elementName isEqualToString:@"prayer"])
	{
		[xmlobj addObject:mydata];
		NSLog(@"parsing completed");
		NSInteger count1 = [xmlobj count];
		NSLog(@"count = %d",count1);
		NSString *str = mydata.imageurl;
		NSLog(@"image  url = %@", str);
				
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
