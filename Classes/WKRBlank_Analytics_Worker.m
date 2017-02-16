//
//  WKRBlank_Analytics_Worker.m
//  DoubleNode Core
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

#import "WKRBlank_Analytics_Worker.h"

@interface WKRBlank_Analytics_Worker ()

@end

@implementation WKRBlank_Analytics_Worker

@synthesize nextBaseWorker;
@synthesize nextAnalyticsWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.rentmywardrobe.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLAnalytics_Protocol>)nextAnalyticsWorker
{
    return [[self.class alloc] initWithWorker:nextAnalyticsWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextAnalyticsWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLAnalytics_Protocol>)nextAnalyticsWorker_
{
    self = [super initWithWorker:nextAnalyticsWorker_];
    if (self)
    {
        self.nextAnalyticsWorker = nextAnalyticsWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker enableOption:option];
    }
    
    // Options not used in this Worker
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker disableOption:option];
    }
    
    // Options not used in this Worker
}

#pragma mark - Business Logic

#pragma mark - Identify

- (void)doIdentify:(NSString* _Nonnull)userId
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doIdentify:userId];
        return;
    }
}

- (void)doIdentify:(NSString* _Nonnull)userId traits:(NSDictionary* _Nonnull)traits
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doIdentify:userId traits:traits];
        return;
    }
}

- (void)doIdentify:(NSString* _Nonnull)userId traits:(NSDictionary* _Nonnull)traits options:(NSDictionary* _Nonnull)options
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doIdentify:userId traits:traits options:options];
        return;
    }
}

#pragma mark - Track

- (void)doTrack:(NSString* _Nonnull)event
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doTrack:event];
        return;
    }
}

- (void)doTrack:(NSString* _Nonnull)event properties:(NSDictionary* _Nonnull)properties
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doTrack:event properties:properties];
        return;
    }
}

- (void)doTrack:(NSString* _Nonnull)event properties:(NSDictionary* _Nonnull)properties options:(NSDictionary* _Nonnull)options
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doTrack:event properties:properties options:options];
        return;
    }
}

#pragma mark - Screen

- (void)doScreen:(NSString* _Nonnull)screenTitle
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doScreen:screenTitle];
        return;
    }
}

- (void)doScreen:(NSString* _Nonnull)screenTitle properties:(NSDictionary* _Nonnull)properties
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doScreen:screenTitle properties:properties];
        return;
    }
}

- (void)doScreen:(NSString* _Nonnull)screenTitle properties:(NSDictionary* _Nonnull)properties options:(NSDictionary* _Nonnull)options
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doScreen:screenTitle properties:properties options:options];
        return;
    }
}

#pragma mark - Group

- (void)doGroup:(NSString* _Nonnull)groupId
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doGroup:groupId];
        return;
    }
}

- (void)doGroup:(NSString* _Nonnull)groupId traits:(NSDictionary* _Nonnull)traits
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doGroup:groupId traits:traits];
        return;
    }
}

- (void)doGroup:(NSString* _Nonnull)groupId traits:(NSDictionary* _Nonnull)traits options:(NSDictionary* _Nonnull)options
{
    if (self.nextAnalyticsWorker)
    {
        [self.nextAnalyticsWorker doGroup:groupId traits:traits options:options];
        return;
    }
}

@end
