//
//  PublicKeyComponent.h
//  nofsdk
//
//  Created by Heru Prasetia on 10/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 Object to set public key for NOF SDK
 */
@interface PublicKeyComponent : NSObject {
    NSString *keyId;
    NSString *keyModulus;
    NSString *keyExponent;
}

@property(nonatomic, retain) NSString *keyId;
@property(nonatomic, retain) NSString *keyModulus;
@property(nonatomic, retain) NSString *keyExponent;


/**
 Initialize the public key component object

 @param keyId Key ID assigned by NETS
 @param keyModulus Key Modulus assigned by NETS
 @param keyExponent Key Exponent assigned by NETS
 @return object of Public Key Component of NOF SDK
 */
-(id)init :(NSString *)keyId withKeyModulus:(NSString *)keyModulus withKeyExponent:(NSString *)keyExponent;
@end

NS_ASSUME_NONNULL_END
