//
//  WKRBlank_News_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_News_Worker.h"

@implementation WKRBlank_News_Worker

@synthesize nextBaseWorker;
@synthesize nextNewsWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLNews_Protocol>)nextNewsWorker
{
    return [[self.class alloc] initWithWorker:nextNewsWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextNewsWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLNews_Protocol>)nextNewsWorker_
{
    self = [super initWithWorker:nextNewsWorker_];
    if (self)
    {
        self.nextNewsWorker = nextNewsWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker enableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)newsId
                withBlock:(nullable PTCLNewsBlockVoidDAONewsNSErrorContinue)block
           andUpdateBlock:(nullable PTCLNewsBlockVoidDAONewsNSError)updateBlock
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doLoadObjectForId:newsId
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

- (void)doFavoriteObject:(nonnull DAONews*)news
               withBlock:(nullable PTCLNewsBlockVoidNSError)block
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doFavoriteObject:news
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

- (void)doUnfavoriteObject:(nonnull DAONews*)news
                 withBlock:(nullable PTCLNewsBlockVoidNSError)block
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doUnfavoriteObject:news
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

- (void)doFlagObject:(nonnull DAONews*)news
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
            andBlock:(nullable PTCLNewsBlockVoidNSError)block
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doFlagObject:news
                               withAction:action
                                  andText:text
                                 andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(error) : (void)nil;
}

- (void)doUnflagObject:(nonnull DAONews*)news
            withAction:(nonnull NSString*)action
               andText:(nonnull NSString*)text
              andBlock:(nullable PTCLNewsBlockVoidNSError)block
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doUnflagObject:news
                                 withAction:action
                                    andText:text
                                   andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(error) : (void)nil;
}

- (void)doCheckFlagObject:(nonnull DAONews*)news
               withAction:(nonnull NSString*)action
                 andBlock:(nullable PTCLNewsBlockVoidNSUIntegerNSError)block
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doCheckFlagObject:news
                                    withAction:action
                                      andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(0, error) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadFlagsForObject:(nonnull DAONews*)news
                 withActions:(nonnull NSArray<NSString*>*)actions
                    andBlock:(nullable PTCLNewsBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLNewsBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doLoadFlagsForObject:news
                                      withActions:actions
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

- (void)doLoadMyFlagsForObject:(nonnull DAONews*)news
                   withActions:(nonnull NSArray<NSString*>*)actions
                      andBlock:(nullable PTCLNewsBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
                andUpdateBlock:(nullable PTCLNewsBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextNewsWorker)
    {
        [self.nextNewsWorker doLoadMyFlagsForObject:news
                                        withActions:actions
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
