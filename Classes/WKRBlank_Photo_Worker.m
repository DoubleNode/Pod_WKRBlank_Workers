//
//  WKRBlank_Photo_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Photo_Worker.h"

@interface WKRBlank_Photo_Worker ()

@end

@implementation WKRBlank_Photo_Worker

@synthesize nextBaseWorker;
@synthesize nextPhotoWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.rentmywardrobe.%@", NSStringFromClass([self class])]
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
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)photoId
                withBlock:(nullable PTCLPhotoBlockVoidDAOPhotoNSErrorContinue)block
           andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOPhotoNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadObjectForId:photoId
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

- (void)doDeleteObject:(nonnull DAOPhoto*)photo
             withBlock:(nullable PTCLPhotoBlockVoidBOOLNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doDeleteObject:photo
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

- (void)doDeleteObjectForId:(nonnull NSString*)photoId
                  withBlock:(nullable PTCLPhotoBlockVoidBOOLNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doDeleteObjectForId:photoId
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

- (void)doSaveObject:(nonnull DAOPhoto*)photo
           withBlock:(nullable PTCLPhotoBlockVoidDAOPhotoNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doSaveObject:photo
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

- (void)doFavoriteObject:(nonnull DAOPhoto*)photo
               withBlock:(nullable PTCLPhotoBlockVoidNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doFavoriteObject:photo
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

- (void)doUnfavoriteObject:(nonnull DAOPhoto*)photo
                 withBlock:(nullable PTCLPhotoBlockVoidNSError)block
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doUnfavoriteObject:photo
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

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doLoadItemForObject:(nonnull DAOPhoto*)photo
                  withBlock:(nullable PTCLPhotoBlockVoidDAOItemNSErrorContinue)block
             andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOItemNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadItemForObject:photo
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

- (void)doLoadLocationForObject:(nonnull DAOPhoto*)photo
                      withBlock:(nullable PTCLPhotoBlockVoidDAOLocationNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOLocationNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadLocationForObject:photo
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

- (void)doLoadReviewForObject:(nonnull DAOPhoto*)photo
                    withBlock:(nullable PTCLPhotoBlockVoidDAOReviewNSErrorContinue)block
               andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOReviewNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadReviewForObject:photo
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

- (void)doLoadUserForObject:(nonnull DAOPhoto*)photo
                  withBlock:(nullable PTCLPhotoBlockVoidDAOUserNSErrorContinue)block
             andUpdateBlock:(nullable PTCLPhotoBlockVoidDAOUserNSError)updateBlock
{
    if (self.nextPhotoWorker)
    {
        [self.nextPhotoWorker doLoadUserForObject:photo
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

@end
