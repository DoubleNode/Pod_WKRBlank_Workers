//
//  __WKR_Blank_Worker.h
//  WKRBlank_Workers
//
//  Created by Darren Ehlers on 3/18/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

@import DNCProtocols;

#define BLANKWORKERERROR(domain)    [self blankWorkerErrorWithDomain:domain andFile:@(__FILE__) andLine:@(__LINE__) andMethod:@(__PRETTY_FUNCTION__)]

@interface WKR_Blank_Worker : WKRNET_Base_Worker

- (NSError*)blankWorkerErrorWithDomain:(NSString*)domain
                               andFile:(NSString*)file
                               andLine:(NSNumber*)line
                             andMethod:(NSString*)method;

@end
