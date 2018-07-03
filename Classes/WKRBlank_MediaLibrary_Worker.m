//
//  WKRBlank_File_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import <Photos/PHImageManager.h>

#import "WKRBlank_MediaLibrary_Worker.h"

@interface WKRBlank_MediaLibrary_Worker ()

@end

@implementation WKRBlank_MediaLibrary_Worker

@synthesize nextBaseWorker;
@synthesize nextMediaLibraryWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.rentmywardrobe.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLMediaLibrary_Protocol>)nextMediaLibraryWorker
{
    return [[self.class alloc] initWithWorker:nextMediaLibraryWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextMediaLibraryWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLMediaLibrary_Protocol>)nextMediaLibraryWorker_
{
    self = [super initWithWorker:nextMediaLibraryWorker_];
    if (self)
    {
        self.nextMediaLibraryWorker = nextMediaLibraryWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker enableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic

+ (CGSize)PTCLMediaLibraryMaximumSize
{
    return PHImageManagerMaximumSize;
}

#pragma mark - Business Logic / Single Item CRUD

- (BOOL)doCheckAuthorization
{
    if (self.nextMediaLibraryWorker)
    {
        return [self.nextMediaLibraryWorker doCheckAuthorization];
    }
    
    return NO;
}

- (void)doRequestAuthorizationWithCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doRequestAuthorizationWithCompletionBlock:block];
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

- (void)doLoadImage:(nonnull id)asset
               size:(CGSize)size
    completionBlock:(nullable PTCLMediaLibraryBlockVoidUIImageNSDictionary)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadImage:asset
                                            size:size
                                 completionBlock:block];
        return;
    }
    
    block ? block(nil, @{ }) : (void)nil;
}

- (void)doSaveImage:(UIImage* _Nullable)image
withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImage:image
                             withCompletionBlock:completionBlock];
        return;
    }
    
    completionBlock ? completionBlock(YES, nil) : (void)nil;
}

- (void)doSaveImage:(UIImage* _Nullable)image
       toCollection:(nonnull id)assetCollection
withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImage:image
                                    toCollection:assetCollection
                             withCompletionBlock:completionBlock];
        return;
    }
    
    completionBlock ? completionBlock(YES, nil) : (void)nil;
}

- (void)doSaveImageFromUrl:(NSURL* _Nullable)imageUrl
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImageFromUrl:imageUrl
                                    withCompletionBlock:completionBlock];
        return;
    }
    
    completionBlock ? completionBlock(YES, nil) : (void)nil;
}

- (void)doSaveImageFromUrl:(NSURL* _Nullable)imageUrl
              toCollection:(nonnull id)assetCollection
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImageFromUrl:imageUrl
                                           toCollection:assetCollection
                                    withCompletionBlock:completionBlock];
        return;
    }
    
    completionBlock ? completionBlock(YES, nil) : (void)nil;
}

- (void)doSaveVideoFromUrl:(NSURL* _Nullable)videoUrl
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveVideoFromUrl:videoUrl
                                    withCompletionBlock:completionBlock];
        return;
    }
    
    completionBlock ? completionBlock(YES, nil) : (void)nil;
}

- (void)doSaveVideoFromUrl:(NSURL* _Nullable)videoUrl
              toCollection:(nonnull id)assetCollection
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveVideoFromUrl:videoUrl
                                           toCollection:assetCollection
                                    withCompletionBlock:completionBlock];
        return;
    }
    
    completionBlock ? completionBlock(YES, nil) : (void)nil;

}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadCollectionsWithCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSArrayNSError)completionBlock
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadCollectionsWithCompletionBlock:completionBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    completionBlock ? completionBlock(@[ ], error) : (void)nil;
}

- (void)doLoadImagesWithCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSArrayNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadImagesWithCompletionBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

- (void)doLoadImagesForCollection:(nonnull id)assetCollection
              withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSArrayNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadImagesForCollection:assetCollection
                                           withCompletionBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], error) : (void)nil;
}

@end
