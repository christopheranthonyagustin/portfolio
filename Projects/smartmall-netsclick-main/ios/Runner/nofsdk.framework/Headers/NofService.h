//
//  NofService.h
//  nofsdk
//
//  Created by Heru Prasetia on 9/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestProtocol.h"
#import "ServiceError.h"
#import "HceApiService.h"
#import "PublicKeySet.h"

NS_ASSUME_NONNULL_BEGIN

static bool isInitiated = false;

/**
 Merchant application should be initialized NofService by calling
 NofService.main.initializeWithServerBaseUrl:withApiGwBaseUrl:withAppId:withAppSecret:withPublicKeySet:withServerCertName:success:failure: during start up, for example
 within application(_:didFinishLaunchWithOptions:)method in AppDelegate
 class. <BR>
 ServiceNotInitializedException exception will be thrown if NofService has
 not been initialized.
 <BR><BR>
 Sample code on Swift :
 <pre>
 <code>
 let HOST_URL                = "https://uatnetspay.nets.com.sg"
 let API_GW_URL              = "https://uat-api.nets.com.sg/uat"
 
 let HPP_ISSUER_ID           = "0001"
 let HPP_ISSUER_ID_UOB       = "0002"
 let HPP_ISSUER_ID_OCBC      = "0003"
 let HPP_ISSUER_ID_SIM       = "9999"
 
 let APPLICATION_ID          = "00011000002"
 let APP_SECRET              = "6944DAE581D8EDA2C1B29C1888F4F398D9E4A63D3208FD5BF5291F6FA47E6136"
 
 let MAP_PUBLIC_KEY_ID       = "2"
 let MAP_PUBLIC_KEY_EXPONENT = "03"
 let MAP_PUBLIC_KEY_MODULUS  = "cfbb65135256d4e525fc6aada10ff7a78e0f239d6f4ac7ed0ef2b883e1b4cba8ec1c49208142952cdc530380024d6ca7bae28f7d82a36e8b95baad64df079b368d17dce484e00e88ba008e41576da8e9aaa102d4287f07f0edd89a76df8eeb02e08498c01b6a9fd5014e3b73fd49b0c76ba32180894fe1da728c858bad96db9191e7c8244bf0649f09577ebe4bd1d0a1640dc2b8ad6f64b2a2f8715777b669703f3fcb8023dbe024fcb21ca0697044400dcdc288b335ccb254e8d98bb93eb4c71b84141467e35cb284d13c62099ba90367d490581dabdf33744898a54a81bf05451288ec4c1065df003efa51aab502acadba022ee6d48b91901140e00d5eb20b"
 
 let HPP_PUBLIC_KEY_ID        = "2"
 let HPP_PUBLIC_KEY_EXPONENT  = "03"
 let HPP_PUBLIC_KEY_MODULUS   = "D031A01F005662CCE917C57C8FCC18BB934026DC0D02A0E865896077BBCB2760B05AB979A9253523B11573196465973566760B4F7AE0552349F826AB62A2D2E10B783A99D6668A643090E259ACB30BCD9B9C5A2BFED83A8011DFD79CE0C285E09CF183E31662908B1F5AA8043562DB4056B35876712787B373AED178F55EE860B252CEBD29721B97B84B17429EBE2EB6889F8487FD98EB5DA5477971AF85791B18C8F73CAF1706CC41C22F45F855FE197FCEE10ADB441DD84E92D61C51F23DBEDEFBF153ADA2BFD675FB5BF4ABC6B9E70DED677C8C9A85E189D73B3A287CE4B6B1310B284527A742BE39B47F7FC56022E0419B81113FF739324FCC348AECCED7"
 
 let mapPubKey = PublicKeyComponent(MAP_PUBLIC_KEY_ID,
    withKeyModulus: MAP_PUBLIC_KEY_MODULUS,
    withKeyExponent: MAP_PUBLIC_KEY_EXPONENT)
 let hppPubKey = PublicKeyComponent(HPP_PUBLIC_KEY_ID,
    withKeyModulus: HPP_PUBLIC_KEY_MODULUS,
    withKeyExponent: HPP_PUBLIC_KEY_EXPONENT)
 
 let dic: NSMutableDictionary = [HPP_ISSUER_ID: hppPubKey, HPP_ISSUER_ID_SIM: hppPubKey, HPP_ISSUER_ID_UOB: hppPubKey, HPP_ISSUER_ID_OCBC: hppPubKey]
 
 let pks = PublicKeySet(mapPubKey, withHppPublicComponents: dic)
 let serverName = "netspayserver"
 DispatchQueue.global().async() {
    do {
        try ExceptionCatcher.catchException {
            // NofService.main().setSdkDebuggable(true)
            NofService.main().initialize(withServerBaseUrl: self.HOST_URL, withApiGwBaseUrl: self.API_GW_URL, withAppId: self.APPLICATION_ID, withAppSecret: self.APP_SECRET, with: pks, withServerCertName: serverName, success: { (result) in
                    DispatchQueue.main.async() {
                        print("result success = \(result)")
                    }
            }, failure: { (errorCode) in
                    DispatchQueue.main.async() {
                        print("failed \(errorCode)")
                    }
            })
        }
    } catch {
        print("ERROR = \(error)")
        let err: NSError = error as NSError
        if error.localizedDescription == ServiceError.serviceNotInitializedException().name.rawValue {
            print(error.localizedDescription)
        }
        if error.localizedDescription == ServiceError.missingServerCertException().name.rawValue {
            print(error.localizedDescription)
        }
        if error.localizedDescription == ServiceError.missingDataException("").name.rawValue {
            print(error.localizedDescription)
            if let missingFields: String = err.userInfo["NSLocalizedDescriptionKey"] as? String {
            DispatchQueue.main.async() {
                // show alert missing data
            }
        }
        if error.localizedDescription == ServiceError.serviceNotInitializedException("").name.rawValue {
            print(error.localizedDescription)
            if let missingFields: String = err.userInfo["NSLocalizedDescriptionKey"] as? String {
                DispatchQueue.main.async() {
                    // show alert service initialization failed
                }
            }
        }
    }
 }
 </code>
 </pre>
 */
