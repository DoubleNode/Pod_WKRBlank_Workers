//
//  WKRBlank_Photo_Worker.m
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
//

#import "WKRBlank_Photo_Worker.h"

@interface WKRBlank_Photo_Worker ()

@end

@implementation WKRBlank_Photo_Worker

@synthesize nextBaseWorker;
@synthesize nextPhotoWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLPhoto_Protocol>)nextPhotoWorker
{
    return [[self.class alloc] initWithWorker:nextPhotoWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextPhotoWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLPhoto_Protocol>)nextPhotoWorker_
{
    self = [super initWithWorker:nextPhotoWorker_];
    if (self)
    {
        self.nextPhotoWorker = nextPhotoWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker disableOption:option];
    }
    
    [super disableOption:option];
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)photoId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLPhotoBlockVoidDAOPhotoNSErrorContinue)block
           andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOPhotoNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadObjectForId:photoId
                                   withProgress:progressBlock
                                       andBlock:block
                                 andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doDeleteObject:(nonnull DAOPhoto*)photo
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLPhotoBlockVoidBOOLNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doDeleteObject:photo
                                withProgress:progressBlock
                                    andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObjectForId:(nonnull NSString*)photoId
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLPhotoBlockVoidBOOLNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doDeleteObjectForId:photoId
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOPhoto*)photo
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLPhotoBlockVoidDAOPhotoNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doSaveObject:photo
                              withProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFavoriteObject:(nonnull DAOPhoto*)photo
            withProgress:(nullable PTCLProgressBlock)progressBlock
                andBlock:(nullable PTCLPhotoBlockVoidNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doFavoriteObject:photo
                                  withProgress:progressBlock
                                      andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnfavoriteObject:(nonnull DAOPhoto*)photo
              withProgress:(nullable PTCLProgressBlock)progressBlock
                  andBlock:(nullable PTCLPhotoBlockVoidNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doUnfavoriteObject:photo
                                    withProgress:progressBlock
                                        andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFlagObject:(nonnull DAOPhoto*)photo
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
         andProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLPhotoBlockVoidNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doFlagObject:photo
                                withAction:action
                                   andText:text
                               andProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnflagObject:(nonnull DAOPhoto*)photo
            withAction:(nonnull NSString*)action
               andText:(nonnull NSString*)text
           andProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLPhotoBlockVoidNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doUnflagObject:photo
                                  withAction:action
                                     andText:text
                                 andProgress:progressBlock
                                    andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doCheckFlagObject:(nonnull DAOPhoto*)photo
               withAction:(nonnull NSString*)action
              andProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLPhotoBlockVoidNSUIntegerNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doCheckFlagObject:photo
                                     withAction:action
                                    andProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadItemForObject:(nonnull DAOPhoto*)photo
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLPhotoBlockVoidDAOItemNSErrorContinue)block
             andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOItemNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadItemForObject:photo
                                     withProgress:progressBlock
                                         andBlock:block
                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadLocationForObject:(nonnull DAOPhoto*)photo
                   withProgress:(nullable PTCLProgressBlock)progressBlock
                       andBlock:(nullable PTCLPhotoBlockVoidDAOLocationNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOLocationNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadLocationForObject:photo
                                         withProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadReviewForObject:(nonnull DAOPhoto*)photo
                 withProgress:(nullable PTCLProgressBlock)progressBlock
                     andBlock:(nullable PTCLPhotoBlockVoidDAOReviewNSErrorContinue)block
               andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOReviewNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadReviewForObject:photo
                                       withProgress:progressBlock
                                           andBlock:block
                                     andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadUserForObject:(nonnull DAOPhoto*)photo
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLPhotoBlockVoidDAOUserNSErrorContinue)block
             andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadUserForObject:photo
                                     withProgress:progressBlock
                                         andBlock:block
                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadFlagsForObject:(nonnull DAOPhoto*)photo
                 withActions:(nonnull NSArray<NSString*>*)actions
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLPhotoBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLPhotoBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadFlagsForObject:photo
                                       withActions:actions
                                       andProgress:progressBlock
                                          andBlock:block
                                    andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadMyFlagsForObject:(nonnull DAOPhoto*)photo
                   withActions:(nonnull NSArray<NSString*>*)actions
                   andProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLPhotoBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
                andUpdateBlock:(nullable PTCLPhotoBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadMyFlagsForObject:photo
                                         withActions:actions
                                         andProgress:progressBlock
                                            andBlock:block
                                      andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
