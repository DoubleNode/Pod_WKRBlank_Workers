//
//  WKRBlank_UserNotificationSetting_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_UserNotificationSetting_Worker.h"

@interface WKRBlank_UserNotificationSetting_Worker ()

@end

@implementation WKRBlank_UserNotificationSetting_Worker

@synthesize nextBaseWorker;
@synthesize nextUserNotificationSettingWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLUserNotificationSetting_Protocol>)nextUserNotificationSettingWorker
{
    return [[self.class alloc] initWithWorker:nextUserNotificationSettingWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextUserNotificationSettingWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLUserNotificationSetting_Protocol>)nextUserNotificationSettingWorker_
{
    self = [super initWithWorker:nextUserNotificationSettingWorker_];
    if (self)
    {
        self.nextUserNotificationSettingWorker = nextUserNotificationSettingWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextUserNotificationSettingWorker)
    {
        [self.nextUserNotificationSettingWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextUserNotificationSettingWorker)
    {
        [self.nextUserNotificationSettingWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)userNotificationSettingId
                andUserId:(nonnull NSString*)userId
                withBlock:(nullable PTCLUserNotificationSettingBlockVoidDAOUserNotificationSettingNSErrorContinue)block
           andUpdateBlock:(nullable PTCLUserNotificationSettingBlockVoidDAOUserNotificationSettingNSError)updateBlock
{
    if (self.nextUserNotificationSettingWorker)
    {
        [self.nextUserNotificationSettingWorker doLoadObjectForId:userNotificationSettingId
                                                        andUserId:userId
                                                        withBlock:block
                                                   andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error, nil) : (updateBlock ? updateBlock(nil, error) : (void)nil);
}

- (void)doSaveObject:(nonnull DAOUserNotificationSetting*)userNotificationSetting
           withBlock:(nullable PTCLUserNotificationSettingBlockVoidBOOLNSError)block
{
    if (self.nextUserNotificationSettingWorker)
    {
        [self.nextUserNotificationSettingWorker doSaveObject:userNotificationSetting
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

#pragma mark - Collection Items CRUD

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                    andBlock:(nullable PTCLUserNotificationSettingBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLUserNotificationSettingBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextUserNotificationSettingWorker)
    {
        [self.nextUserNotificationSettingWorker doLoadObjectsForUser:user
                                                      withParameters:parameters
                                                            andBlock:block
                                                      andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

@end
