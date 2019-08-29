//
//  WKRBlank_Activity_Worker.m
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
//

#import "WKRBlank_Activity_Worker.h"

@implementation WKRBlank_Activity_Worker

@synthesize nextBaseWorker;
@synthesize nextActivityWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLActivity_Protocol>)nextActivityWorker
{
    return [[self.class alloc] initWithWorker:nextActivityWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextActivityWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLActivity_Protocol>)nextActivityWorker_
{
    self = [super initWithWorker:nextActivityWorker_];
    if (self)
    {
        self.nextActivityWorker = nextActivityWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker disableOption:option];
    }
    
    [super disableOption:option];
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)activityId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLActivityBlockVoidDAOActivityNSErrorContinue)block
           andUpdateBlock:(nullable PTCLActivityBlockVoidDAOActivityNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadObjectForId:activityId
                                      withProgress:progressBlock
                                          andBlock:block
                                    andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doFavoriteObject:(nonnull DAOActivity*)activity
            withProgress:(nullable PTCLProgressBlock)progressBlock
                andBlock:(nullable PTCLActivityBlockVoidNSError)block
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doFavoriteObject:activity
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnfavoriteObject:(nonnull DAOActivity*)activity
              withProgress:(nullable PTCLProgressBlock)progressBlock
                  andBlock:(nullable PTCLActivityBlockVoidNSError)block
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doUnfavoriteObject:activity
                                       withProgress:progressBlock
                                           andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFlagObject:(nonnull DAOActivity*)activity
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
         andProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLActivityBlockVoidNSError)block
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doFlagObject:activity
                                   withAction:action
                                      andText:text
                                  andProgress:progressBlock
                                     andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnflagObject:(nonnull DAOActivity*)activity
            withAction:(nonnull NSString*)action
               andText:(nonnull NSString*)text
           andProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLActivityBlockVoidNSError)block
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doUnflagObject:activity
                                     withAction:action
                                        andText:text
                                    andProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doCheckFlagObject:(nonnull DAOActivity*)activity
               withAction:(nonnull NSString*)action
              andProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLActivityBlockVoidNSUIntegerNSError)block
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doCheckFlagObject:activity
                                        withAction:action
                                       andProgress:progressBlock
                                          andBlock:block];
        return;
    }
    
    block ? block(0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadItemForObject:(nullable DAOActivity*)activity
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLActivityBlockVoidDAOItemNSErrorContinue)block
             andUpdateBlock:(nullable PTCLActivityBlockVoidDAOItemNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadItemForObject:activity
                                        withProgress:progressBlock
                                            andBlock:block
                                      andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadLocationForObject:(nullable DAOActivity*)activity
                   withProgress:(nullable PTCLProgressBlock)progressBlock
                       andBlock:(nullable PTCLActivityBlockVoidDAOLocationNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLActivityBlockVoidDAOLocationNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadLocationForObject:activity
                                            withProgress:progressBlock
                                                andBlock:block
                                          andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadPhotoForObject:(nullable DAOActivity*)activity
                withProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLActivityBlockVoidDAOPhotoNSErrorContinue)block
              andUpdateBlock:(nullable PTCLActivityBlockVoidDAOPhotoNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadPhotoForObject:activity
                                         withProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadUserForObject:(nullable DAOActivity*)activity
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLActivityBlockVoidDAOUserNSErrorContinue)block
             andUpdateBlock:(nullable PTCLActivityBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadUserForObject:activity
                                        withProgress:progressBlock
                                            andBlock:block
                                      andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadUserAvatarForObject:(nullable DAOActivity*)activity
                     withProgress:(nullable PTCLProgressBlock)progressBlock
                         andBlock:(nullable PTCLActivityBlockVoidDAOPhotoNSErrorContinue)block
                   andUpdateBlock:(nullable PTCLActivityBlockVoidDAOPhotoNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadUserAvatarForObject:activity
                                              withProgress:progressBlock
                                                  andBlock:block
                                            andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadFlagsForObject:(nullable DAOActivity*)activity
                 withActions:(nonnull NSArray<NSString*>*)actions
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLActivityBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLActivityBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadFlagsForObject:activity
                                          withActions:actions
                                          andProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadMyFlagsForObject:(nullable DAOActivity*)activity
                   withActions:(nonnull NSArray<NSString*>*)actions
                   andProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLActivityBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
                andUpdateBlock:(nullable PTCLActivityBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadMyFlagsForObject:activity
                                            withActions:actions
                                            andProgress:progressBlock
                                               andBlock:block
                                         andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjectsWithParameters:(nullable NSDictionary*)parameters
                        andProgress:(nullable PTCLProgressBlock)progressBlock
                           andBlock:(nullable PTCLActivityBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
                     andUpdateBlock:(nullable PTCLActivityBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadObjectsWithParameters:parameters
                                                 andProgress:progressBlock
                                                    andBlock:block
                                              andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLActivityBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLActivityBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextActivityWorker)
    {
        [self.nextActivityWorker doLoadObjectsForUser:user
                                       withParameters:parameters
                                          andProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
