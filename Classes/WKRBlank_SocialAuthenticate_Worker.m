//
//  WKRDCrash_SocialAuthenticate_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_SocialAuthenticate_Worker.h"

@interface WKRBlank_SocialAuthenticate_Worker ()

@end

@implementation WKRBlank_SocialAuthenticate_Worker

@synthesize nextBaseWorker;
@synthesize nextSocialAuthenticateWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLSocialAuthenticate_Protocol>)nextSocialAuthenticateWorker
{
    return [[self.class alloc] initWithWorker:nextSocialAuthenticateWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextSocialAuthenticateWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLSocialAuthenticate_Protocol>)nextSocialAuthenticateWorker_
{
    self = [super initWithWorker:nextSocialAuthenticateWorker_];
    if (self)
    {
        self.nextSocialAuthenticateWorker = nextSocialAuthenticateWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextSocialAuthenticateWorker)
    {
        [self.nextSocialAuthenticateWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextSocialAuthenticateWorker)
    {
        [self.nextSocialAuthenticateWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic

- (void)doAuthenticateWithCompletion:(PTCLSocialAuthenticateBlockVoidSessionNSError _Nullable)block
{
    if (self.nextSocialAuthenticateWorker)
    {
        [self.nextSocialAuthenticateWorker doAuthenticateWithCompletion:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

- (void)doRetrieveUser:(nullable NSString*)userId
           withSession:(nullable PTCLSocialAuthenticate_Session*)session
        withCompletion:(nullable PTCLSocialAuthenticateBlockVoidUserNSError)block
{
    if (self.nextSocialAuthenticateWorker)
    {
        [self.nextSocialAuthenticateWorker doRetrieveUser:userId
                                              withSession:session
                                           withCompletion:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

@end
