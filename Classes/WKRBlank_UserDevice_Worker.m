//
//  WKRBlank_UserDevice_Worker.m
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
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
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
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
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
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
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
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
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
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
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
