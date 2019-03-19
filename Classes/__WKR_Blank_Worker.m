//
//  __WKR_Blank_Worker.m
//  WKRBlank_Workers
//
//  Created by Darren Ehlers on 3/18/19.
//  Copyright © 2019 DoubleNode.com. All rights reserved.
//

#import "__WKR_Blank_Worker.h"

@implementation WKR_Blank_Worker

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

- (NSError*)blankWorkerErrorWithDomain:(NSString*)domain
                               andFile:(NSString*)file
                               andLine:(NSNumber*)line
                             andMethod:(NSString*)method
{
    NSString*   description     = NSLocalizedString(@"The worker is not implemented.", nil);
    NSString*   failureReason   = [NSString stringWithFormat:NSLocalizedString(@"Blank worker should not be actually used for real functionality. [%@:%@]", nil), file, line];
    
    return [NSError errorWithDomain:domain
                               code:ERROR_NOT_IMPLEMENTED
                           userInfo:@{
                                      NSLocalizedDescriptionKey         : description,
                                      NSLocalizedFailureReasonErrorKey  : failureReason,
                                      }];
}

@end
