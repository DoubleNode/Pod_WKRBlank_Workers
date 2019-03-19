//
//  WKRBlank_Transaction_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Transaction_Worker.h"

@interface WKRBlank_Transaction_Worker ()

@end

@implementation WKRBlank_Transaction_Worker

@synthesize nextBaseWorker;
@synthesize nextTransactionWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLTransaction_Protocol>)nextTransactionWorker
{
    return [[self.class alloc] initWithWorker:nextTransactionWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextTransactionWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLTransaction_Protocol>)nextTransactionWorker_
{
    self = [super initWithWorker:nextTransactionWorker_];
    if (self)
    {
        self.nextTransactionWorker = nextTransactionWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextTransactionWorker)
    {
        [self.nextTransactionWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextTransactionWorker)
    {
        [self.nextTransactionWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForOrderId:(nonnull NSString*)orderId
                         andId:(nonnull NSString*)transactionId
                  withProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLTransactionBlockVoidDAOTransactionNSErrorContinue)block
                andUpdateBlock:(nullable PTCLTransactionBlockVoidDAOTransactionNSError)updateBlock
{
    if (self.nextTransactionWorker)
    {
        [self.nextTransactionWorker doLoadObjectForOrderId:orderId
                                                     andId:transactionId
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

- (void)doDeleteObject:(nonnull DAOTransaction*)transaction
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLTransactionBlockVoidBOOLNSError)block
{
    if (self.nextTransactionWorker)
    {
        [self.nextTransactionWorker doDeleteObject:transaction
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

- (void)doSaveObject:(nonnull DAOTransaction*)transaction
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLTransactionBlockVoidDAOTransactionNSError)block
{
    if (self.nextTransactionWorker)
    {
        [self.nextTransactionWorker doSaveObject:transaction
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

@end
