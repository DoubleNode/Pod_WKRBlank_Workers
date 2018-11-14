//
//  WKRBlank_Checkin_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Checkin_Worker.h"

@implementation WKRBlank_Checkin_Worker

@synthesize nextBaseWorker;
@synthesize nextCheckinWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLCheckin_Protocol>)nextCheckinWorker
{
    return [[self.class alloc] initWithWorker:nextCheckinWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextCheckinWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLCheckin_Protocol>)nextCheckinWorker_
{
    self = [super initWithWorker:nextCheckinWorker_];
    if (self)
    {
        self.nextCheckinWorker = nextCheckinWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)checkinId
                withBlock:(nullable PTCLCheckinBlockVoidDAOCheckinNSErrorContinue)block
           andUpdateBlock:(nullable PTCLCheckinBlockVoidDAOCheckinNSError)updateBlock
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doLoadObjectForId:checkinId
                                        withBlock:block
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

- (void)doDeleteObject:(nonnull DAOCheckin*)checkin
             withBlock:(nullable PTCLCheckinBlockVoidBOOLNSError)block
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doDeleteObject:checkin
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

- (void)doDeleteObjectForId:(nonnull NSString*)checkinId
                  withBlock:(nullable PTCLCheckinBlockVoidBOOLNSError)block
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doDeleteObjectForId:checkinId
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

- (void)doSaveObject:(nonnull DAOCheckin*)checkin
           withBlock:(nullable PTCLCheckinBlockVoidDAOCheckinNSError)block
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doSaveObject:checkin
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

- (void)doFavoriteObject:(nonnull DAOCheckin*)checkin
               withBlock:(nullable PTCLCheckinBlockVoidNSError)block
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doFavoriteObject:checkin
                                       withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(error) : (void)nil;
}

- (void)doUnfavoriteObject:(nonnull DAOCheckin*)checkin
                 withBlock:(nullable PTCLCheckinBlockVoidNSError)block
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doUnfavoriteObject:checkin
                                         withBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(error) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadLocationForObject:(nonnull DAOCheckin*)checkin
                      withBlock:(nullable PTCLCheckinBlockVoidDAOLocationNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLCheckinBlockVoidDAOLocationNSError)updateBlock
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doLoadLocationForObject:checkin
                                              withBlock:block
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

- (void)doLoadPhotoForObject:(nonnull DAOCheckin*)checkin
                   withBlock:(nullable PTCLCheckinBlockVoidDAOPhotoNSErrorContinue)block
              andUpdateBlock:(nullable PTCLCheckinBlockVoidDAOPhotoNSError)updateBlock
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doLoadPhotoForObject:checkin
                                           withBlock:block
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

- (void)doLoadUserForObject:(nonnull DAOCheckin*)checkin
                  withBlock:(nullable PTCLCheckinBlockVoidDAOUserNSErrorContinue)block
             andUpdateBlock:(nullable PTCLCheckinBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextCheckinWorker)
    {
        [self.nextCheckinWorker doLoadUserForObject:checkin
                                          withBlock:block
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