@interface NofService : NSObject {
    NSString *deviceId;
    HceApiService *hceApiService;
    NSMutableArray *certName;
}

@property(nonatomic, retain) NSString *deviceId;
@property(nonatomic, retain) HceApiService *hceApiService;
@property(nonatomic, retain) NSMutableArray *certName;

/**
 Used to initialize NofService.
 @return singleton object of NofService
 */
+(NofService *)main;


/**
 Used to turn on sdk debug. Default value is off

 @param sdkDebug set to true to turn on debug
 */
-(void)setSdkDebuggable :(BOOL)sdkDebug;

/**
 Used to clear VosStorage when error -8 happen normally after user do backup and restore
 After run this command, please exit the app and relaunch the app
 @return status of the clear storage
 */
-(BOOL)clearVOS;

/**
 Used to initialize parameter which required by NOF SDK.
 @param serverBaseUrl NETS Server base url
 @param apiGwBaseUrl NETS API gateway base url
 @param appId Application ID assigned by NETS
 @param appSecret Application Secret assigned by NETS
 @param pks Public Key Set assigned by NETS
 @param serverCertName Server Certificate File name assigned by NETS. ServerCertName should not include the extension (*.der).
 @param successCallback Success callback function when SDK initialized successfully
 @param errorCallback Error callback function when SDK initialized failed
 
 @warning you need to run this method on the very beginning everytime when your app launch
 */
-(void)initializeWithServerBaseUrl: (NSString *)serverBaseUrl withApiGwBaseUrl: (NSString *)apiGwBaseUrl withAppId:(NSString *)appId withAppSecret:(NSString *)appSecret withPublicKeySet:(PublicKeySet *)pks withServerCertName:(NSString *)serverCertName success:(void (^ _Nullable)(NSString * _Nonnull))successCallback failure:(void (^ _Nullable)(NSString * _Nonnull))errorCallback;


/**
 Used to initialize parameter which required by NOF SDK.
 @param serverBaseUrl NETS Server base url
 @param apiGwBaseUrl NETS API gateway base url
 @param appId Application ID assigned by NETS
 @param appSecret Application Secret assigned by NETS
 @param pks Public Key Set assigned by NETS
 @param serverCertName array of Server Certificate File name assigned by NETS. ServerCertName should not include the extension (*.der).
 @param successCallback Success callback function when SDK initialized successfully
 @param errorCallback Error callback function when SDK initialized failed
 
 @warning you need to run this method on the very beginning everytime when your app launch
 */
-(void)initializeWithServerBaseUrl: (NSString *)serverBaseUrl withApiGwBaseUrl: (NSString *)apiGwBaseUrl withAppId:(NSString *)appId withAppSecret:(NSString *)appSecret withPublicKeySet:(PublicKeySet *)pks withServerCertNames:(NSMutableArray *)serverCertName success:(void (^ _Nullable)(NSString * _Nonnull))successCallback failure:(void (^ _Nullable)(NSString * _Nonnull))errorCallback;

/**
 Used to clear all SDK data. After call this, merchant need to quit and relaunch the app
 */
-(void)clearAllData;

/**
 Used to disable SDK to clear web cookies and data during registration
 */
-(void)disableSdkClearWebCache;

@end

NS_ASSUME_NONNULL_END
