//
//  WKRBlank_Order_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Order_Worker.h"

@interface WKRBlank_Order_Worker ()

@end

@implementation WKRBlank_Order_Worker

@synthesize nextBaseWorker;
@synthesize nextOrderWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLOrder_Protocol>)nextOrderWorker
{
    return [[self.class alloc] initWithWorker:nextOrderWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextOrderWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLOrder_Protocol>)nextOrderWorker_
{
    self = [super initWithWorker:nextOrderWorker_];
    if (self)
    {
        self.nextOrderWorker = nextOrderWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker enableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)orderId
                withBlock:(nullable PTCLOrderBlockVoidDAOOrderNSErrorContinue)block
           andUpdateBlock:(nullable PTCLOrderBlockVoidDAOOrderNSError)updateBlock
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doLoadObjectForId:orderId
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

- (void)doDeleteObject:(nonnull DAOOrder*)order
             withBlock:(nullable PTCLOrderBlockVoidBOOLNSError)block
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doDeleteObject:order
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

- (void)doSaveObject:(nonnull DAOOrder*)order
           withBlock:(nullable PTCLOrderBlockVoidDAOOrderNSError)block
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doSaveObject:order
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

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadLineitemsForObject:(nonnull DAOOrder*)order
                       withBlock:(nullable PTCLOrderBlockVoidNSArrayDAOLineitemNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLOrderBlockVoidNSArrayDAOLineitemNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doLoadLineitemsForObject:order
                                             withBlock:block
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

- (void)doLoadTransactionsForObject:(nonnull DAOOrder*)order
                          withBlock:(nullable PTCLOrderBlockVoidNSArrayDAOTransactionNSUIntegerNSUIntegerNSErrorContinue)block
                     andUpdateBlock:(nullable PTCLOrderBlockVoidNSArrayDAOTransactionNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doLoadTransactionsForObject:order
                                                withBlock:block
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

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadObjectsForLocation:(nonnull DAOLocation*)location
                  withParameters:(nullable NSDictionary*)parameters
                        andBlock:(nullable PTCLOrderBlockVoidNSArrayDAOOrderNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLOrderBlockVoidNSArrayDAOOrderNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doLoadObjectsForLocation:location
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

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                    andBlock:(nullable PTCLOrderBlockVoidNSArrayDAOOrderNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLOrderBlockVoidNSArrayDAOOrderNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextOrderWorker)
    {
        [self.nextOrderWorker doLoadObjectsForUser:user
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
