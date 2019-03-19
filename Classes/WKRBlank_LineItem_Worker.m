//
//  WKRBlank_Lineitem_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_LineItem_Worker.h"

@interface WKRBlank_Lineitem_Worker ()

@end

@implementation WKRBlank_Lineitem_Worker

@synthesize nextBaseWorker;
@synthesize nextLineitemWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLLineitem_Protocol>)nextLineitemWorker
{
    return [[self.class alloc] initWithWorker:nextLineitemWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextLineitemWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLLineitem_Protocol>)nextLineitemWorker_
{
    self = [super initWithWorker:nextLineitemWorker_];
    if (self)
    {
        self.nextLineitemWorker = nextLineitemWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextLineitemWorker)
    {
        [self.nextLineitemWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextLineitemWorker)
    {
        [self.nextLineitemWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForOrderId:(nonnull NSString*)orderId
                         andId:(nonnull NSString*)lineitemId
                  withProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLLineitemBlockVoidDAOLineitemNSErrorContinue)block
                andUpdateBlock:(nullable PTCLLineitemBlockVoidDAOLineitemNSError)updateBlock
{
    if (self.nextLineitemWorker)
    {
        [self.nextLineitemWorker doLoadObjectForOrderId:orderId
                                                  andId:lineitemId
                                           withProgress:progressBlock
                                               andBlock:block
                                         andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (updateBlock ? updateBlock(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil);
}

- (void)doDeleteObject:(nonnull DAOLineitem*)lineitem
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLLineitemBlockVoidBOOLNSError)block
{
    if (self.nextLineitemWorker)
    {
        [self.nextLineitemWorker doDeleteObject:lineitem
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOLineitem*)lineitem
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLLineitemBlockVoidDAOLineitemNSError)block
{
    if (self.nextLineitemWorker)
    {
        [self.nextLineitemWorker doSaveObject:lineitem
                                 withProgress:progressBlock
                                     andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

@end
