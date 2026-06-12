//
//  Deregistration.h
//  nofsdk
//
//  Created by Heru Prasetia on 8/5/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestProtocol.h"

NS_ASSUME_NONNULL_BEGIN


/**
 Deregistration is used to deregister existing NOF card. Merchant application calls the
 invoke() method upon instantiation of Deregistration object.
 <BR><BR>
 Sample code on Swift :
 <pre>
 <code>
 let dereg = Deregistration()
 DispatchQueue.global().async() {
    do {
        // show loading bar here
        try ExceptionCatcher.catchException {
            dereg.invoke({ (result) in
                print("result success = \(result)")
                DispatchQueue.main.async() {
                    // do UI operation here
                }
            }, failure: { (error) in
                print("failed responseCode = " + error)
                DispatchQueue.main.async() {
                    // do UI operation here
                }
            })
        }
    } catch {
 
        let err: NSError = error as NSError
        if error.localizedDescription == ServiceError.serviceNotInitializedException().reason {
            print(error.localizedDescription)
        }
        if error.localizedDescription == ServiceError.missingServerCertException().name.rawValue {
            print(error.localizedDescription)
        }
        if error.localizedDescription == ServiceError.missingDataException("").name.rawValue {
            print(error.localizedDescription)
            if let missingFields: String = err.userInfo["NSLocalizedDescriptionKey"] as? String {
                DispatchQueue.main.async() {
                    self.showErrorMessage(errorCode: "Error", errorMessage: "Missing Data : \(missingFields)")
                }
            }
        }
    }
 }
 
 </code>
 </pre>
 */

@interface Deregistration : NSObject <RequestProtocol> {
    NSMutableArray *certName;
}

@property (nonatomic, retain) NSMutableArray *certName;

/**
 Deregister the existing NETS-On-File card.

 @return object of deregistration NOF SDK
 */
-(id)init;

@end

NS_ASSUME_NONNULL_END
