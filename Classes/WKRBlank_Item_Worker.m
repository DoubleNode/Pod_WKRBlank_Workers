//
//  WKRBlank_Item_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Item_Worker.h"

@implementation WKRBlank_Item_Worker

@synthesize nextBaseWorker;
@synthesize nextItemWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLItem_Protocol>)nextItemWorker
{
    return [[self.class alloc] initWithWorker:nextItemWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextItemWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLItem_Protocol>)nextItemWorker_
{
    self = [super initWithWorker:nextItemWorker_];
    if (self)
    {
        self.nextItemWorker = nextItemWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker disableOption:option];
    }
    
    [super disableOption:option];
}

- (void)configure
{
    [super configure];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)itemId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLItemBlockVoidDAOItemNSErrorContinue)block
           andUpdateBlock:(nullable PTCLItemBlockVoidDAOItemNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadObjectForId:itemId
                                  withProgress:progressBlock
                                      andBlock:block
                                andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doDeleteObject:(nonnull DAOItem*)item
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLItemBlockVoidBOOLNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doDeleteObject:item
                               withProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObject:(nonnull DAOItem*)item
          fromCategory:(nonnull DAOCategory*)category
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLItemBlockVoidBOOLNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doDeleteObject:item
                               fromCategory:category
                               withProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteObject:(nonnull DAOItem*)item
          fromLocation:(nonnull DAOLocation*)location
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLItemBlockVoidBOOLNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doDeleteObject:item
                               fromLocation:location
                               withProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOItem*)item
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidDAOItemNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doSaveObject:item
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOItem*)item
          inCategory:(nonnull DAOCategory*)category
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidDAOItemNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doSaveObject:item
                               inCategory:category
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOItem*)item
          inLocation:(nonnull DAOLocation*)location
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidDAOItemNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doSaveObject:item
                               inLocation:location
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(nil, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveObjectOptions:(nonnull DAOItem*)item
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLItemBlockVoidBOOLNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doSaveObjectOptions:item
                                    withProgress:progressBlock
                                        andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveOption:(nonnull NSString*)optionId
              andKey:(nonnull NSString*)optionKey
            andValue:(nullable id)optionValue
             forItem:(nonnull DAOItem*)daoItem
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidBOOLNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doSaveOption:optionId
                                   andKey:optionKey
                                 andValue:optionValue
                                  forItem:daoItem
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(NO, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFavoriteObject:(nonnull DAOItem*)item
            withProgress:(nullable PTCLProgressBlock)progressBlock
                andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doFavoriteObject:item
                                 withProgress:progressBlock
                                     andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnfavoriteObject:(nonnull DAOItem*)item
              withProgress:(nullable PTCLProgressBlock)progressBlock
                  andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doUnfavoriteObject:item
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFlagObject:(nonnull DAOItem*)item
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
         andProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doFlagObject:item
                               withAction:action
                                  andText:text
                              andProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doFlagObject:(nonnull DAOItem*)item
             forUser:(nullable DAOUser*)flaggingUser
          withAction:(nonnull NSString*)action
             andText:(nonnull NSString*)text
         andProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doFlagObject:item
                                  forUser:flaggingUser
                               withAction:action
                                  andText:text
                              andProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doDeleteFlag:(nonnull DAOFlag*)flag
           forObject:(nonnull DAOItem*)item
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doDeleteFlag:flag
                                forObject:item
                             withProgress:progressBlock
                                 andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnflagObject:(nonnull DAOItem*)item
            withAction:(nonnull NSString*)action
               andText:(nonnull NSString*)text
           andProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doUnflagObject:item
                                 withAction:action
                                    andText:text
                                andProgress:progressBlock
                                   andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doCheckFlagObject:(nonnull DAOItem*)item
               withAction:(nonnull NSString*)action
              andProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLItemBlockVoidNSUIntegerNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doCheckFlagObject:item
                                    withAction:action
                                   andProgress:progressBlock
                                      andBlock:block];
        return;
    }
    
    block ? block(0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doSaveFlag:(nonnull DAOFlag*)flag
      withProgress:(nullable PTCLProgressBlock)progressBlock
          andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doSaveFlag:flag
                           withProgress:progressBlock
                               andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doTagObject:(nonnull DAOItem*)item
            withTag:(nonnull NSString*)tag
        andProgress:(nullable PTCLProgressBlock)progressBlock
           andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doTagObject:item
                                 withTag:tag
                             andProgress:progressBlock
                                andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUntagObject:(nonnull DAOItem*)item
              withTag:(nonnull NSString*)tag
          andProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doUntagObject:item
                                   withTag:tag
                               andProgress:progressBlock
                                  andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doWishlistObject:(nonnull DAOItem*)item
            withProgress:(nullable PTCLProgressBlock)progressBlock
                andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doWishlistObject:item
                                 withProgress:progressBlock
                                     andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

- (void)doUnwishlistObject:(nonnull DAOItem*)item
              withProgress:(nullable PTCLProgressBlock)progressBlock
                  andBlock:(nullable PTCLItemBlockVoidNSError)block
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doUnwishlistObject:item
                                   withProgress:progressBlock
                                       andBlock:block];
        return;
    }
    
    block ? block(BLANKWORKERERROR(ERROR_DOMAIN_CLASS)) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadFlagsForObject:(nonnull DAOItem*)item
                 withActions:(nonnull NSArray<NSString*>*)actions
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLItemBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLItemBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadFlagsForObject:item
                                      withActions:actions
                                      andProgress:progressBlock
                                         andBlock:block
                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadMyFlagsForObject:(nonnull DAOItem*)item
                   withActions:(nonnull NSArray<NSString*>*)actions
                   andProgress:(nullable PTCLProgressBlock)progressBlock
                      andBlock:(nullable PTCLItemBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSErrorContinue)block
                andUpdateBlock:(nullable PTCLItemBlockVoidNSArrayDAOFlagNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadMyFlagsForObject:item
                                        withActions:actions
                                        andProgress:progressBlock
                                           andBlock:block
                                     andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadLocationsForObject:(nonnull DAOItem*)item
                    withProgress:(nullable PTCLProgressBlock)progressBlock
                        andBlock:(nullable PTCLItemBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLItemBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadLocationsForObject:item
                                         withProgress:progressBlock
                                             andBlock:block
                                       andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadPhotosForObject:(nonnull DAOItem*)item
                 withProgress:(nullable PTCLProgressBlock)progressBlock
                     andBlock:(nullable PTCLItemBlockVoidNSArrayDAOPhotoNSUIntegerNSUIntegerNSErrorContinue)block
               andUpdateBlock:(nullable PTCLItemBlockVoidNSArrayDAOPhotoNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadPhotosForObject:item
                                      withProgress:progressBlock
                                          andBlock:block
                                    andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadTagsForObject:(nonnull DAOItem*)item
               withProgress:(nullable PTCLProgressBlock)progressBlock
                   andBlock:(nullable PTCLItemBlockVoidNSArrayNSStringNSUIntegerNSUIntegerNSErrorContinue)block
             andUpdateBlock:(nullable PTCLItemBlockVoidNSArrayNSStringNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadTagsForObject:item
                                    withProgress:progressBlock
                                        andBlock:block
                                  andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjects:(nonnull NSString*)searchId
             withText:(nonnull NSString*)search
       withParameters:(nullable NSDictionary*)parameters
          andProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLItemBlockVoidNSStringNSArrayDAOItemNSUIntegerNSUIntegerNSErrorContinue)block
       andUpdateBlock:(nullable PTCLItemBlockVoidNSStringNSArrayDAOItemNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadObjects:searchId
                                  withText:search
                            withParameters:parameters
                               andProgress:progressBlock
                                  andBlock:block
                            andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@"", @[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

- (void)doLoadObjectsWithTag:(nonnull NSString*)tag
              withParameters:(nullable NSDictionary*)parameters
                 andProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLItemBlockVoidNSArrayDAOItemNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLItemBlockVoidNSArrayDAOItemNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextItemWorker)
    {
        [self.nextItemWorker doLoadObjectsWithTag:tag
                                   withParameters:parameters
                                      andProgress:progressBlock
                                         andBlock:block
                                   andUpdateBlock:updateBlock];
        return;
    }
    
    block ? block(@[ ], 0, 0, BLANKWORKERERROR(ERROR_DOMAIN_CLASS), nil) : (void)nil;
}

@end
