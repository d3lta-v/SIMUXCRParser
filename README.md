**SIMUXCR Parser/Wrapper**
-----------------------------------------------------------
Made by StatiX Industries

NAME:
* SIMUXCR (The Synchronous Integrated Mutable XAML Clear Read parser)

SYNOPSIS:
This is a simple Objective-C wrapper to parse results in XML from the CleanRead API
The CleanRead API is available here: http://api.thequeue.org/v1/
This wrapper relies on the NSXMLParser.

USAGE:
Import the parser first

```objective-c
#import "SIMUXCRParser.h" //Import the parser up there in your Viewcontroller
```

  
If you want the <description> from the ClearRead XML file put into an NSString:

```objective-c
SIMUXCRParser *simuxParser = [[SIMUXCRParser alloc] init];
NSString *description = [simuxParser getDescription:@"URL of webpage you want to parse with ClearRead"];
```

  
If you want the <title> from the ClearRead XML file...

```objective-c
SIMUXCRParser *simuxParser = [[SIMUXCRParser alloc] init];
NSString *title = [simuxParser getTitle:@"URL of webpage you want to parse with ClearRead"];
```

  
AVAILABILITY:
The wrapper is usable on the iOS 6.1 platform
Devices compatible include the iPhone 4 and above, iPad and above as well as iPod Touch 4rd Gen and above


AUTHOR(S):  
StatiX Industries:
* Lead Developer and Debugger: Pan Ziyue


FINAL NOTE:  
Yes I wrote it in the format of a UNIX command manual page
  
Copyright (C) StatiX Industries 2013 (Under the Creative-Commons Attribution (CC-BY) license)
