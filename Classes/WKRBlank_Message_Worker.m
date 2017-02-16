//
//  WKRBlank_Message_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Message_Worker.h"

@implementation WKRBlank_Message_Worker

@synthesize nextBaseWorker;
@synthesize nextMessageWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.rentmywardrobe.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLMessage_Protocol>)nextMessageWorker
{
    return [[self.class alloc] initWithWorker:nextMessageWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextMessageWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLMessage_Protocol>)nextMessageWorker_
{
    self = [super initWithWorker:nextMessageWorker_];
    if (self)
    {
        self.nextMessageWorker = nextMessageWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextMessageWorker)
    {
        [self.nextMessageWorker enableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextMessageWorker)
    {
        [self.nextMessageWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doSaveObject:(nonnull DAOMessage*)message
           withBlock:(nullable PTCLMessageBlockVoidDAOMessageNSError)block
{
    if (self.nextMessageWorker)
    {
        [self.nextMessageWorker doSaveObject:message
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

@end
