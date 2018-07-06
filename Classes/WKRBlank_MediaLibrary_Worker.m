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

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
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

- (void)doLoadAudio:(nonnull id)asset
               size:(CGSize)size
    completionBlock:(nullable PTCLMediaLibraryBlockVoidNSURLNSDictionary)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadAudio:asset
                                            size:size
                                 completionBlock:block];
        return;
    }
    
    block ? block(nil, @{ }) : (void)nil;
}

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

- (void)doLoadVideo:(nonnull id)asset
               size:(CGSize)size
    completionBlock:(nullable PTCLMediaLibraryBlockVoidNSURLNSDictionary)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadVideo:asset
                                            size:size
                                 completionBlock:block];
        return;
    }
    
    block ? block(nil, @{ }) : (void)nil;
}

- (void)doSaveImage:(UIImage* _Nullable)image
withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImage:image
                             withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveImage:(UIImage* _Nullable)image
       toCollection:(nonnull id)assetCollection
withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImage:image
                                    toCollection:assetCollection
                             withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveAudioFromUrl:(NSURL* _Nullable)videoUrl
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveAudioFromUrl:videoUrl
                                    withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveAudioFromUrl:(NSURL* _Nullable)videoUrl
              toCollection:(nonnull id)assetCollection
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveAudioFromUrl:videoUrl
                                           toCollection:assetCollection
                                    withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveImageFromUrl:(NSURL* _Nullable)imageUrl
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImageFromUrl:imageUrl
                                    withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveImageFromUrl:(NSURL* _Nullable)imageUrl
              toCollection:(nonnull id)assetCollection
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveImageFromUrl:imageUrl
                                           toCollection:assetCollection
                                    withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveVideoFromUrl:(NSURL* _Nullable)videoUrl
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveVideoFromUrl:videoUrl
                                    withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;
}

- (void)doSaveVideoFromUrl:(NSURL* _Nullable)videoUrl
              toCollection:(nonnull id)assetCollection
       withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidBOOLNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doSaveVideoFromUrl:videoUrl
                                           toCollection:assetCollection
                                    withCompletionBlock:block];
        return;
    }
    
    block ? block(YES, nil) : (void)nil;

}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadCollectionsWithCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSArrayNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadCollectionsWithCompletionBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], error) : (void)nil;
}

- (void)doLoadImagesOfMediaTypes:(nullable NSArray*)mediaTypes
             withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSArrayNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadImagesOfMediaTypes:mediaTypes
                                          withCompletionBlock:block];
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
                     ofMediaTypes:(nullable NSArray*)mediaTypes
              withCompletionBlock:(nullable PTCLMediaLibraryBlockVoidNSArrayNSError)block
{
    if (self.nextMediaLibraryWorker)
    {
        [self.nextMediaLibraryWorker doLoadImagesForCollection:assetCollection
                                                  ofMediaTypes:mediaTypes
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
