//
//  WKRBlank_Favorite_Worker.m
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
//

#import "WKRBlank_Favorite_Worker.h"

@implementation WKRBlank_Favorite_Worker

@synthesize nextBaseWorker;
@synthesize nextFavoriteWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLFavorite_Protocol>)nextFavoriteWorker
{
    return [[self.class alloc] initWithWorker:nextFavoriteWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextFavoriteWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLFavorite_Protocol>)nextFavoriteWorker_
{
    self = [super initWithWorker:nextFavoriteWorker_];
    if (self)
    {
        self.nextFavoriteWorker = nextFavoriteWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)favoriteId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLFavoriteBlockVoidDAOFavoriteNSErrorContinue)block
           andUpdateBlock:(nullable PTCLFavoriteBlockVoidDAOFavoriteNSError)updateBlock
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doLoadObjectForId:favoriteId
                                      withProgress:progressBlock
                                          andBlock:block
                                    andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doDeleteObject:(nonnull DAOFavorite*)favorite
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLFavoriteBlockVoidBOOLNSError)block
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doDeleteObject:favorite
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObjectForId:(nonnull NSString*)favoriteId
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLFavoriteBlockVoidBOOLNSError)block
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doDeleteObjectForId:favoriteId
                                        withProgress:progressBlock
                                            andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObjectForItem:(nonnull DAOItem*)item
                 withProgress:(nullable PTCLProgressBlock)progressBlock
                     andBlock:(nullable PTCLFavoriteBlockVoidBOOLNSError)block
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doDeleteObjectForItem:item
                                          withProgress:progressBlock
                                              andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadItemForObject:(nonnull DAOFavorite*)favorite
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLFavoriteBlockVoidDAOItemNSErrorContinue)block
             andUpdateBlock:(nullable PTCLFavoriteBlockVoidDAOItemNSError)updateBlock
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doLoadItemForObject:favorite
                                        withProgress:progressBlock
                                            andBlock:block
                                      andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadUserForObject:(nonnull DAOFavorite*)favorite
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLFavoriteBlockVoidDAOUserNSErrorContinue)block
             andUpdateBlock:(nullable PTCLFavoriteBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doLoadUserForObject:favorite
                                        withProgress:progressBlock
                                            andBlock:block
                                      andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLFavoriteBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLFavoriteBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextFavoriteWorker)
    {
        [self.nextFavoriteWorker doLoadObjectsForUser:user
                                       withParameters:parameters
                                          andProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
