//
//  WKRBlank_Review_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Review_Worker.h"

@implementation WKRBlank_Review_Worker

@synthesize nextBaseWorker;
@synthesize nextReviewWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLReview_Protocol>)nextReviewWorker
{
    return [[self.class alloc] initWithWorker:nextReviewWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextReviewWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLReview_Protocol>)nextReviewWorker_
{
    self = [super initWithWorker:nextReviewWorker_];
    if (self)
    {
        self.nextReviewWorker = nextReviewWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker disableOption:option];
    }
    
    [super disableOption:option];
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)reviewId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLReviewBlockVoidDAOReviewNSErrorContinue)block
           andUpdateBlock:(nullable PTCLReviewBlockVoidDAOReviewNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadObjectForId:reviewId
                                    withProgress:progressBlock
                                        andBlock:block
                                  andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doDeleteObject:(nonnull DAOReview*)review
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLReviewBlockVoidBOOLNSError)block
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doDeleteObject:review
                                 withProgress:progressBlock
                                     andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObjectForId:(nonnull NSString*)reviewId
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLReviewBlockVoidBOOLNSError)block
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doDeleteObjectForId:reviewId
                                      withProgress:progressBlock
                                          andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOReview*)review
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLReviewBlockVoidDAOReviewNSError)block
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doSaveObject:review
                               withProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadCreatorForObject:(nonnull DAOReview*)review
                  withProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLReviewBlockVoidDAOUserNSErrorContinue)block
                andUpdateBlock:(nullable PTCLReviewBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadCreatorForObject:review
                                         withProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadItemForObject:(nonnull DAOReview*)review
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLReviewBlockVoidDAOItemNSErrorContinue)block
             andUpdateBlock:(nullable PTCLReviewBlockVoidDAOItemNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadItemForObject:review
                                      withProgress:progressBlock
                                          andBlock:block
                                    andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadLocationForObject:(nonnull DAOReview*)review
                   withProgress:(nullable PTCLProgressBlock)progressBlock
                       andBlock:(nullable PTCLReviewBlockVoidDAOLocationNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLReviewBlockVoidDAOLocationNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadLocationForObject:review
                                          withProgress:progressBlock
                                              andBlock:block
                                        andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadPhotoForObject:(nonnull DAOReview*)review
                withProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLReviewBlockVoidDAOPhotoNSErrorContinue)block
              andUpdateBlock:(nullable PTCLReviewBlockVoidDAOPhotoNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadPhotoForObject:review
                                       withProgress:progressBlock
                                           andBlock:block
                                     andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadUserForObject:(nonnull DAOReview*)review
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLReviewBlockVoidDAOUserNSErrorContinue)block
             andUpdateBlock:(nullable PTCLReviewBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadUserForObject:review
                                      withProgress:progressBlock
                                          andBlock:block
                                    andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadObjectsForItem:(nonnull DAOItem*)item
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLReviewBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLReviewBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadObjectsForItem:item
                                     withParameters:parameters
                                        andProgress:progressBlock
                                           andBlock:block
                                     andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjectsForLocation:(nonnull DAOLocation*)location
                  withParameters:(nullable NSDictionary*)parameters
                     andProgress:(nullable PTCLProgressBlock)progressBlock
                        andBlock:(nullable PTCLReviewBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLReviewBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadObjectsForLocation:location
                                         withParameters:parameters
                                            andProgress:progressBlock
                                               andBlock:block
                                         andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjectsForUser:(nonnull DAOUser*)user
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLReviewBlockVoidNSArrayNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLReviewBlockVoidNSArrayNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextReviewWorker)
    {
        [self.nextReviewWorker doLoadObjectsForUser:user
                                     withParameters:parameters
                                        andProgress:progressBlock
                                           andBlock:block
                                     andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
