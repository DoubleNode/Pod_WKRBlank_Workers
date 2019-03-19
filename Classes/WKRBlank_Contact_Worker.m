//
//  WKRBlank_Contact_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Contact_Worker.h"

@interface WKRBlank_Contact_Worker ()

@end

@implementation WKRBlank_Contact_Worker

@synthesize nextBaseWorker;
@synthesize nextContactWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLContact_Protocol>)nextContactWorker
{
    return [[self.class alloc] initWithWorker:nextContactWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextContactWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLContact_Protocol>)nextContactWorker_
{
    self = [super initWithWorker:nextContactWorker_];
    if (self)
    {
        self.nextContactWorker = nextContactWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextContactWorker)
    {
        [self.nextContactWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextContactWorker)
    {
        [self.nextContactWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)contactId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLContactBlockVoidDAOContactNSErrorContinue)block
           andUpdateBlock:(nullable PTCLContactBlockVoidDAOContactNSError)updateBlock
{
    if (self.nextContactWorker)
    {
        [self.nextContactWorker doLoadObjectForId:contactId
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
    block ? block(nil, error, nil) : (updateBlock ? updateBlock(nil, error) : (void)nil);
}

- (void)doDeleteObject:(nonnull DAOContact*)contact
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLContactBlockVoidBOOLNSError)block
{
    if (self.nextContactWorker)
    {
        [self.nextContactWorker doDeleteObject:contact
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

- (void)doSaveObject:(nonnull DAOContact*)contact
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLContactBlockVoidDAOContactNSError)block
{
    if (self.nextContactWorker)
    {
        [self.nextContactWorker doSaveObject:contact
                                withProgress:progressBlock
                                    andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLContactBlockVoidNSArrayDAOContactNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLContactBlockVoidNSArrayDAOContactNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextContactWorker)
    {
        [self.nextContactWorker doLoadObjectsForUser:user
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
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

@end
