//
//  SIMUXParser.m
//  XMLSinglePostParser
//
//  Created by Pan Ziyue on 14/9/13.
//  Copyright (c) 2013 Pan Ziyue. All rights reserved.
//

#import "SIMUXCRParser.h"

@implementation SIMUXCRParser {
    NSXMLParser *parser;
    
    NSMutableArray *feeds; //Main feeds array
    
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *description;
    NSString *description2;
    NSString *element;
    
    NSArray *searchResults;
}

//This is the main function of the SIMUXCR, built on the ClearRead HTML Parser
-(NSString*)getDescription:(NSString*)HTMLString
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    feeds = [[NSMutableArray alloc] init];
    
    NSString *firstPart=@"http://api.thequeue.org/v1/clear?url=";
    NSString *secondPart=@"&format=xml";
    NSString *combined=[firstPart stringByAppendingString:[HTMLString stringByAppendingString:secondPart]];
    
    NSURL *url = [NSURL URLWithString:combined];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    return description;
}

-(NSString*)getTitle:(NSString*)HTMLString
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    feeds = [[NSMutableArray alloc]init];
    
    NSString *firstPart=@"http://api.thequeue.org/v1/clear?url=";
    NSString *secondPart=@"&format=xml";
    NSString *combined=[firstPart stringByAppendingString:[HTMLString stringByAppendingString:secondPart]];
    
    NSURL *url = [NSURL URLWithString:combined];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    return title;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict //Parser didStartElement function
{
    element = elementName;
    
    if ([element isEqualToString:@"item"])
    {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        description= [[NSMutableString alloc] init];
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName //Parser didEndElement function
{
    if ([elementName isEqualToString:@"item"])
    {
        [item setObject:title forKey:@"title"];
        [item setObject:description forKey:@"link"];
        
        [feeds addObject:[item copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"description"]) {
        [description appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser //You can add your custom code here to display that the parser finished loading
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
