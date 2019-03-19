//
//  WKRBlank_PaymentAccount_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_PaymentAccount_Worker.h"

@interface WKRBlank_PaymentAccount_Worker ()

@end

@implementation WKRBlank_PaymentAccount_Worker

@synthesize nextBaseWorker;
@synthesize nextPaymentAccountWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLPaymentAccount_Protocol>)nextPaymentAccountWorker
{
    return [[self.class alloc] initWithWorker:nextPaymentAccountWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextPaymentAccountWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLPaymentAccount_Protocol>)nextPaymentAccountWorker_
{
    self = [super initWithWorker:nextPaymentAccountWorker_];
    if (self)
    {
        self.nextPaymentAccountWorker = nextPaymentAccountWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)paymentAccountId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLPaymentAccountBlockVoidDAOPaymentAccountNSErrorContinue)block
           andUpdateBlock:(nullable PTCLPaymentAccountBlockVoidDAOPaymentAccountNSError)updateBlock
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker doLoadObjectForId:paymentAccountId
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

- (void)doDeleteObject:(nonnull DAOPaymentAccount*)paymentAccount
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLPaymentAccountBlockVoidBOOLNSError)block
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker doDeleteObject:paymentAccount
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

- (void)doSaveObject:(nonnull DAOPaymentAccount*)paymentAccount
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLPaymentAccountBlockVoidDAOPaymentAccountNSError)block
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker doSaveObject:paymentAccount
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

- (void)doVerifyObject:(nonnull DAOPaymentAccount*)paymentAccount
          withDeposit1:(NSUInteger)deposit1
           andDeposit2:(NSUInteger)deposit2
           andProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLPaymentAccountBlockVoidBOOLNSError)block
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker doVerifyObject:paymentAccount
                                         withDeposit1:deposit1
                                          andDeposit2:deposit2
                                          andProgress:progressBlock
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

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadContactForObject:(nonnull DAOPaymentAccount*)paymentAccount
                  withProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLPaymentAccountBlockVoidDAOContactNSErrorContinue)block
                andUpdateBlock:(nullable PTCLPaymentAccountBlockVoidDAOContactNSError)updateBlock
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker doLoadContactForObject:paymentAccount
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

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLPaymentAccountBlockVoidNSArrayDAOPaymentAccountNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLPaymentAccountBlockVoidNSArrayDAOPaymentAccountNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextPaymentAccountWorker)
    {
        [self.nextPaymentAccountWorker doLoadObjectsForUser:user
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
