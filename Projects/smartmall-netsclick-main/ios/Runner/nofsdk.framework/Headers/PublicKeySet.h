//
//  PublicKeySet.h
//  nofsdk
//
//  Created by Heru Prasetia on 10/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicKeyComponent.h"

NS_ASSUME_NONNULL_BEGIN


/**
 Used to set Public Key Set for NOF SDK
 */
@interface PublicKeySet : NSObject {
    PublicKeyComponent *mapPublicKeyComponent;
    NSMutableDictionary *hppPublicKeyComponents;
}

@property(nonatomic, retain) PublicKeyComponent *mapPublicKeyComponent;
@property(nonatomic, retain) NSMutableDictionary *hppPublicKeyComponents;

    
/**
 Used to initialize Public Key Set object

 @param mapPublicKeyComponent Public key component of MAP which assigned by NETS
 @param hppPublicKeyComponents Set of public key component of HPP which assigned by NETS
 @return object of Public Key Set
 */
-(id) init :(PublicKeyComponent *)mapPublicKeyComponent withHppPublicComponents:(NSMutableDictionary *)hppPublicKeyComponents;
    
/**
 Used to get MAP Public Key Component that has been set during the initialization

 @return Public key component object of MAP
 */
-(PublicKeyComponent *)getMapPublicKeyComponent;
    
/**
 Used to get all set of HPP Public Key Components

 @return all set of HPP Public Key Components object
 */
-(NSMutableDictionary *)getAllHppPublicKeyComponents;
    
/**
 Used to get the HPP Public Key component based on Issuer ID

 @param issuerId Issuer Id of particular HPP Public Key
 @return HPP Public Key Component object
 */
-(PublicKeyComponent *)getHppPublicKeyComponent: (NSString *)issuerId;
    
/**
 Used to get all issuer of HPP that has been set during initialization

 @return array of HPP Issuer
 */
-(NSArray *) getHppIssuers;
@end

NS_ASSUME_NONNULL_END
