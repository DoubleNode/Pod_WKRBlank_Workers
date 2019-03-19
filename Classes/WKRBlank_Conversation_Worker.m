//
//  WKRBlank_Conversation_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Conversation_Worker.h"

@interface WKRBlank_Conversation_Worker ()

@end

@implementation WKRBlank_Conversation_Worker

@synthesize nextBaseWorker;
@synthesize nextConversationWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLConversation_Protocol>)nextConversationWorker
{
    return [[self.class alloc] initWithWorker:nextConversationWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextConversationWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLConversation_Protocol>)nextConversationWorker_
{
    self = [super initWithWorker:nextConversationWorker_];
    if (self)
    {
        self.nextConversationWorker = nextConversationWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic / Single Item CRUD

- (void)doLoadObjectForId:(nonnull NSString*)conversationId
             withProgress:(nullable PTCLProgressBlock)progressBlock
                 andBlock:(nullable PTCLConversationBlockVoidDAOConversationNSErrorContinue)block
           andUpdateBlock:(nullable PTCLConversationBlockVoidDAOConversationNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadObjectForId:conversationId
                                          withProgress:progressBlock
                                              andBlock:block
                                        andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error, nil) : (updateBlock ? updateBlock(nil, error) : (void)nil);
}

- (void)doDeleteObject:(nonnull DAOConversation*)conversation
          withProgress:(nullable PTCLProgressBlock)progressBlock
              andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doDeleteObject:conversation
                                       withProgress:progressBlock
                                           andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doSaveObject:(nonnull DAOConversation*)conversation
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLConversationBlockVoidDAOConversationNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doSaveObject:conversation
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(nil, error) : (void)nil;
}

#pragma mark - Business Logic / Single Item Relationship CRUD

- (void)doAddCategory:(nonnull DAOCategory*)category
             toObject:(nonnull DAOConversation*)conversation
         withProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doAddCategory:category
                                          toObject:conversation
                                      withProgress:progressBlock
                                          andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doAddItem:(nonnull DAOItem*)item
         toObject:(nonnull DAOConversation*)conversation
     withProgress:(nullable PTCLProgressBlock)progressBlock
         andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doAddItem:item
                                      toObject:conversation
                                  withProgress:progressBlock
                                      andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doAddLocation:(nonnull DAOLocation*)location
             toObject:(nonnull DAOConversation*)conversation
         withProgress:(nullable PTCLProgressBlock)progressBlock
             andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doAddLocation:location
                                          toObject:conversation
                                      withProgress:progressBlock
                                          andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doAddUser:(nonnull DAOUser*)user
         toObject:(nonnull DAOConversation*)conversation
     withProgress:(nullable PTCLProgressBlock)progressBlock
         andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doAddUser:user
                                      toObject:conversation
                                  withProgress:progressBlock
                                      andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doRemoveCategory:(nonnull DAOCategory*)category
              fromObject:(nonnull DAOConversation*)conversation
            withProgress:(nullable PTCLProgressBlock)progressBlock
                andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doRemoveCategory:category
                                           fromObject:conversation
                                         withProgress:progressBlock
                                             andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doRemoveItem:(nonnull DAOItem*)item
          fromObject:(nonnull DAOConversation*)conversation
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doRemoveItem:item
                                       fromObject:conversation
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doRemoveLocation:(nonnull DAOLocation*)location
              fromObject:(nonnull DAOConversation*)conversation
            withProgress:(nullable PTCLProgressBlock)progressBlock
                andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doRemoveLocation:location
                                           fromObject:conversation
                                         withProgress:progressBlock
                                             andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

- (void)doRemoveUser:(nonnull DAOUser*)user
          fromObject:(nonnull DAOConversation*)conversation
        withProgress:(nullable PTCLProgressBlock)progressBlock
            andBlock:(nullable PTCLConversationBlockVoidBOOLNSError)block
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doRemoveUser:user
                                       fromObject:conversation
                                     withProgress:progressBlock
                                         andBlock:block];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(NO, error) : (void)nil;
}

#pragma mark - Business Logic / Collection Items CRUD

- (void)doLoadCategoriesForObject:(nonnull DAOConversation*)conversation
                     withProgress:(nullable PTCLProgressBlock)progressBlock
                         andBlock:(nullable PTCLConversationBlockVoidNSArrayDAOCategoryNSUIntegerNSUIntegerNSErrorContinue)block
                   andUpdateBlock:(nullable PTCLConversationBlockVoidNSArrayDAOCategoryNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadCategoriesForObject:conversation
                                                  withProgress:progressBlock
                                                      andBlock:block
                                                andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

- (void)doLoadItemsForObject:(nonnull DAOConversation*)conversation
                withProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLConversationBlockVoidNSArrayDAOItemNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLConversationBlockVoidNSArrayDAOItemNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadItemsForObject:conversation
                                             withProgress:progressBlock
                                                 andBlock:block
                                           andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

- (void)doLoadLocationsForObject:(nonnull DAOConversation*)conversation
                    withProgress:(nullable PTCLProgressBlock)progressBlock
                        andBlock:(nullable PTCLConversationBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSErrorContinue)block
                  andUpdateBlock:(nullable PTCLConversationBlockVoidNSArrayDAOLocationNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadLocationsForObject:conversation
                                                 withProgress:progressBlock
                                                     andBlock:block
                                               andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

- (void)doLoadMessagesForObject:(nonnull DAOConversation*)conversation
                   withProgress:(nullable PTCLProgressBlock)progressBlock
                       andBlock:(nullable PTCLConversationBlockVoidNSArrayDAOMessageNSUIntegerNSUIntegerNSErrorContinue)block
                 andUpdateBlock:(nullable PTCLConversationBlockVoidNSArrayDAOMessageNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadMessagesForObject:conversation
                                                withProgress:progressBlock
                                                    andBlock:block
                                              andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

- (void)doLoadUsersForObject:(nonnull DAOConversation*)conversation
                withProgress:(nullable PTCLProgressBlock)progressBlock
                    andBlock:(nullable PTCLConversationBlockVoidNSArrayDAOUserNSUIntegerNSUIntegerNSErrorContinue)block
              andUpdateBlock:(nullable PTCLConversationBlockVoidNSArrayDAOUserNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadUsersForObject:conversation
                                             withProgress:progressBlock
                                                 andBlock:block
                                           andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

- (void)doLoadObjectsWithProgress:(nullable PTCLProgressBlock)progressBlock
                         andBlock:(nullable PTCLConversationBlockVoidNSArrayDAOConversationNSUIntegerNSUIntegerNSErrorContinue)block
                andUpdateBlock:(nullable PTCLConversationBlockVoidNSArrayDAOConversationNSUIntegerNSUIntegerNSError)updateBlock
{
    if (self.nextConversationWorker)
    {
        [self.nextConversationWorker doLoadObjectsWithProgress:progressBlock
                                                      andBlock:block
                                             andUpdateBlock:updateBlock];
        return;
    }
    
    NSError*   error = [NSError errorWithDomain:ERROR_DOMAIN_CLASS
                                           code:ERROR_NOT_IMPLEMENTED
                                       userInfo:@{ NSLocalizedDescriptionKey: NSLocalizedString(@"The worker is not implemented.", nil),
                                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Blank worker should not be actually used for real functionality.", nil)
                                                   }];
    block ? block(@[ ], 0, 0, error, nil) : (updateBlock ? updateBlock(@[ ], 0, 0, error) : (void)nil);
}

@end
