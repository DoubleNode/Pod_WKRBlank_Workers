//
//  WKRBlank_Cache_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Cache_Worker.h"

@interface WKRBlank_Cache_Worker ()

@end

@implementation WKRBlank_Cache_Worker

@synthesize nextBaseWorker;
@synthesize nextCacheWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLCache_Protocol>)nextCacheWorker
{
    return [[self.class alloc] initWithWorker:nextCacheWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextCacheWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLCache_Protocol>)nextCacheWorker_
{
    self = [super initWithWorker:nextCacheWorker_];
    if (self)
    {
        self.nextCacheWorker = nextCacheWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextCacheWorker)
    {
        [self.nextCacheWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextCacheWorker)
    {
        [self.nextCacheWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)cacheId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLCacheBlockVoidIDNSError)block
{
    if (self.nextCacheWorker)
    {
        [self.nextCacheWorker doLoadObjectForId:cacheId
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doLoadImageForUrl:(nonnull NSURL*)url
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLCacheBlockVoidIDNSError)block
{
    if (self.nextCacheWorker)
    {
        [self.nextCacheWorker doLoadImageForUrl:url
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObjectForId:(nonnull NSString*)cacheId
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLCacheBlockVoidNSError)block
{
    if (self.nextCacheWorker)
    {
        [self.nextCacheWorker doDeleteObjectForId:cacheId
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull id)object
               forId:(nonnull NSString*)cacheId
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLCacheBlockVoidNSError)block
{
    if (self.nextCacheWorker)
    {
        [self.nextCacheWorker doSaveObject:object
                                     forId:cacheId
                              withProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

@end
