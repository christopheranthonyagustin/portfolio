//
//  Registration.h
//  nofsdk
//
//  Created by Heru Prasetia on 9/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RequestProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Registration is used to register a new NOF card. During instantiation of
 Registration, merchant application need to pass these two parameters : merchant user id
 and merchant id. Then after instantiation done, merchant application calls the invoke()
 method upon instantiation of Registration object.
 <BR><BR>
 Registration API can be used in the scenario that the MUID (User ID of the Merchant)
 is changed in the same installation of merchant application. Another scenario that this class
 should be used is when the merchant app uses mobile number as the MUID and the users
 change the mobile number which indirectly changes the MUID, merchant app should use this
 class to prevent the user of new phone number to continue to use the NOF card registered by
 the user of previous phone number. When invoke()method is called with
 Registration object initialized with different muid, the existing NOF card will be
 deregistered automatically to protect the user of previous mobile number.
 To use this class, merchant application calls invoke()method upon instantiation of
 Registration object with mid (merchant app is not allowed to change their mid) and
 muid of merchant app.
 <BR><BR>
 As the result of successful registration, SDK will return String which contains Secondary
 Bitmap Data Element S-126 Request Table 1 and 2 of Merchant Host Interface Specification
 [1]. These 2 tables are concatenated in TLV format with ‘Tag’ as 2 bytes of Table ID length
 and ‘Length’ of TLV in 3 bytes.
 <BR><BR>
 Sample code on Swift :
 <pre>
 <code>
 let reg = Registration(viewController: self, withMuid: muidStr, andWithMid: midStr, withNavigationBarColor: UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), withTitleBarColor: UIColor.white)
 
 DispatchQueue.global().async() {
    do {
        try ExceptionCatcher.catchException {
            reg.invoke({ (result) in
                DispatchQueue.main.async() {
                    // do UI implementation here
                    // send get merchant token to host here
                }
            }, failure: { (error) in
                DispatchQueue.main.async() {
                    // show ui error message here
                    print("failed responseCode = " + error)
                }
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
                    self.showErrorMessage(errorCode: "Error", errorMessage: "Missing Data : \(missingFields)")
                }
            }
        }
    }
 }
 </code>
 </pre>
 */
@interface Registration : NSObject <RequestProtocol> {
    UIViewController *viewController;
    NSString *mid;
    NSString *aid; // App ID / bundle ID
    NSString *muid;
    NSString *uuid; // merchant app device id?
    NSString *deviceInfo; // should be generated with this format : <Manufacturer><Space><Model>
    
    UIColor *navBarColor;
    UIColor *titleBarColor;
    UIImage *btnImage;
    NSMutableArray *certName;
    int originalSize;
}

/**
 Register a new NETS-On-File card.

 @param viewController UIViewController object from merchant UI
 @param muid Merchant User Id. For example : mobile number, email, or username.
 @param mid Merchant Id which assigned by NETS
 @return Registration object of NOF SDK
 */
-(id)initWithViewController: (UIViewController *)viewController withMuid :(NSString *)muid andWithMid :(NSString *)mid;

/**
 Register a new NETS-On-File card with custom navigation color.

 @param viewController UIViewController object from merchant UI
 @param muid Merchant User Id. For example : mobile number, email, or username.
 @param mid Merchant Id which assigned by NETS
 @param colorNav Used to set navigation bar color of UI SDK
 @param titleBarColor Used to set "Close" button text color on navigation bar of UI SDK
 @return Registration object of NOF SDK
 */
-(id)initWithViewController: (UIViewController *)viewController
                  withMuid :(NSString *)muid
                andWithMid :(NSString *)mid
     withNavigationBarColor:(UIColor *)colorNav
          withTitleBarColor: (UIColor *)titleBarColor;

/**
 Register a new NETS-On-File card with custom navigation close button
 @param viewController UIViewController object from merchant UI
 @param muid Merchant User Id. For example : mobile number, email, or username.
 @param mid Merchant Id which assigned by NETS
 @param colorNav Used to set navigation bar color of UI SDK
 @param btnImage Used to set image for "Close" button on navigation bar of UI SDK
 @return Registration object of NOF SDK
 */
-(id)initWithViewController: (UIViewController *)viewController
                  withMuid :(NSString *)muid
                andWithMid :(NSString *)mid
     withNavigationBarColor:(UIColor *)colorNav
            withButtonImage:(UIImage *)btnImage;

@property (nonatomic, retain) UIViewController *viewController;
@property (nonatomic, retain) NSString *mid;
@property (nonatomic, retain) NSString *aid;
@property (nonatomic, retain) NSString *muid;
@property (nonatomic, retain) NSString *uuid;
@property (nonatomic, retain) NSString *deviceInfo;
@property (nonatomic, retain) NSMutableArray *certName;
@property (nonatomic, retain) UIColor *navBarColor;
@property (nonatomic, retain) UIColor *titleBarColor;
@property (nonatomic, retain) UIImage *btnImage;

@end

NS_ASSUME_NONNULL_END
