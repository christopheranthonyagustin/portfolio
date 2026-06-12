//
//  ServiceError.h
//  nofsdk
//
//  Created by Heru Prasetia on 9/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 */
@interface ServiceError : NSObject


/**
 Service not initialized

 @return NSException object with user info
 */
+ (NSException *)ServiceNotInitializedException;

/**
 Missing NETS-On-File server certificate

 @return NSException object with user info
 */
+ (NSException *)MissingServerCertException;

/**
 Service not initialized exception with extra message

 @param message description on which service not initialized
 @return NSException object with user info
 */
+ (NSException *)ServiceNotInitializedException: (NSString *)message;

/**
 Missing required data
 
 @param message description of the required data
 @return NSException object with user info
 */
+ (NSException *)MissingDataException: (NSString *)message;

/**
 [Internal SDK Exception] - Invalid transaction cryptogram verification

 @return NSException object with user info
 */
+ (NSException *)InvalidTxnCryptogramException;

//+ (NSException *)ServiceAlreadyInitializedException;

/**
 [Internal SDK Exception] - Key could not be recovered

 @return NSException object with user info
 */
+ (NSException *)KeyUnableToRecoverException;

/**
 [Internal SDK Exception] - No response received from server

 @return NSException object with user info
 */
+ (NSException *)RequestErrorException;
/**
 [Internal SDK Exception] - Connection to server timeout
 
 @return NSException object with user info
 */
+ (NSException *)HostTimeoutException;

/**
 [Internal SDK Exception] - Invalid Data during encryption decryption

 @param message data invalid
 @return NSException object with user info
 */
+ (NSException *)InvalidDataException: (NSString *)message;

/**
 [Internal SDK Exception] - Invalid Response from server with error code

 @param message error code of invalid response
 @return NSException object with user info
 */
+ (NSException *)HostResponseErrorException: (NSString *)message;

/**
 [Internal SDK Exception] - Diffie–Hellman has been done before

 @return NSException object with user info
 */
+ (NSException *)RedoDHException;

/**
 [Internal SDK Exception] - Force update response code returned by server

 @return NSException object with user info
 */
+ (NSException *)ForceUpdateException;

/**
 [Internal SDK Exception] - Server Cert is Invalid
 
 */
+ (NSException *)ServerCertInvalidException;

/**
 [Internal SDK Exception] - App login has been done before

 @return NSException object with user info
 */
+ (NSException *)RedoAppLoginException;

/**
 [Internal SDK Exception] - Session has been expired

 @return NSException object with user info
 */
+ (NSException *)SessionExpiredException;
/**
 [Internal SDK Exception] - SDK internal error code
 
 @param errorCode SDK error code
 @return NSException object with user info
 */
+ (NSException *)SDKError: (NSString *)errorCode;

/**
 [Internal SDK Exception] - No active card

 @return NSException object with user info
 */
+ (NSException *)NoActiveCardException;

/**
 [Internal SDK Exception] - No token found for this card

 @return NSException object with user info
 */
+ (NSException *)NoCardTokenException;

/**
 [Internal SDK Exception] - Wrong data format

 @return NSException object with user info
 */
+ (NSException *)DataFormattingException;

/**
 User press cancel during registration

 @return NSException object with user info
 */
+ (NSException *)UserCancelException;
@end

NS_ASSUME_NONNULL_END
