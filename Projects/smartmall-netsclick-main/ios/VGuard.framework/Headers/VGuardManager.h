//
//  VGuardManager.h
//  VGuard
//
//  Copyright (c) 2012 V-Key Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    VGUARD_UNSAFE=0,
    VGUARD_SAFE,
    VGUARD_UNDETERMINE
}   VGUARD_STATUS;

typedef enum {
    VOS_NOTOK=0,
    VOS_OK
}   VOS_STATUS;

typedef NS_ENUM(NSInteger, VOSMemoryConfiguration) {
    VOSMemoryConfigurationDefault = 0,
    VOSMemoryConfigurationHigh = 1
};


@protocol VGuardManagerProtocol <NSObject>
@required

/**
 * This method tells the delegate whether V-OS is started successfully or failed with error.
 * @param   status  The status of V-OS, i.e. `VOS_NOTOK` and `VOS_OK`.
 * @param   error   The `NSError` if there is an error during the status check. Otherwise, `error`
 *                  is `nil`.
 */
-(void)statusVOS:(VOS_STATUS)status withError:(NSError *)error;


/**
 * This method tells the delegate whether V-OS App Protection is started successfully or failed
 * with an error.
 * @param   status  The status of V-OS App Protection, i.e. `VGUARD_UNSAFE`, `VGUARD_SAFE`, and
 *                  `VGUARD_UNDETERMINE`.
 * @param   error   The `NSError` if there is an error during the status check. Otherwise, `error`
 *                  is `nil`.
 */
-(void)statusVGuard:(VGUARD_STATUS)status withError:(NSError *)error;


/**
 * This method tells the delegate whether V-OS App Protection initialization is successful or
 * failed with error. Your implementation of this method should make the decision on what to do next
 * after receiving the status of V-OS App Protection initialization.
 * @param   status  `YES` if V-OS App Protection initialization is successful. Otherwise, `status`
 *                  is `NO`.
 * @param   error   The `NSError` if there is an error during the initialization. Otherwise, `error`
 *                  is `nil`.
 */
- (void)vGuardDidFinishInitializing:(BOOL)status withError:(NSError *)error;

/**
 * This method lets the delegate when SSL hooking or pinning is detected. Your implementation of
 * this method should create a business logic on what to do when V-OS App Protection detects the
 * SSL hooking or pinning.
 * @param   error   The `NSError` if there is an error during the initialization. Otherwise, `error`
 *                  is `nil`.
 */
-(void)vGuardDidDetectSSLError:(NSError *)error;

@optional

/**
 * This method tells the delegate when V-OS App Protection has detected a crash in the previous
 * launch. Your implementation of this method should create a business logic on what to do when
 * V-OS App Protection notifies a detection of a crash.
 */
- (void)vGuardDidDetectCrash;

@end

@interface VGuardManager : NSObject

/// @cond INTERNAL
@property (unsafe_unretained, nonatomic) id<VGuardManagerProtocol> delegate;
/// @endcond

/**
 * Whether to enable debug mode, set to `YES` or `NO`. You can set to `YES` for development
 * and `NO` for production. The default is `NO`.
 */
@property (assign, nonatomic) BOOL isDebug;


/**
 * This API gets a `VGuardManager` instance that can be used to call the APIs within the
 * `VTapInterface`.
 * @return  A `VGuardManager` instance.
 */
+ (VGuardManager *)sharedVGuardManager;


/**
 * set memory configuration used for V-OS
 * This is supposed to be called before V-Guard initialization
 *
 * Parameters: configuration will be used
 */
- (void)setMemoryConfiguration:(VOSMemoryConfiguration)memoryConfig;

/**
 * This API initializes V-OS App Protection.
 * @return  This API returns `YES` if V-OS App Protection initialization is successful.
 * Otherwise, it returns `NO`.
 */
- (BOOL)initializeVGuard;

/**
 * set Maximum network retry time
 *
 * Parameters: number of Network retry time
 */
- (void)setMaximumNetworkRetryTime:(int)numberOfRetry;

/**
 * This API sets the URL of the V-OS Threat Intelligence Server. You must set the URL of the V-OS
 * Threat Intelligence Server if you use the threat intelligence feature. If the URL is not set,
 * the threat intelligence functionalities will not work. The SDK will fall back to use the old
 * threat detection and scanning mechanism instead of threat intelligence.
 * @param   serverURL   The base URL of the V-OS Threat Intelligence Server, e.g., `https://localhost/`.
 */
