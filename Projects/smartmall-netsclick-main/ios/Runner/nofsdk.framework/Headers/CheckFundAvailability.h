//
//  CheckFundAvailability.h
//  nofsdk
//
//  Created by Heru Prasetia on 10/5/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RequestProtocol.h"

NS_ASSUME_NONNULL_BEGIN


/**
 Check Fund Availability allows the merchant to check whether their customers have
 sufficient balance in their bank CASA account. This is useful for ride-hailing case when the
 merchant app only initiates the booking process and the actual debit is done later by the
 merchant host at the end of the trip. Take note that the maximum amount that the merchant
 host can debit is equivalent to the specified amount of Check Fund Availability.
 When invoke()method is called, the SDK will return Secondary Bitmap Data Element S-
 126 Request Table 2 and 5 of Merchant Host Interface Specification [1]. Merchant app will
 forward these 2 tables to merchant host. Merchant Host will then send the Check Fund
 Availability request message to NETS host.<BR><BR>
 Merchant application calls invoke()method upon instantiation of
 CheckFundAvailability object with specified estimated transaction amount to
 check.<BR><BR>
 <B><U>Estimated Transaction Amount :</U></B><BR>
 For ride hailing case, merchant application needs to put estimated amount that may charge to the
 merchant app user. It needs to follow these formats : <BR><UL>
    <LI>Last 2 characters are cents.</LI>
    <LI>‘0’s are padded to the left of amount string to make the length of 12 characters</LI>
 </UL><BR>
 To illustrate, below are the examples of transaction amount:<UL>
    <LI>1 cent : 000000000001</LI>
    <LI>10 cents : 000000000010</LI>
    <LI>1 dollar : 000000000100</LI>
 </UL>
 <BR><BR>
 Sample code on Swift :
 <pre>
 <code>
 let cfa = CheckFundAvailability(estimatedTxnAmount: b)
 
 DispatchQueue.global().async() {
    do {
        try ExceptionCatcher.catchException {
            cfa.invoke({ (result) in
                print("result success table 02 and 05= \(result)")
                // do Check Fund Availability to merchant host here
            }, failure: { (error) in
                DispatchQueue.main.async{
                    // do UI operation here
                }
                print("failed responseCode = " + error)
            })
        }
    } catch {
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
                // show error missing fields
            }
        }
    }
 }
 </code>
 </pre>
 <BR><BR>
 If PIN is required or PIN is invalid for Check Fund Availability (CFA), NETS host will
 return Response Code ‘U9’ (PIN required) or ‘55’ (PIN invalid) alongside with the
 transaction cryptogram to Merchant host. Merchant app should then instantiate
 CheckFundAvailability(estimatedTxnAmount, responseCode, txnCryptogram,
 viewController) after receiving transaction cryptogram from Merchant Host in order to
 invoke PIN pad and resend the CFA request.
 Upon successful callback, the SDK will return Secondary Bitmap Data Element S-126
 Request Table 2 and 5 of Merchant Host Interface Specification [1] as response to merchant
 application.
 <BR><BR>
 Sample code on Swift :
 <pre>
 <code>
 let cfa = CheckFundAvailability(estimatedTxnAmount: b, withResponseCode: respCode, withTransactionCryptogram: t53, with: self)
 
 DispatchQueue.global().async() {
    do {
        try ExceptionCatcher.catchException {
            cfa.invoke({ (result) in
                print("result success table 02 and 05= \(result)")
                // do Check Fund Availability to merchant host here
            }, failure: { (error) in
                DispatchQueue.main.async{
                    // do UI operation here
                }
                print("failed responseCode = " + error)
            })
        }
    } catch {
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
                    // show error missing fields
                }
            }
        }
    }
 }
 </code>
 </pre>
 */
@interface CheckFundAvailability : NSObject <RequestProtocol> {
    NSString *mid;
    NSString *estimatedTxnAmount;
    
    NSString *netsHostTimeStamp;
    NSString *unpredictedNum;
    /*
     FOR TXN WITH PIN
     */
    NSString *responseCode;
    NSString *txnCryptogram;
    UIViewController *viewController;
    int originalSize;
}

@property(nonatomic, retain) NSString *mid;
@property(nonatomic, retain) NSString *estimatedTxnAmount;
@property (nonatomic, retain) NSString *netsHostTimeStamp;
@property (nonatomic, retain) NSString *unpredictedNum;
@property (nonatomic, retain) NSString *responseCode;
@property (nonatomic, retain) NSString *txnCryptogram;
@property (nonatomic, retain) UIViewController *viewController;


/**
 Check Fund Availability to check whether the user has specified
 amount of balance in their CASA account. This method should be used when response code is not ‘U9’ or ‘55’ (Online PIN not required).

 @param estimatedTxn Amount to check for CFA
 @return CheckFundAvailability object from NOF SDK
 */
-(id)initWithEstimatedTxnAmount :(NSString *)estimatedTxn;

/**
 Check Fund Availability to check whether the user has specified
 amount of balance in their CASA account for specific Merchant Id (MID).
 This method should be used when response code is not ‘U9’ or ‘55’ (Online PIN not required).
 
 @param mid Merchant Id (MID)
 @param estimatedTxn Amount to check for CFA
 @return CheckFundAvailability object from NOF SDK
 */
//-(id)initWithMid: (NSString *)mid withEstimatedTxnAmount :(NSString *)estimatedTxn;

/**
 Check Fund Availability to check whether the user has specified
 amount of balance in their CASA account. Merchant App should invoke this method when Response Code ‘U9’ or ‘55’ (Online PIN required) is received by Merchant Host from Primary Bitmap Data Element P-39.

 @param estimatedTxn Amount to check for CFA
 @param respCode Response code returned from merchant host
 @param txnCryptogram Secondary Bitmap Data Element S-126 Response Table 53 of Merchant Host Interface Specification [1]. Table 53 is in TLV format with ‘Tag’ as 2 bytes of Table ID length and ‘Length’ of TLV in 3 bytes. This txnCryptogram should be returned by merchant host.
 @param viewController UIViewController object from merchant UI
 @return CheckFundAvailability object from NOF SDK
 */
-(id)initWithEstimatedTxnAmount :(NSString *)estimatedTxn withResponseCode:(NSString *)respCode withTransactionCryptogram:(NSString *)txnCryptogram withViewController :(UIViewController *)viewController;

/**
 Check Fund Availability to check whether the user has specified
 amount of balance in their CASA account for specific Merchant Id (MID).
 Merchant App should invoke this method when Response Code ‘U9’ or ‘55’ (Online PIN required) is received by Merchant Host from Primary Bitmap Data Element P-39.
 
 @param mid Merchant Id (MID)
 @param estimatedTxn Amount to check for CFA
 @param respCode Response code returned from merchant host
 @param txnCryptogram Secondary Bitmap Data Element S-126 Response Table 53 of Merchant Host Interface Specification [1]. Table 53 is in TLV format with ‘Tag’ as 2 bytes of Table ID length and ‘Length’ of TLV in 3 bytes. This txnCryptogram should be returned by merchant host.
 @param viewController UIViewController object from merchant UI
 @return CheckFundAvailability object from NOF SDK
 */
//-(id)initWithMid: (NSString *)mid withEstimatedTxnAmount :(NSString *)estimatedTxn withResponseCode:(NSString *)respCode withTransactionCryptogram:(NSString *)txnCryptogram withViewController :(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
