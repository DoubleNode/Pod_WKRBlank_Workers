//
//  __WKR_Blank_Worker.h
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
//

@import DNCProtocols;

#define BLANKWORKERERROR(domain)    [self blankWorkerErrorWithDomain:domain andFile:@(__FILE__) andLine:@(__LINE__) andMethod:@(__PRETTY_FUNCTION__)]

@interface WKR_Blank_Worker : WKRNET_Base_Worker

- (NSError*)blankWorkerErrorWithDomain:(NSString*)domain
                               andFile:(NSString*)file
                               andLine:(NSNumber*)line
                             andMethod:(NSString*)method;

@end
