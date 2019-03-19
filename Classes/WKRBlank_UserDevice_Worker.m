//
//  WKRBlank_UserDevice_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_UserDevice_Worker.h"

@interface WKRBlank_UserDevice_Worker ()

@end

@implementation WKRBlank_UserDevice_Worker

@synthesize nextBaseWorker;
@synthesize nextUserDeviceWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLUserDevice_Protocol>)nextUserDeviceWorker
{
    return [[self.class alloc] initWithWorker:nextUserDeviceWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextUserDeviceWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLUserDevice_Protocol>)nextUserDeviceWorker_
{
    self = [super initWithWorker:nextUserDeviceWorker_];
    if (self)
    {
        self.nextUserDeviceWorker = nextUserDeviceWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)userDeviceId
                andUserId:(nonnull NSString*)userId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLUserDeviceBlockVoidDAOUserDeviceNSErrorContinue)block
           andUpdateBlock:(nullable PTCLUserDeviceBlockVoidDAOUserDeviceNSError)updateBlock
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker doLoadObjectForId:userDeviceId
                                           andUserId:userId
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

- (void)doDeleteObject:(nonnull DAOUserDevice*)userDevice
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLUserDeviceBlockVoidBOOLNSError)block
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker doDeleteObject:userDevice
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doDeleteObjectForId:(nonnull NSString*)userDeviceId
                  andUserId:(nonnull NSString*)userId
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLUserDeviceBlockVoidBOOLNSError)block
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker doDeleteObjectForId:userDeviceId
                                             andUserId:userId
                                          withProgress:progressBlock
                                              andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOUserDevice*)userDevice
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLUserDeviceBlockVoidBOOLNSError)block
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker doSaveObject:userDevice
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

#pragma mark - Collection Items CRUD

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLUserDeviceBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLUserDeviceBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserDeviceWorker)
    {
        [self.nextUserDeviceWorker doLoadObjectsForUser:user
                                         withParameters:parameters
                                            andProgress:progressBlock
                                               andBlock:block
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

@end
