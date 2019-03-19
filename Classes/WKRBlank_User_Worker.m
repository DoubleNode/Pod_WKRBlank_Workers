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

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
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
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker disableOption:option];
    }
    
    [super disableOption:option];
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic / Single Item CRUD

- (BOOL)doCheckForAccessTokenError:(nullable NSData*)errorData
{
    if (self.nextUserWorker)
    {
        return [self.nextUserWorker doCheckForAccessTokenError:errorData];
    }

    return NO;
}

- (void)doCurrentAccessTokenWithProgress:(nullable PTCLProgressBlock)progressBlock
                                andBlock:(nullable PTCLUserBlockVoidDAOUserNSString)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doCurrentAccessTokenWithProgress:progressBlock
                                                     andBlock:block];
        return;
    }
    
    block ? block(nil, nil) : (void)nil;
}

- (void)doCurrentUserWithProgress:(nullable PTCLProgressBlock)progressBlock
                         andBlock:(nullable PTCLUserBlockVoidDAOUser)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doCurrentUserWithProgress:progressBlock
                                              andBlock:block];
        return;
    }
    
    block ? block(nil) : (void)nil;
}

- (void)doDeleteCurrentUserWithProgress:(nullable PTCLProgressBlock)progressBlock
                               andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doDeleteCurrentUserWithProgress:progressBlock
                                                    andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doLogoutWithProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block;
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLogoutWithProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doValidateCurrentSessionWithProgress:(nullable PTCLProgressBlock)progressBlock
                                  andBlock:(nullable PTCLUserBlockVoidDAOUserBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doValidateCurrentSessionWithProgress:progressBlock
                                                         andBlock:block];
        return;
    }
    
    block ? block(nil, NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doLoginWithAuthType:(nonnull NSString*)authType
                andUsername:(nonnull NSString*)username
                andPassword:(nonnull NSString*)password
                andProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLUserBlockVoidDAOUserBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoginWithAuthType:authType
                                     andUsername:username
                                     andPassword:password
                                     andProgress:progressBlock
                                        andBlock:block];
        return;
    }
    
    block ? block(nil, NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFlagObject:(nonnull DAOUser*)user
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
         andProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserBlockVoidNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doFlagObject:user
                               withAction:action
                                  andText:text
                              andProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFlagObject:(nonnull DAOUser*)user
             forUser:(nullable DAOUser*)flaggingUser
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
         andProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserBlockVoidNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doFlagObject:user
                                  forUser:flaggingUser
                               withAction:action
                                  andText:text
                              andProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteFlag:(nonnull DAOFlag*)flag
           forObject:(nonnull DAOUser*)user
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserBlockVoidNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doDeleteFlag:flag
                                forObject:user
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnflagObject:(nonnull DAOUser*)user
            withAction:(nonnull NSString*)action
               andText:(nonnull NSString*)text
           andProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLUserBlockVoidNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doUnflagObject:user
                                 withAction:action
                                    andText:text
                                andProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doCheckFlagObject:(nonnull DAOUser*)user
               withAction:(nonnull NSString*)action
              andProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLUserBlockVoidNSUIntegerNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doCheckFlagObject:user
                                    withAction:action
                                   andProgress:progressBlock
                                      andBlock:block];
        return;
    }
    
    block ? block(0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFollowUser:(nonnull DAOUser*)user
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doFollowUser:user
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnfollowUser:(nonnull DAOUser*)user
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doUnfollowUser:user
                               withProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doTagObject:(nonnull DAOUser*)user
            withTag:(nonnull NSString*)tag
        andProgress:(nullable PTCLProgressBlock)progressBlock
           andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doTagObject:user
                                 withTag:tag
                             andProgress:progressBlock
                                andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUntagObject:(nonnull DAOUser*)user
              withTag:(nonnull NSString*)tag
          andProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doUntagObject:user
                                   withTag:tag
                               andProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doLoad:(nonnull NSString*)userId
  withProgress:(nullable PTCLProgressBlock)progressBlock
      andBlock:(nullable PTCLUserBlockVoidDAOUserNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoad:userId
                       withProgress:progressBlock
                           andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doVerify:(nonnull DAOUser*)user
    withProgress:(nullable PTCLProgressBlock)progressBlock
        andBlock:(nullable PTCLUserBlockVoidDAOUserNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doVerify:user
                         withProgress:progressBlock
                             andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadAvatarForUser:(nonnull DAOUser*)user
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLUserBlockVoidDAOPhotoNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadAvatarForUser:user
                                    withProgress:progressBlock
                                        andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doLoadLocationsForObject:(nonnull DAOUser*)user
                    withProgress:(nullable PTCLProgressBlock)progressBlock
                        andBlock:(nullable PTCLUserBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadLocationsForObject:user
                                         withProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doResetPasswordForEmail:(nonnull NSString*)email
                   withProgress:(nullable PTCLProgressBlock)progressBlock
                       andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doResetPasswordForEmail:email
                                        withProgress:progressBlock
                                            andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOUser*)user
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSaveObject:user
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }

    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveOptions:(nonnull DAOUser*)daoUser
         withProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSaveOptions:daoUser
                              withProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSignUp:(nonnull DAOUser*)user
  withProgress:(nullable PTCLProgressBlock)progressBlock
      andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSignUp:user
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSearchUsers:(nonnull NSString*)searchId
             withText:(nonnull NSString*)search
       withParameters:(nullable NSDictionary*)parameters
          andProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLUserSearchBlockVoidNSArrayNSUIntegerNSUIntegerNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSearchUsers:searchId
                                  withText:search
                            withParameters:parameters
                               andProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(@"", @[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveOption:(nonnull NSString*)optionId
              andKey:(nonnull NSString*)optionKey
            andValue:(nullable id)optionValue
             forUser:(nonnull DAOUser*)daoUser
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserBlockVoidBOOLNSError)block
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doSaveOption:optionId
                                   andKey:optionKey
                                 andValue:optionValue
                                  forUser:daoUser
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadAllFlagsForObject:(nonnull DAOUser*)user
                    withActions:(nonnull NSArray<NSString*>*)actions
                    andProgress:(nullable PTCLProgressBlock)progressBlock
                       andBlock:(nullable PTCLUserBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadAllFlagsForObject:user
                                         withActions:actions
                                         andProgress:progressBlock
                                            andBlock:block
                                      andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadFlagsForObject:(nonnull DAOUser*)user
                 withActions:(nonnull NSArray<NSString*>*)actions
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLUserBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadFlagsForObject:user
                                      withActions:actions
                                      andProgress:progressBlock
                                         andBlock:block
                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadMyFlagsForObject:(nonnull DAOUser*)user
                   withActions:(nonnull NSArray<NSString*>*)actions
                   andProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLUserBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
                andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadMyFlagsForObject:user
                                        withActions:actions
                                        andProgress:progressBlock
                                           andBlock:block
                                     andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadTagsForObject:(nonnull DAOUser*)user
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLUserBlockVoidNSArrayNSStringNSUIntegerNSUIntegerNSErrorContinue)block
             andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayNSStringNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadTagsForObject:user
                                    withProgress:progressBlock
                                        andBlock:block
                                  andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjectsWithTag:(nonnull NSString*)tag
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLUserBlockVoidNSArrayDAOUserNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLUserBlockVoidNSArrayDAOUserNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserWorker)
    {
        [self.nextUserWorker doLoadObjectsWithTag:tag
                                   withParameters:parameters
                                      andProgress:progressBlock
                                         andBlock:block
                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
