//
//  WKRBlank_User_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_User_Worker.h"

@interface WKRBlank_User_Worker ()

@end

@implementation WKRBlank_User_Worker

@synthesize nextBaseWorker;
@synthesize nextUserWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.rentmywardrobe.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLUser_Protocol>)nextUserWorker
{
    return [[self.class alloc] initWithWorker:nextUserWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextUserWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLUser_Protocol>)nextUserWorker_
{
    self = [super initWithWorker:nextUserWorker_];
    if (self)
    {
        self.nextUserWorker = nextUserWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker enableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

#pragma mark - Business Logic

- (BOOL)doCheckForAccessTokenError:(nullable NSData*)errorData
{
    if (self.nextUserWorker)
    {
        return [self.nextUserWorker doCheckForAccessTokenError:errorData];
    }

    return NO;
}

- (void)doCurrentAccessTokenWithBlock:(nullable PTCLUserBlockVoidDAOUserNSString)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doCurrentAccessTokenWithBlock:block];
        return;
    }
    
    block ? block(nil, nil) : (void)nil;
}

- (void)doCurrentUserWithBlock:(nullable PTCLUserBlockVoidDAOUser)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doCurrentUserWithBlock:block];
        return;
    }
    
    block ? block(nil) : (void)nil;
}

- (void)doDeleteCurrentUserWithBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doDeleteCurrentUserWithBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doLogOut
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLogOut];
        return;
    }
}

- (void)validateCurrentSessionInBackgroundWithBlock:(nullable PTCLUserBlockVoidDAOUserBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker validateCurrentSessionInBackgroundWithBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, NO, error) : (void)nil;
}

- (void)logInWithUsernameInBackground:(nonnull NSString*)authType
                             username:(nonnull NSString*)username
                             password:(nonnull NSString*)password
                            withBlock:(nullable PTCLUserBlockVoidDAOUserBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker logInWithUsernameInBackground:authType
                                                  username:username
                                                  password:password
                                                 withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, NO, error) : (void)nil;
}

- (void)doFollowUser:(nonnull DAOUser*)user
           withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doFollowUser:user
                                withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doUnfollowUser:(nonnull DAOUser*)user
             withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doUnfollowUser:user
                                  withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doLoad:(nonnull NSString*)userId
     withBlock:(nullable PTCLUserBlockVoidDAOUserNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoad:userId
                          withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

- (void)doVerify:(nonnull DAOUser*)user
       withBlock:(nullable PTCLUserBlockVoidDAOUserNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doVerify:user
                            withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

- (void)doLoadAvatarForUser:(nonnull DAOUser*)user
                  withBlock:(nullable PTCLUserBlockVoidDAOPhotoNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadAvatarForUser:user
                                       withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

- (void)doLoadLocationsForObject:(nonnull DAOUser*)user
                       withBlock:(nullable PTCLUserBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadLocationsForObject:user
                                            withBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (void)nil;
}

- (void)doResetPasswordForEmail:(nonnull NSString*)email
                      withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doResetPasswordForEmail:email
                                           withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)saveInBackground:(nonnull DAOUser*)user
               withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker saveInBackground:user
                                    withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)saveOptionsInBackground:(nonnull DAOUser*)daoUser
                      withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker saveOptionsInBackground:daoUser
                                           withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)signUpInBackground:(nonnull DAOUser*)user
                 withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker signUpInBackground:user
                                      withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doSearchUsers:(nonnull NSString*)searchId
             withText:(nonnull NSString*)search
       withParameters:(nullable NSDictionary*)parameters
             andBlock:(nullable PTCLUserSearchBlockVoidNSArrayNSUIntegerNSUIntegerNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSearchUsers:searchId
                                  withText:search
                            withParameters:parameters
                                  andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@"", @[ ], 0, 0, error) : (void)nil;
}

- (void)doSaveOption:(nonnull NSString*)optionId
              andKey:(nonnull NSString*)optionKey
            andValue:(nullable id)optionValue
             forUser:(nonnull DAOUser*)daoUser
           withBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSaveOption:optionId
                                   andKey:optionKey
                                 andValue:optionValue
                                  forUser:daoUser
                                withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

@end
