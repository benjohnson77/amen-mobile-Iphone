//
//  CommentXML.m
//  MainView
//
//  Created by Najam on 28/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommentXML.h"
#import"CommentData.h"


@implementation CommentXML

@synthesize xmlobj;



-(id)initWithString:(NSString *)prayerid

{

	xmlobj = [[NSMutableArray alloc]init];
	
	
	
	pid =prayerid;
	webServiceURL = [NSURL URLWithString:@"http://empty-galaxy-933.heroku.com/api/get_prayer_comments.xml"];
	
	urlRequest = [NSMutableURLRequest requestWithURL:webServiceURL];
	[urlRequest setHTTPMethod:@"POST"];
	
	NSString *postString = [NSString stringWithFormat:@"id=%@",pid];
	
	[urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
	
	
	
	
	NSURLResponse* response;
	NSError* error = nil;
	
	result = [NSURLConnection sendSynchronousRequest:urlRequest  returningResponse:&response error:&error];
	
		
	
			
	parser = [[NSXMLParser alloc]initWithData:result];
	
	parser.delegate = self;
	
	[parser parse];
	return self;
	
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
		if ([elementName isEqualToString:@"comments"]) 
		{
			mydata= [[CommentData alloc]init];
			
			
		}
	
	
}




- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
	
	
	if([elementName isEqualToString:@"id"])
		
	{
		mydata.cid  = currentnodecontent;
	}
	else if([elementName isEqualToString:@"comment"])
	{
		mydata.comments  = currentnodecontent;
		
	}
	else if([elementName isEqualToString:@"comment_user_name"])
	{
		mydata.user_name  = currentnodecontent;
		
	}
	
	else if([elementName isEqualToString:@"comment_time"])
	{
		mydata.c_time  = currentnodecontent;
		
	}
	
	
	else if([elementName isEqualToString:@"comment_image"])
	{
			
			
		NSString *yourString = [NSString stringWithFormat:@"%@",currentnodecontent];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		yourString = [yourString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		mydata.C_image =yourString;
		
	}
	
	
	
	
	else if ([elementName isEqualToString:@"comments"])
	{
		[xmlobj addObject:mydata];
				
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
