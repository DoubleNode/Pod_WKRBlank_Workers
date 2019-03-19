//
//  WKRBlank_Auth_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Auth_Worker.h"

@implementation WKRBlank_Auth_Worker

@synthesize nextBaseWorker;
@synthesize nextAuthWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLAuth_Protocol>)nextAuthWorker
{
    return [[self.class alloc] initWithWorker:nextAuthWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextAuthWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLAuth_Protocol>)nextAuthWorker_
{
    self = [super initWithWorker:nextAuthWorker_];
    if (self)
    {
        self.nextAuthWorker = nextAuthWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextAuthWorker)
    {
        [self.nextAuthWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextAuthWorker)
    {
        [self.nextAuthWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic

- (void)doLoadObjectForUser:(nonnull DAOUser*)user
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLAuthBlockVoidDAOAuthNSErrorContinue)block
             andUpdateBlock:(nullable PTCLAuthBlockVoidDAOAuthNSError)updateBlock
{
    if (self.nextAuthWorker)
    {
        [self.nextAuthWorker doLoadObjectForUser:user
                                    withProgress:progressBlock
                                        andBlock:block
                                  andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error, nil) : (void)nil;
}

@end
