//
//  WKRBlank_Validation_Worker.m
//  DoubleNode Blank Workers
//
//  Created by Darren Ehlers on 2016/10/16.
//  Copyright © 2016 Darren Ehlers and DoubleNode, LLC.
//
//  WKRBlank_Workers is released under the MIT license. See LICENSE for details.
//

#import "WKRBlank_Validation_Worker.h"

@interface WKRBlank_Validation_Worker ()

@end

@implementation WKRBlank_Validation_Worker

@synthesize nextBaseWorker;
@synthesize nextValidationWorker;

#define ERROR_DOMAIN_CLASS      [NSString stringWithFormat:@"com.doublenode.%@", NSStringFromClass([self class])]
#define ERROR_UNKNOWN           1001
#define ERROR_NOT_IMPLEMENTED   1002

@synthesize minimumBirthdayAge;
@synthesize maximumBirthdayAge;

@synthesize minimumHandleLength;
@synthesize maximumHandleLength;

@synthesize minimumNameLength;
@synthesize maximumNameLength;

@synthesize minimumNumberValue;
@synthesize maximumNumberValue;

@synthesize requiredPasswordStrength;

@synthesize minimumPercentageValue;
@synthesize maximumPercentageValue;

@synthesize minimumPhoneLength;
@synthesize maximumPhoneLength;

@synthesize minimumUnsignedNumberValue;
@synthesize maximumUnsignedNumberValue;

+ (instancetype _Nonnull)worker   {   return [self worker:nil]; }

+ (instancetype _Nonnull)worker:(nullable id<PTCLValidation_Protocol>)nextValidationWorker
{
    return [[self.class alloc] initWithWorker:nextValidationWorker];
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self)
    {
        self.nextValidationWorker = nil;
    }
    
    return self;
}

- (nonnull instancetype)initWithWorker:(nullable id<PTCLValidation_Protocol>)nextValidationWorker_
{
    self = [super initWithWorker:nextValidationWorker_];
    if (self)
    {
        self.nextValidationWorker = nextValidationWorker_;
    }
    
    return self;
}

- (void)enableOption:(nonnull NSString*)option
{
    if (self.nextValidationWorker)
    {
        [self.nextValidationWorker enableOption:option];
    }
    
    [super enableOption:option];
}

- (void)disableOption:(nonnull NSString*)option
{
    if (self.nextValidationWorker)
    {
        [self.nextValidationWorker disableOption:option];
    }
    
    [super disableOption:option];
}

#pragma mark - Business Logic

- (BOOL)doValidateBirthday:(NSDate*)birthday
                     error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateBirthday:birthday
                                                       error:error];
    }
    
    return NO;
}

- (BOOL)doValidateEmail:(NSString*)email
                  error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateEmail:email
                                                    error:error];
    }
    
    return NO;
}

- (BOOL)doValidateHandle:(NSString*)handle
                   error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateHandle:handle
                                                     error:error];
    }
    
    return NO;
}

- (BOOL)doValidateName:(NSString*)name
                 error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateName:name
                                                   error:error];
    }
    
    return NO;
}

- (BOOL)doValidateNumber:(nonnull NSString*)number
                   error:(NSError*_Nullable*_Nullable)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateNumber:number
                                                     error:error];
    }
    
    return NO;
}

- (BOOL)doValidatePassword:(NSString*)password
                     error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidatePassword:password
                                                       error:error];
    }
    
    return NO;
}

- (BOOL)doValidatePercentage:(nonnull NSString*)percentage
                       error:(NSError*_Nullable*_Nullable)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidatePercentage:percentage
                                                         error:error];
    }
    
    return NO;
}

- (BOOL)doValidatePhone:(nonnull NSString*)phone
                  error:(NSError*_Nullable*_Nullable)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidatePhone:phone
                                                    error:error];
    }
    
    return NO;
}

- (BOOL)doValidateSearch:(NSString*)search
                   error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateSearch:search
                                                     error:error];
    }
    
    return NO;
}

- (BOOL)doValidateState:(NSString*)state
                  error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateState:state
                                                    error:error];
    }
    
    return NO;
}

- (BOOL)doValidateUnsignedNumber:(NSString*)number
                           error:(NSError**)error
{
    if (self.nextValidationWorker)
    {
        return [self.nextValidationWorker doValidateUnsignedNumber:number
                                                             error:error];
    }
    
    return NO;
}

@end
