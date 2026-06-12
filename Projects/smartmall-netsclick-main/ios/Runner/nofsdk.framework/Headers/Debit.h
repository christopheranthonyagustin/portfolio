//
//  Debit.h
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
 If the merchant requires its customer to pay immediately, for instance, by clicking “Pay
 Now” or “Place Order” buttons of some of the merchant apps, it can instantiate
 Debit(amountToDebit) to debit the customer CASA account. Merchant application
 needs to call invoke() method upon instantiation of Debit object with specified
 transaction amount to debit. Upon successful callback, the SDK will return Secondary
 Bitmap Data Element S-126 Request Table 2 and 5 of Merchant Host Interface Specification
 [1] as response to merchant application.
 
 <BR><BR>
 Sample code on Swift :
 <pre>
 <code>
 let debit = Debit(amount: amount)
 DispatchQueue.global().async() {
    do {
        try ExceptionCatcher.catchException {
            debit.invoke({ (result) in
                print("result success table 02 and 05= \(result)")
                // do Debit to merchant host here
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
 <BR><BR>
 
 If PIN is required or PIN is invalid for Debit request, NETS host will return Response Code
 ‘U9’ (PIN required) or ‘55’ (PIN invalid) alongside with the transaction cryptogram to
 Merchant host. Merchant app should then instantiate Debit(txnAmount, responseCode,
 txnCryptogram, viewController) after receiving transaction cryptogram from Merchant
 Host in order to invoke PIN pad and resend the Debit request.
 Upon successful callback, the SDK will return Secondary Bitmap Data Element S-126
 Request Table 2 and 5 of Merchant Host Interface Specification [1] as response to merchant
 application.<BR><BR>
 
 Sample code on Swift :
 <pre>
 <code>
 let debit = Debit(amount: b, withResponseCode: respCode, withTransactionCryptogram: t53, with: self)
 
 DispatchQueue.global().async() {
    do {
        try ExceptionCatcher.catchException {
            debit.invoke({ (result) in
                    print("result success table 02 and 05= \(result)")
                    // do Debit to merchant host here
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
@interface Debit : NSObject <RequestProtocol> {
    
    NSString *mid;
    NSString *amountToDebit;
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

@property (nonatomic, retain) NSString *mid;
@property (nonatomic, retain) NSString *amountToDebit;
@property (nonatomic, retain) NSString *netsHostTimeStamp;
@property (nonatomic, retain) NSString *unpredictedNum;
@property (nonatomic, retain) NSString *responseCode;
@property (nonatomic, retain) NSString *txnCryptogram;
@property (nonatomic, retain) UIViewController *viewController;


/**
 Debit the customer without invoking PIN pad.

 @param transAmt Amount to debit
 @return object of Debit from NOF SDK
 */
-(id)initWithAmount: (NSString *)transAmt;

/**
 Debit the customer without invoking PIN pad with specific Merchant Id (MID)
 
 @param mid Merchant Id (MID)
 @param transAmt Amount to debit
 @return object of Debit from NOF SDK
 */
//-(id)initWithMid: (NSString *)mid withAmount: (NSString *)transAmt;

/**
 Debit the customer by invoking the PIN pad. Merchant App should
 invoke this method when Response Code ‘U9’ or ‘55’ (Online PIN required) is received by Merchant Host from Primary Bitmap Data Element P-39.

 @param transAmt Amount to debit
 @param respCode Response code returned by merchant host
 @param txnCryptogram Secondary Bitmap Data Element S-126 Response Table 53 of Merchant Host Interface Specification [1]. Table 53 is in TLV format with ‘Tag’ as 2 bytes of Table ID length and ‘Length’ of TLV in 3 bytes. This transaction cryptogram should be returned by merchant host
 @param viewController UIViewController object from merchant UI
 @return object of Debit from NOF SDK
 */
-(id)initWithAmount :(NSString *)transAmt withResponseCode:(NSString *)respCode withTransactionCryptogram:(NSString *)txnCryptogram withViewController :(UIViewController *)viewController;

/**
 Debit the customer by invoking the PIN pad with specific Merchant Id (MID). Merchant App should
 invoke this method when Response Code ‘U9’ or ‘55’ (Online PIN required) is received by Merchant Host from Primary Bitmap Data Element P-39.
 
 @param mid Merchant Id (MID)
 @param transAmt Amount to debit
 @param respCode Response code returned by merchant host
 @param txnCryptogram Secondary Bitmap Data Element S-126 Response Table 53 of Merchant Host Interface Specification [1]. Table 53 is in TLV format with ‘Tag’ as 2 bytes of Table ID length and ‘Length’ of TLV in 3 bytes. This transaction cryptogram should be returned by merchant host
 @param viewController UIViewController object from merchant UI
 @return object of Debit from NOF SDK
 */
//-(id)initWithMid: (NSString *)mid withAmount :(NSString *)transAmt withResponseCode:(NSString *)respCode withTransactionCryptogram:(NSString *)txnCryptogram withViewController :(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