- (void)setThreatIntelligenceServerURL:(NSString *)serverURL;


/**
* Send Device Info to ThreatIntelligence server
*
* Return Value: YES if request sent successfully, NO if any failure
*
*/
- (BOOL)sendDeviceInfo;


/**
 * This API starts the V-OS App Protection threat scanning. Status is returned from the delegate result.
 */
- (void)start;

/**
 * This API gets the customer ID belongs to your organization. This API requires V-OS to be started
 * successfully before execution.
 * @return  This API returns the customer ID string if V-OS is started. Otherwise, `nil` is returned.
 */
- (NSString *)getCustomerID;

/**
 * This API gets the password which is the customer ID encrypted by the customer key. This API
 * requires V-OS to be started successfully before execution.
 * @return  This API returns the password string if V-OS is started. Otherwise, `nil` is returned.
 */
- (NSString *)getPassword;

/**
 * This API triggers V-OS to lock itself.
 * @return  This API returns a non-negative integer if the V-OS lock is executed successfully.
 *          Otherwise, it returns a negative integer.
 */
- (int)lockVOS;

/**
 * Reset V-OS & V-Guard trusted storage
 * @since 4.8.5
 */
- (BOOL)resetVOSTrustedStorage;


/**
 * This API encrypts the `data` using the customer key in V-OS.
 *
 * Use the following method to convert the string to bytes.
 * ```objectivec
 * NSData ([@"StringToEncode" dataUsingEncoding:NSUTF8StringEncoding];
 * ```
 * @param   data    The data (in byte) to be encrypted.
 * @param   error   The `NSError` if there is an error during the encryption. Otherwise, `error`
 *                  is `nil`.
 * @return          The encrypted data if the encryption is successful. Otherwise, `nil` is returned.
 */
- (NSData *)getEncryptData:(NSData *)data error:(NSError **)error;

/**
 * This API decrypts the `data` using the customer key in V-OS.
 *
 * Use the following method to convert the decrypted data in bytes to string.
 * ```objectivec
 * NSString *decryptedString = [NSString stringWithUTF8String:[decryptedData bytes]];
 * if (!decryptedString) {
 *     decryptedString = [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
 * }
 * ```
 * @param   data    The data (in bytes) to be decrypted.
 * @param   error   The `NSError` if there is an error during the decryption. Otherwise, `error`
 *                  is `nil`.
 * @return          The decrypted data in bytes if the decryption is successful. Otherwise, `nil` is
 *                  returned.
 */
- (NSData *)getDecryptData:(NSData *)data error:(NSError **)error;

/**
 * This API encrypts the `string` using the customer key in V-OS.
 * @param  string   The string to be encrypted.
 * @return          The encrypted string if the encryption is successful. Otherwise, `nil` is returned.
 */
- (NSString *)encryptString:(NSString *)string;

/**
 * This API decrypts the `string` using the customer key in V-OS.
 * @param  string   The string to be decrypted.
 * @return          The decrypted string if the decryption is successful. Otherwise, `nil` is returned.
 */
- (NSString *)decryptString:(NSString *)string;

/**
 * This API gets the hash of the Device Fingerprint (DFP) hash of the device.
 * @return  The DFP hash string, e.g. `02edf...b3103`.
 */
- (NSString *)getDFPHashHash;

/// @cond INTERNAL
/**
 * Troubleshooting ID
 *
 * Parameters: none
 *
 * Return Value: Troubleshooting ID
 *
 * Discussion:
 *
 */
- (NSString * _Nonnull)getTroubleshootingId;

/**
 * VGuard Version Information
 *
 * > This API is wrapped by the `sdkVersion()` API due to inconsistency in API naming with Android.
 * @return  This API returns the version number in the format of `X.X.X.X(YYYYYYYY)` which the "X"s
 *          represent the version of SDK. The "Y"s are for V-Key internal use only.
 */
- (NSString *)getVGuardVersionInformation;
/// @endcond

/**
 * This API gets the version information of V-OS App Protection.
 * @return  This API returns the version number in the format of `X.X.X.X(YYYYYYYY)` which the "X"s
 *          represent the version of SDK. The "Y"s are for V-Key internal use only.
 */
- (NSString *)sdkVersion;

/**
 * This method tells the SDK whether or not to allow arbitrary networking. DEFAULT value is NO.
 * @param allow A boolean value to allow/disallow arbitrary networking.
 * @since 4.8.3
 */
- (void)allowsArbitraryNetworking:(BOOL)allow;

@end
