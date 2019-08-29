//
//  WKRBlank_Notification_Worker.m
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
//

#import "WKRBlank_Notification_Worker.h"

@interface WKRBlank_Notification_Worker ()

@end

@implementation WKRBlank_Notification_Worker

@synthesize nextBaseWorker;
@synthesize nextNotificationWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLNotification_Protocol>)nextNotificationWorker
{
    return [[self.class alloc] initWithWorker:nextNotificationWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextNotificationWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLNotification_Protocol>)nextNotificationWorker_
{
    self = [super initWithWorker:nextNotificationWorker_];
    if (self)
    {
        self.nextNotificationWorker = nextNotificationWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)notificationId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLNotificationBlockVoidDAONotificationNSErrorContinue)block
           andUpdateBlock:(nullable PTCLNotificationBlockVoidDAONotificationNSError)updateBlock
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker doLoadObjectForId:notificationId
                                          withProgress:progressBlock
                                              andBlock:block
                                        andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (updateBlock ? updateBlock(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil);
}

- (void)doDeleteObject:(nonnull DAONotification*)notification
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLNotificationBlockVoidBOOLNSError)block
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker doDeleteObject:notification
                                       withProgress:progressBlock
                                           andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAONotification*)notification
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLNotificationBlockVoidDAONotificationNSError)block
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker doSaveObject:notification
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadTransmissionsForObject:(nonnull DAONotification*)notification
                        withProgress:(nullable PTCLProgressBlock)progressBlock
                            andBlock:(nullable PTCLNotificationBlockVoidNSArrayDAOTransmissionNSUIntegerNSUIntegerNSErrorContinue)block
                      andUpdateBlock:(nullable PTCLNotificationBlockVoidNSArrayDAOTransmissionNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker doLoadTransmissionsForObject:notification
                                                     withProgress:progressBlock
                                                         andBlock:block
                                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (updateBlock ? updateBlock(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil);
}

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLNotificationBlockVoidNSArrayDAONotificationNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLNotificationBlockVoidNSArrayDAONotificationNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextNotificationWorker)
    {
        [self.nextNotificationWorker doLoadObjectsForUser:user
                                           withParameters:parameters
                                              andProgress:progressBlock
                                                 andBlock:block
                                           andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (updateBlock ? updateBlock(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil);
}

@end
