//
//  VGuardExceptionHandler.h
//  VGuard
//
//  Created by Chinwee Koh on 8/12/14.
//  Copyright (c) 2014 V-Key Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * This class interface lets you specify the actions to perform when an exception occurred in V-OS
 * App Protection SDK.
 */
@protocol VGuardExceptionHandlerProtocol <NSObject>

/**
 * Implement the action to perform when an exception occurred, e.g. send stacktrace information, etc.
 * @param   exception   The exception that occurred.
 */
- (void)vGuardExceptionHandler:(NSException *)exception;

@end

@interface VGuardExceptionHandler : NSObject

/// @cond INTERNAL
@property (unsafe_unretained, nonatomic) id<VGuardExceptionHandlerProtocol> delegate;
/// @endcond

/**
 * You must set up this instance before setting the V-OS App Protection instance in `VGuardManager`
 * class. The `VGuardExceptionHandler` class will notify you if any errors occurred during the
 * V-OS App Protection operation. Use the `vGuardExceptionHandler` method in
 * `VGuardExceptionHandlerProtocol` to log the exception raised in V-OS App Protection SDK.
 */
+ (instancetype)sharedManager;

/**
 * Whether to send stacktrace information automatically to V-OS App Protection Server when an
 * exception occurred in V-OS App Protection. Set to `YES` or `NO`. The default is `YES`.
 */
@property (assign, nonatomic) BOOL allowSendStacktraceLog;

@end
