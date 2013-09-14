//
//  SIMUXParser.h
//  XMLSinglePostParser
//
//  Created by Pan Ziyue on 14/9/13.
//  Copyright (c) 2013 Pan Ziyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIMUXCRParser : NSObject <NSXMLParserDelegate>

//This is the method to retrieve the <description> in ClearRead parsed XML files
-(NSString*)getDescription:(NSString*)HTMLString;

//And this is the method to get the <title> string in the parsed XML from ClearRead
-(NSString*)getTitle:(NSString*)HTMLString;

@end
