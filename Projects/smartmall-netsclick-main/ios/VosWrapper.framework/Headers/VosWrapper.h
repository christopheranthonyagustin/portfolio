/** @file VosWrapper.h
 *
 * Copyright (C) 2015 V-Key. All rights reserved.
 *
 * This file is part of the V-Key Cryptographic Module.
 *
 * This file declares the API of the Cryptographic Module for iOS devices.
 *
 * Contact us with any questions or comments.
 *
 * http://www.v-key.com
 *
 */

#ifndef __cplusplus
#import <Foundation/Foundation.h>
#endif

#include <stdbool.h>

#include "vosInterfaceConst.h"
#include "vosInterface.h"
#include "VosWrapper_capi.h"

#ifdef __OBJC__
#include "LogLevel.h"

@protocol Runnable
- (void)run;
@end

VOS_EXPORT
@interface VosError : NSError
@end


VOS_EXPORT
@interface VosWrapper : NSObject
// VOS
/** This function configs local threat lock period
*       <p>
*       Notes: The response mode have to use the same response mode in license file.
*       </p>
*       @param local_lock_period    The local lock period when a threat been detected in RESPONSE_MODE_LOCAL.
*/
+ (void)ConfigLocalLockPeriod:(int) local_lock_period;


/** This function starts the V-OS virtual machine. The started VM will be associated with VosWrapper class and its pointer can be obtained by calling [VosWrapper getVM].
*	<p>
*	Note: Calling startVOS() when there is already a running VM will do nothing.
*	</p>
*	@param fileData			A byte array containing the V-OS kernel's machine code.
*	@return	int				Error code (if the starting process fails) or the expiry time of the kernel.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
+ (int)startVOS:(NSData*)fileData;

+ (int)startVOS:(int)vmMemSize
      vaMemSize:(int)vaMemSize
       fileData:(NSData*)fileData;

/** This function starts the V-OS virtual machine. The started VM will be associated with VosWrapper class and its pointer can be obtained by calling [VosWrapper getVM].
*	<p>
*	Note: Calling startVOS() when there is already a running VM will do nothing.
*	</p>
*	@param fileData			A byte array containing the V-OS kernel's machine code.
*	@param customerKey		A byte array of 32 bytes that will store the customer key embedded inside the license file upon return. Can be nil.
*	@param customerID		An integer whose value will be to modified to hold the customer ID value embedded inside the license file upon return. Can be nil.
*	@param customerFeature	An integer whose value will be to modified to hold the customer features value embedded inside the license file upon return. Can be nil.
*	@param signatureKey		A byte array storing the encrypted V-guard's signature key with IV prepended. 
*							Upon return, the data inside this array will store the decrypted signature key, 
*							the size of the array will be modified to be the size of decrypted singature key.
*							Can be nil.
*	@return	int				Error code (if the starting process fails) or the expiry time of the kernel.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
+ (int)startVOS:(NSData*)fileData
    customerKey:(NSMutableData*)customerKey
     customerID:(int*)customerID
customerFeature:(int*)customerFeature
   signatureKey:(NSMutableData*)signatureKey;

+ (int)startVOS:(int)vmMemSize
      vaMemSize:(int)vaMemSize
       fileData:(NSData*)fileData
    customerKey:(NSMutableData*)customerKey
     customerID:(int*)customerID
customerFeature:(int*)customerFeature
   signatureKey:(NSMutableData*)signatureKey;

/** This function starts the V-OS virtual machine. The started VM will be associated with VosWrapper class and its pointer can be obtained by calling [VosWrapper getVM].
*	<p>
*	Note: Calling startVOS() when there is already a running VM will do nothing.
*	</p>
*	@param appcodePath		The path of the file containing V-OS kernel's machine code.
*	@param customerKey		A byte array of 32 bytes that will store the customer key embedded inside the license file upon return. Can be nil.
*	@param customerID		An integer whose value will be to modified to hold the customer ID value embedded inside the license file upon return. Can be nil.
*	@param customerFeature	An integer whose value will be to modified to hold the customer features value embedded inside the license file upon return. Can be nil.
*	@param signatureKey		A byte array storing the encrypted V-guard's signature key with IV prepended.
*							Upon return, the data inside this array will store the decrypted signature key,
*							the size of the array will be modified to be the size of decrypted singature key.
*							Can be nil.
*	@return	int				Error code (if the starting process fails) or the expiry time of the kernel.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
+ (int)startVOSfromPath:(char*)appcodePath
            customerKey:(NSMutableData*)customerKey
             customerID:(int*)customerID
        customerFeature:(int*)customerFeature
           signatureKey:(NSMutableData*)signatureKey;

/** This function stops the started V-OS virtual machine.
*/
+ (int)stopVOS;

/** This function specifies the URL of the time server to be used by trusted time algorithm.
*	@param	url		A string containing the server's URL. Eg, https://intranet.v-key.com:9200/vtap/time
*	@return			Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
+ (int) setTrustedTimeServerUrl:(NSString *)url;

+ (int) getTrustedTime;

// Call this to lock VOS
// @return	Non - negative value if succeed or negative value if fail.
+ (int)lockVOS;

// Call this to get threats detected by VOS
// @return	Threat infomation by categories.
+ (int)GetThreats;

// Call this to self-test VOS
// @return	Non - negative value if succeed or negative value if fail.
+ (int)selfTestVOS;

// Testing (internal uses only)
+ (int)powerupTestStatus;

+ (int)testModuleIntegrity;

+ (int)testLoadSecureStore;

+ (int)testSecureFileIO;


/** get the crypto mode used by V-OS
 *	@return	        PQR: 1 
 *                      Normal: 0
 */
+ (int)getCryptoMode;

// Key Store
/** Load and construct the keystore from the encrypted, binary representation of the
*	keystore.
*	@param keyData			Buffer storing the encrypted keystore.
*	@param pwd				A string containing the password used to protect the encrypted keystore. See <code>saveKeyStore</code>.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)loadKeyStore:(NSData*)keyData withPassword:(NSString*)pwd;

/** Serialize the keystore and encrypt the resulting binary with a password-based mechanism.
*	@param pwd				A string containing a password to be used to protect the encrypted keystore.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					Buffer that will be used to store the encrypted keystore or nil if there is error. See <code>error</code>.
*/
+ (NSData*)saveKeyStore:(NSString*)pwd error:(VosError**)errorPtr;

/** Remove all keys from the keystore.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)clearKeyStore;

/** Count how many keys inside keystore.
*	@return					Number of keys if succeed or negative value if fail.
*/
+ (int)keyStoreCount;

/** Check whether a key with the specified alias exists in the keystore or not.
*	@param keyAlias			The key alias to check.
*	@return					Nonzero value if the key alias exists, zero otherwise.
*/
+ (int)isKeyInKeyStore:(int)keyAlias;

/**
* Add the given encoded key to the keystore.
*	@param key				Buffer containing the encoded key.
*	@param keyAlias			The alias given to the key to be added.
*	@param algo				The algorithm type of the key. Must be one of <code>Algorithm</code> values defined in vosInterfaceConst.h.
*	@param keyType			The type of the key. Must be one of the <code>TypeOfKey</code> values defined in vosInterfaceConst.h.
*	@return Returns the size of keystore after successfully adding the given key entry.
*	An negative error code is returned, if the key cannot be inserted, because
*	KEYSTORE_MAX_SIZE_REACHED (the pre-configured maximal size of the keystore has already been reached),
*	or KEYSTORE_ALIAS_ALREADY_EXISTS (the key alias already exists in the keystore).
*/
+ (int)setKey:(NSData*)key withAlias:(int)keyAlias algo:(Algorithm)algo type:(TypeOfKey)keyType;

/** Generate a symmetric key with the specified alias and store in keystore.
*	@param keySize			The size of the generated key.
*	@param keyAlias			The key alias to be given to the generated key.
*	@param algo				The algorithm type of the key. Must be one of the <code>Algorithm</code> values defined in vosInterfaceConst.h.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)generateSymmetricKeyInStore:(int)keySize alias:(int)keyAlias algo:(Algorithm)algo;

/** Delete a key with the specified alias from the keystore.
*	@param keyAlias			The key alias to delete.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)delKey:(int)keyAlias;

/** Add a RSA private key to keystore.
*	@param n				Buffer containing the modulus of the key.
*	@param e				Buffer containing the public exponent of the key.
*	@param d				Buffer containing the private exponent of the key.
*	@param p				Buffer containing the 1st prime factor of the key.
*	@param q				Buffer containing the 2nd prime factor of the key.
*	@param dp				Buffer containing the 1st exponent parameter of the key which is equal to <code>d mod (p - 1)</code>.
*	@param dq				Buffer containing the 2nd exponent parameter of the key which is equal to <code>d mod (q - 1)</code>.
*	@param u				Buffer containing the coefficient of the key which is equal to <code>q^-1 mod p</code>.
*	@param keyAlias			The key alias to be given to key.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)setRSAPrivKey:(NSData*)n pubExp:(NSData*)e privExp:(NSData*)d prime1:(NSData*)p prime2:(NSData*)q exp1:(NSData*)dp exp2:(NSData*)dq coef:(NSData*)u alias:(int)keyAlias;

/** Add a RSA public key to keystore.
*	@param n				Buffer containing the modulus of the key.
*	@param e				Buffer containing the public exponent of the key.
*	@param keyAlias			The key alias to be given to key.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)setRSAPubKey:(NSData*)n pubExp:(NSData*)e alias:(int)keyAlias;

/** Get (n, e, d) components of a RSA private key in keystore.
*	@param keyAlias			The key alias of the key.
*	@param n				Upon return, a buffer containing the modulus value of the key will be created and pointed to by <code>*n</code>.
*	@param e				Upon return, a buffer containing the public exponent value of the key will be created and pointed to by <code>*e</code>.
*	@param d				Upon return, a buffer containing the private exponent value of the key will be created and pointed to by <code>*d</code>.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)rsaPrivKeyWithAlias:(int)keyAlias n:(NSData *__autoreleasing *)n
                         e:(NSData *__autoreleasing *)e
                         d:(NSData *__autoreleasing *)d;

/** Get (p, q) components of a RSA private key in keystore.
*	@param keyAlias			The key alias of the key.
*	@param p				Upon return, a buffer containing the 1st prime factor of the key will be created and pointed to by <code>*p</code>.
*	@param q				Upon return, a buffer containing the 2nd prime factor of the key will be created and pointed to by <code>*q</code>.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)rsaPrimeNumWithAlias:(int)keyAlias p:(NSData *__autoreleasing *)p
                          q:(NSData *__autoreleasing *)q;

// Cert Store (unsupported for now)
+ (int)certStoreSize;

+ (int)loadCertStore:(NSData*)certData withPassword:(NSData*)password;

+ (NSData*)saveCertStoreWithPassword:(NSData*)password error:(VosError**)errorPtr;

+ (int)getSerializedCetStoreSize;

+ (int)clearCertStore;

+ (int)setCertEntryWithAlias:(int)keyAlias cert:(NSData*)encodedCert
                        isCA:(BOOL)isCA size:(int)certSize;

+ (int)deleteCertEntry:(int)keyAlias;

+ (NSData*)certWithAlias:(int)keyAlias error:(VosError**)errorPtr;

+ (int)isCertEntry:(int)keyAlias;

+ (NSArray*)getCertAliases;

// VTAP (internal uses only)
+ (int)loadSecureStore:(NSData*)secureData;

+ (NSData*)saveSecureStore;

+ (int)checkPin:(int)pin;

+ (int)setPin:(int)pin;

+ (int)oathTotpGet;

+ (int)oathTotp:(int)timeStep;

+ (int)oathOcra:(NSData*)message;


VOS_API int VAGetDefaultFilePath(void* vmhandle, int vaTag, char** path);



//VA
/** This function sets absolute default path of VA instance with specified ID.
*	Suggested to append your own sub DIR under getVADefaultPath: error.
*	@param	vaTAG		An unique id that is used to reference the VA instance.
*	@param	path		A string containing the absolut default path to set VA referenced by <code>vaTag</code>'s default path.
*   @param  errorPtr	Pointer address that is used to catch error (if any).
*	@return				nothing
*/
+ (void)setVADefaultPath: (NSInteger)vaTag defaultPath:(NSString *)path error:(VosError **) errorPtr;

//NOTES: setDefaultPath will not create dir for you. please create dir before calling setDefaultPath

/** Gets absolute default path of VA instance with specified ID.
*	@param	vaTag		An unique id that is used to reference the VA instance.
*   @param  errorPtr	Pointer address that is used to catch error (if any).
*	@return				nil if the VA referenced by <code>vaTag</code> doesn't exist, the string containing the absolute default path for VA referenced by <code> vaTag </code> otherwise.
*/
+ (NSString *)getVADefaultPath: (NSInteger)vaTag error:(VosError **) errorPtr;

#pragma mark - AES
/** Initialises the given key and IV into an AES structure in memory.  For large number of blocks to be encrypted/decrypted by the AES algorithm.
*	@param isEncrypt		YES if this is for encryption.
*	@param key				Key.
*	@param iv				Initialisation Vector for AES, if applicable. Must be 16 bytes.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)aesInit:(BOOL)isEncrypt withKey:(NSData *)key iv:(NSData *)iv;

/** Initialises the given key in keystore and IV into an AES structure in memory.  For large number of blocks to be encrypted/decrypted by the AES algorithm.
*	@param isEncrypt		YES if this is for encryption.
*	@param keyAlias			Alias of the key in keystore.
*	@param iv				Initialisation Vector for AES, if applicable. Must be 16 bytes.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)aesInit:(BOOL)isEncrypt withKeyAlias:(int)keyAlias iv:(NSData *)iv;

/** Encrypts the given plaintext with a key using AES.
*	@param inputData		Plaintext to be encrypted.
*	@param key				Key. Key's size must be 16, 24, or 32 bytes.
*	@param iv				Initialisation Vector for CBC_MODE. Must be 16 bytes in size.
*	@param mode				Mode. Must be CBC or ECB. See <code>CipherMode</code> in vosInterfaceConst.h.
*	@param padType			Padding type. Must be NO_PADDING for no padding (the plaintext's size must be multiples of 16 bytes) or PKCS7_PADDING. See <code>PaddingType</code> in vosInterfaceConst.h.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The encrypted cipher. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesEncrypt:(NSData*)inputData withKey:(NSData*)key iv:(NSData*)iv mode:(CipherMode)mode padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Decrypts the given cipher with a key using AES.
*	@param inputData		Encypted cipher to be decrypted.
*	@param key				Key. Key's size must be 16, 24, or 32 bytes.
*	@param iv				Initialisation Vector for CBC_MODE. Must be 16 bytes in size.
*	@param mode				Mode. Must be CBC or ECB. See <code>CipherMode</code> in vosInterfaceConst.h.
*	@param padType			Padding type. Must be NO_PADDING for no padding or PKCS7_PADDING. See <code>PaddingType</code> in vosInterfaceConst.h.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The decypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesDecrypt:(NSData*)inputData withKey:(NSData*)key iv:(NSData*)iv mode:(CipherMode)mode padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Encrypts the given plaintext with a key in keystore using AES.
*	@param inputData		Plaintext to be encrypted.
*	@param keyAlias			Alias of the key in keystore.
*	@param iv				Initialisation Vector for CBC_MODE. Must be 16 bytes in size.
*	@param mode				Mode. Must be CBC or ECB. See <code>CipherMode</code> in vosInterfaceConst.h.
*	@param padType			Padding type. Must be NO_PADDING for no padding (the plaintext's size must be multiples of 16 bytes) or PKCS7_PADDING. See <code>PaddingType</code> in vosInterfaceConst.h.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The encrypted cipher. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesEncrypt:(NSData*)inputData withKeyAlias:(int)keyAlias iv:(NSData*)iv mode:(CipherMode)mode padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Decrypts the given cipher with a key in keystore using AES.
*	@param inputData		Encypted cipher to be decrypted.
*	@param keyAlias			Alias of the key in keystore.
*	@param iv				Initialisation Vector for CBC_MODE. Must be 16 bytes in size.
*	@param mode				Mode. Must be CBC or ECB. See <code>CipherMode</code> in vosInterfaceConst.h.
*	@param padType			Padding type. Must be NO_PADDING for no padding or PKCS7_PADDING. See <code>PaddingType</code> in vosInterfaceConst.h.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The decypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesDecrypt:(NSData*)inputData withKeyAlias:(int)keyAlias iv:(NSData*)iv mode:(CipherMode)mode padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Encrypts the given plaintext using AES with a key and IV that are already initialised in AES struct. See <code>aesInit</code>.
*	@param plainData		Plaintext. Size must be a multiples of 16 bytes.
*							Output size will be the same; no padding is performed.
*	@param mode				Mode. Must be CBC or ECB. See <code>CipherMode</code> in vosInterfaceConst.h.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The encrypted cipher. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesEncryptUpdate:(NSData *)plainData mode:(CipherMode)mode error:(VosError *__autoreleasing *)errorPtr;

/** Decrypts the given encrypted cipher using AES, with a key and IV that are already initialised in AES struct. See <code>aesInit</code>.
*	@param cipherData		Encrypted cipher. Size must be a multiples of 16 bytes.
*							Output size will be the same; no padding is performed.
*	@param mode				Mode. Must be CBC or ECB. See <code>CipherMode</code> in vosInterfaceConst.h.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The decypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesDecryptUpdate:(NSData *)cipherData mode:(CipherMode)mode error:(VosError *__autoreleasing *)errorPtr;

/** Encrypts the given plaintext with a key using AES-CCM, and computes a tag for authentication.
*	@param inputData		Plaintext of size a multiple of 16 bytes; no padding is performed. 
*	@param key				AES Key of 16, 24, or 32 bytes. 
*	@param nonce			Random nonce to add diversity to the process.
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only. 
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A buffer containing the encypted cipher plus the authentication tag. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesCcmEncrypt:(NSData*)inputData withKey:(NSData*)key nonce:(NSData*)nonce size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Decrypts the given ciphertext with a key using AES-CCM and verifies the embedded tag for authentication.
*	@param inputData		The encypted cipher plus the authentication tag.
*	@param key				AES Key of 16, 24, or 32 bytes.
*	@param nonce			Random nonce to add diversity to the process.
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A decrypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesCcmDecrypt:(NSData*)inputData withKey:(NSData*)key nonce:(NSData*)nonce size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Encrypts the given plaintext with a key in keystore using AES-CCM, and computes a tag for authentication.
*	@param inputData		Plaintext of size a multiple of 16 bytes; no padding is performed.
*	@param keyAlias			The alias of the AES Key in keystore.
*	@param nonce			Random nonce to add diversity to the process.
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A buffer containing the encypted cipher plus the authentication tag. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesCcmEncrypt:(NSData*)inputData withKeyAlias:(int)keyAlias nonce:(NSData*)nonce size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Decrypts the given ciphertext with a key in keystore using AES-CCM and verifies the embedded tag for authentication.
*	@param inputData		The encypted cipher plus the authentication tag.
*	@param keyAlias			The alias of the AES Key in keystore.
*	@param nonce			Random nonce to add diversity to the process.
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A decrypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesCcmDecrypt:(NSData*)inputData withKeyAlias:(int)keyAlias nonce:(NSData*)nonce size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Encrypts the given plaintext with a key using AES-GCM, and computes a tag for authentication.
*	@param inputData		Plaintext of size a multiple of 16 bytes; no padding is performed.
*	@param key				AES Key of 16, 24, or 32 bytes.
*	@param iv				Initialisation Vector for AES-GCM.
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A buffer containing the encypted cipher plus the authentication tag. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesGcmEncrypt:(NSData*)inputData withKey:(NSData*)key iv:(NSData*)iv size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Decrypts the given ciphertext with a key using AES-GCM and verifies the embedded tag for authentication.
*	@param inputData		The encypted cipher plus the authentication tag.
*	@param key				AES Key of 16, 24, or 32 bytes.
*	@param iv				Initialisation Vector for AES-GCM. 
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A decrypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesGcmDecrypt:(NSData*)inputData withKey:(NSData*)key iv:(NSData*)iv size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Encrypts the given plaintext with a key in keystore using AES-GCM, and computes a tag for authentication.
*	@param inputData		Plaintext of size a multiple of 16 bytes; no padding is performed.
*	@param keyAlias			The alias of the AES Key in keystore.
*	@param iv				Initialisation Vector for AES-GCM. 
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A buffer containing the encypted cipher plus the authentication tag. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesGcmEncrypt:(NSData*)inputData withKeyAlias:(int)keyAlias iv:(NSData*)iv size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Decrypts the given ciphertext with a key in keystore using AES-GCM and verifies the embedded tag for authentication.
*	@param inputData		The encypted cipher plus the authentication tag.
*	@param keyAlias			The alias of the AES Key in keystore.
*	@param iv				Initialisation Vector for AES-GCM. 
*	@param authTagSize		Size of authentication tag in bytes, either 20 or 32.
*	@param authInData		Data to be authenticated only.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					A decrypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesGcmDecrypt:(NSData*)inputData withKeyAlias:(int)keyAlias iv:(NSData*)iv size:(int)authTagSize authInData:(NSData*)authInData error:(VosError**)errorPtr;

/** Wraps the given key with a key wrapping key using AES-KW.
*	@param inputData		Key data in plain. 
*	@param kwk				Key Wrapping Key (KWK). 
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The wrapped key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesKeyWrap:(NSData*)inputData withKwk:(NSData*)kwk error:(VosError**)errorPtr;

/** Unwraps the given key with a key wrapping key using AES-KW.
*	@param inputData		Wrapped key data.
*	@param kwk				Key Wrapping Key (KWK).
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The unwrapped key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesKeyUnwrap:(NSData*)inputData withKwk:(NSData*)kwk error:(VosError**)errorPtr;

/** Wraps the given key with a key wrapping key in keystore using AES-KW.
*	@param inputData		Key data in plain.
*	@param kwkAlias			Alias of key Wrapping Key (KWK) in keystore.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The wrapped key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesKeyWrap:(NSData*)inputData withKwkAlias:(int)kwkAlias error:(VosError**)errorPtr;

/** Unwraps the given key with a key wrapping key using AES-KW.
*	@param inputData		Wrapped key data.
*	@param kwkAlias			Alias of key Wrapping Key (KWK) in keystore.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The unwrapped key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesKeyUnwrap:(NSData*)inputData withKwkAlias:(int)kwkAlias error:(VosError**)errorPtr;

/** Wraps the given key in keystore with a key wrapping key using AES-KW.
*	@param inputAlias		Alias of plain key in keystore.
*	@param kwk				Key Wrapping Key (KWK).
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The wrapped key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesKeyWrapInputAlias:(int)inputAlias withKwk:(NSData*)kwk error:(VosError**)errorPtr;

/** Wraps the given key in keystore with a key wrapping key, also in keystore, using AES-KW.
*	@param inputAlias		Alias of plain key in keystore.
*	@param kwkAlias			Alias of key Wrapping Key (KWK) in keystore.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The wrapped key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)aesKeyWrapInputAlias:(int)inputAlias withKwkAlias:(int)kwkAlias error:(VosError**)errorPtr;

#pragma mark - SHA
/** Calculates the SHA1 hash value for a given data.
*	@param inputData		Input data, over which the SHA1 function is performed.
*	@param inputDataLength	Number of bytes in input data to perform SHA1.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The SHA1 hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)sha1:(NSData*)inputData len:(int)inputDataLength error:(VosError**)errorPtr;

/** Calculates the SHA1 hash value for a batch of data.
*	@param inputs			The batch of data, over which the SHA1 function is performed. 
*							Each element in array must be of type <code>NSData*</code>. 
*							The SHA1 operation will be performed over each of the element in the batch, one by one.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The SHA1 hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)sha1WithChunkedInputs:(NSArray *)inputs error:(VosError *__autoreleasing *)errorPtr;

/** Calculates the SHA256 hash value for a given data.
*	@param inputData		Input data, over which the SHA256 function is performed.
*	@param inputDataLength	Number of bytes in input data to perform SHA1.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The SHA256 hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)sha256:(NSData*)inputData len:(int)inputDataLength error:(VosError**)errorPtr;

/** Calculates the SHA256 hash value for a batch of data.
*	@param inputs			The batch of data, over which the SHA256 function is performed. 
*							Each element in array must be of type <code>NSData*</code>. 
*							The SHA256 operation will be performed over each of the element in the batch, one by one.
*	@param errorPtr			If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return					The SHA256 hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)sha256WithChunkedInputs:(NSArray *)inputs error:(VosError *__autoreleasing *)errorPtr;

#pragma mark - RNG
/** Calls the random number generator to return a specified number of random bytes.
*	@param blockLength			Output buffer size in bytes, which is taken to be the number of random bytes to return.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The randomized buffer of size <code>blockLength</code> bytes. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)generateRandomBlock:(int)blockLength error:(VosError**)errorPtr;

//internal use only
+ (NSData*)generateRandomBlockForFIPSTesting:(NSData*)seed withKey:(NSData*)key dateTime:(NSData*)dateTime error:(VosError**)errorPtr;

//internal use only
+ (NSDictionary*)generateRandomBlockForFIPSMCTTesting:(NSData*)seed
                                              withKey:(NSData*)key
                                             dateTime:(NSData*)dateTime
                                                error:(VosError**)errorPtr;

#pragma mark - HMAC
/** Calculates the keyed-hash message authentication code based on SHA1 for a given message.
*	@param message				Message, over which the HMAC-SHA function is performed.
*	@param key					Key.
*	@param resultSize			Output size in number of bytes. Due to the block size of SHA1, the maximal length of
*								the output of HMAC-SHA1 function is 20 bytes. If the resultSize is less than
*								20 bytes, the output of the function is truncated.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The keyed-hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)hmacSha1:(NSData*)message withKey:(NSData*)key resultSize:(int)resultSize error:(VosError**)errorPtr;

/** Calculates the keyed-hash message authentication code based on SHA256 for a given message.
*	@param message				Message, over which the HMAC-SHA function is performed.
*	@param key					Key.
*	@param resultSize			Output size in number of bytes. Due to the block size of SHA256, the maximal length of
*								the output of HMAC-SHA256 function is 32 bytes. If the resultSize is less than
*								32 bytes, the output of the function is truncated.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The keyed-hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)hmacSha256:(NSData*)message withKey:(NSData*)key resultSize:(int)resultSize error:(VosError**)errorPtr;

/** Calculates the keyed-hash message authentication code based on SHA1 for a given message using a key in keystore.
*	@param message				Message, over which the HMAC-SHA function is performed.
*	@param keyAlias				Alias of the key in keystore.
*	@param resultSize			Output size in number of bytes. Due to the block size of SHA1, the maximal length of
*								the output of HMAC-SHA1 function is 20 bytes. If the resultSize is less than
*								20 bytes, the output of the function is truncated.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The keyed-hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)hmacSha1:(NSData*)message withKeyAlias:(int)keyAlias resultSize:(int)resultSize error:(VosError**)errorPtr;

/** Calculates the keyed-hash message authentication code based on SHA256 for a given message using a key in keystore.
*	@param message				Message, over which the HMAC-SHA function is performed.
*	@param keyAlias				Alias of the key in keystore.
*	@param resultSize			Output size in number of bytes. Due to the block size of SHA256, the maximal length of
*								the output of HMAC-SHA256 function is 32 bytes. If the resultSize is less than
*								32 bytes, the output of the function is truncated.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The keyed-hash value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)hmacSha256:(NSData*)message withKeyAlias:(int)keyAlias resultSize:(int)resultSize error:(VosError**)errorPtr;

#pragma mark - KDF
/** Generates a key based on HMAC-SHA1 for a given message and derivation key.
*	@param inputMsg				Message, over which the KDF-HMAC-SHA1 function is performed.
*	@param inputKey				Key.
*	@param outputSize			Output key size in number of bytes.
*	@param rLenBitLength		Number of iterations of a sub-function (in bits).
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The generated key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)kdfHmac:(NSData*)inputMsg withKey:(NSData*)inputKey
        outputSize:(int)outputSize rLen:(int)rLenBitLength error:(VosError**)errorPtr;

/** Generates a key based on HMAC-SHA1 for a given message and derivation key in keystore.
*	@param inputMsg				Message, over which the KDF-HMAC-SHA1 function is performed.
*	@param keyAlias				Alias in keystore of the derivation key.
*	@param outputSize			Output key size in number of bytes.
*	@param rLenBitLength		Number of iterations of a sub-function (in bits).
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The generated key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)kdfHmac:(NSData*)inputMsg withKeyAlias:(int)keyAlias
        outputSize:(int)outputSize rLen:(int)rLenBitLength error:(VosError**)errorPtr;

#pragma mark - DES3
/** Encrypts the given plaintext with a key using Triple-DES.
*	@param inputData			Plaintext.
*	@param key					Key, which must be 24 bytes.
*	@param iv					Initialisation Vector for Triple-DES.
*	@param padType				Padding type. Must be NO_PADDING for no padding (the plaintext's size must be multiples of 16 bytes) or PKCS7_PADDING.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The encrypted cipher. Or nil if fail, see <code>errorPtr</code>..
*/
+ (NSData*)des3CBCEncrypt:(NSData*)inputData withKey:(NSData*)key iv:(NSData*)iv padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Decrypts the given ciphertext with a key using Triple-DES.
*	@param inputData			Ciphertext.
*	@param key					Key, which must be 24 bytes.
*	@param iv					Initialisation Vector for Triple-DES.
*	@param padType				Padding type. See vosInterfaceConst.h.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The decrypted plaintext. Or nil if fail, see <code>errorPtr</code>..
*/
+ (NSData*)des3CBCDecrypt:(NSData*)inputData withKey:(NSData*)key iv:(NSData*)iv padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Encrypts the given plaintext with a key in keystore using Triple-DES.
*	@param inputData			Plaintext.
*	@param keyAlias				Alias of the key in keystore.
*	@param iv					Initialisation Vector for Triple-DES.
*	@param padType				Padding type. Must be NO_PADDING for no padding (the plaintext's size must be multiples of 16 bytes) or PKCS7_PADDING. See vosInterfaceConst.h.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The encrypted cipher. Or nil if fail, see <code>errorPtr</code>..
*/
+ (NSData*)des3CBCEncrypt:(NSData*)inputData withKeyAlias:(int)keyAlias iv:(NSData*)iv padding:(PaddingType)padType error:(VosError**)errorPtr;

/** Decrypts the given ciphertext with a key in keystore using Triple-DES.
*	@param inputData			Ciphertext.
*	@param keyAlias				Alias of the key in keystore.
*	@param iv					Initialisation Vector for Triple-DES.
*	@param padType				Padding type. See vosInterfaceConst.h.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The decrypted plaintext. Or nil if fail, see <code>errorPtr</code>..
*/
+ (NSData*)des3CBCDecrypt:(NSData*)inputData withKeyAlias:(int)keyAlias iv:(NSData*)iv padding:(PaddingType)padType error:(VosError**)errorPtr;

#pragma mark - PBKDF2
/** Generates a key based on SHA1 for a given password.
*	@param pwd					Password.
*	@param salt					Salt (non-secret) to increase diversity of input.
*	@param rounds				Number of iterations of a sub-function. Note: This argument is unused for now. The number of iterations is fixed as 1000.
*	@param outputSize			Output key size in number of bytes.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The generated key. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)pbkdf2:(NSData*)pwd salt:(NSData*)salt iter:(int)rounds outputSize:(int)outputSize error:(VosError**)errorPtr;

#pragma mark - RSA
/** Encrypts with a RSA public key referenced by its alias, using PKCS#1 v1.5 padding.
*	@param inputData			Plaintext.
*	@param keyAlias				An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The encrypted cipher. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)rsaPubKeyEncrypt:(NSData*)inputData withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

/** Decrypts with a RSA private key referenced by its alias, using PKCS#1 v1.5 padding.
*	@param inputData			Ciphertext.
*	@param keyAlias				An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The decrypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)rsaPrivKeyDecrypt:(NSData*)inputData withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

/** Computes RSA-SHA1 signature with an RSA private key referenced by its alias.
*	@param inputData			Input data to be signed.
*	@param keyAlias				An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The signature value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)rsaSha1Sign:(NSData*)inputData withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

/** Verifies RSA-SHA1 signature with an RSA public key referenced by its alias.
*	@param inputData			Input data.
*	@param signedData			The precomputed signature of the input data. This will be verified.
*	@param keyAlias				An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
*	@return						Non-negative value if succeed or negative value if fail.
*/
+ (int)rsaSha1Verify:(NSData*)inputData signature:(NSData*)signedData withKeyAlias:(int)keyAlias;

/** Computes RSA-SHA256 signature with an RSA private key referenced by its alias.
*	@param inputData			Input data to be signed.
*	@param keyAlias				An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The signature value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)rsaSha256Sign:(NSData*)inputData withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

/** Verifies RSA-SHA256 signature with an RSA public key referenced by its alias.
*	@param inputData			Input data.
*	@param signedData			The precomputed signature of the input data. This will be verified.
*	@param keyAlias				An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
*	@return						Non-negative value if succeed or negative value if fail.
*/
+ (int)rsaSha256Verify:(NSData*)inputData signature:(NSData*)signedData withKeyAlias:(int)keyAlias;

/** Encrypts with a RSA public key referenced by its alias, using OAEP.
*	@param inputData			Plaintext.
*	@param keyAlias				An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
*	@param param				OEAP input parameter or Label. The buffer can contain all zero bytes.
*	@param pLen					Number of bytes to use in OEAP input parameter buffer.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The encrypted cipher. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)rsaOAEPEncrypt:(NSData*)inputData withKeyAlias:(int)keyAlias param:(NSData*)param plen:(int)pLen error:(VosError**)errorPtr;

/** Decrypts with a RSA private key referenced by its alias, using OAEP.
*	@param inputData			Ciphertext.
*	@param keyAlias				An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
*	@param param				OEAP input parameter or Label. The buffer can contain all zero bytes.
*	@param pLen					Number of bytes to use in OEAP input parameter buffer.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The decrypted plaintext. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)rsaOAEPDecrypt:(NSData*)inputData withKeyAlias:(int)keyAlias param:(NSData*)param plen:(int)pLen error:(VosError**)errorPtr;

#pragma mark - ECC
/** Computes ECDSA-SHA1 signature with an ECC private key referenced by its alias.
*	@param inputData			Input data to be signed.
*	@param keyAlias				An alias used to reference the ECC private key inside the keystore. See keystore's related functions.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The signature value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)eccSha1Sign:(NSData*)inputData withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

/** Verifies ECDSA-SHA1 signature with an ECC public key referenced by its alias.
*	@param inputData			Input data.
*	@param signedData			The precomputed signature of the input data. This will be verified.
*	@param keyAlias				An alias used to reference the ECC public key inside the keystore. See keystore's related functions.
*	@return						Non-negative value if succeed or negative value if fail.
*/
+ (int)eccSha1Verify:(NSData*)inputData signature:(NSData*)signedData withKeyAlias:(int)keyAlias;

/** Computes ECDSA-SHA256 signature with an ECC private key referenced by its alias.
*	@param inputData			Input data to be signed.
*	@param keyAlias				An alias used to reference the ECC private key inside the keystore. See keystore's related functions.
*	@param errorPtr				If there is any error, a VosError object will be created and will be used to store the error code. <code>*errorPtr</code> will point to this object.
*	@return						The signature value. Or nil if fail, see <code>errorPtr</code>.
*/
+ (NSData*)eccSha256Sign:(NSData*)inputData withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

/** Verifies ECDSA-SHA256 signature with an ECC public key referenced by its alias.
*	@param inputData			Input data.
*	@param signedData			The precomputed signature of the input data. This will be verified.
*	@param keyAlias				An alias used to reference the ECC public key inside the keystore. See keystore's related functions.
*	@return						Non-negative value if succeed or negative value if fail.
*/
+ (int)eccSha256Verify:(NSData*)inputData signature:(NSData*)signedData withKeyAlias:(int)keyAlias;

/** Generates ECC keypair in keystore, to be referenced by the given alias.
*	@param keySize			Size of ECC Curve in bytes, which can be 32, 48, 66.
*	@param keyAlias			An alias used to reference the ECC public key inside the keystore. See keystore's related functions.
*	@return					Non-negative value if succeed or negative value if fail.
*/
+ (int)eccGenerateKeyPair:(int)keySize alias:(int)keyAlias;

/** Unsupported function for now.
*/
+ (NSData*)generateCsrInCertstore:(NSData*)inputString Pin:(NSData*)pin algo:(Algorithm)algo withKeyAlias:(int)keyAlias error:(VosError**)errorPtr;

#pragma mark - MISC
/** Pads the data.
*	@param data				The plain data to be padded.
*	@param padType			See vosInterfaceConst.h.
*	@return					The padded data.
*/
+ (NSData*)padding:(NSData*)data with:(PaddingType)padType;

/** Unpads the data.
*	@param data				The padded data.
*	@param padType			See vosInterfaceConst.h.
*	@return					The original data.
*/
+ (NSData*)unpadding:(NSData*)data with:(PaddingType)padType;

/** Converts hex string to data.
*	@param hexString		The string containing the hex form of the data.
*	@return					The binary data.
*/
+(NSData*)hexStringToData:(NSString*)hexString;

/** Converts data to hex string.
*	@param hexData			The binary data to be converted.
*	@param spaces			Whether the hex string should cointain the spaces between bytes or not.
*	@return					The string containing the hex form of the data.
*/
+(NSString*)hexDataToString:(NSData*)hexData withSpaces:(BOOL)spaces;

// Call this if you want to get data start from byte 0
// ends at 'indexByte'
+ (NSData*)readBytes:(NSString*)pathFile toByte:(int)indexByte; //internal use only

// Call this if you want to get data start from 'indexByte'
// ends at theByte.length
+ (NSData*)readBytes:(NSString*)pathFile fromByte:(int)indexByte; //internal use only

// If you have custom size, let say byte from indexByte 50-90
// then this is your function
+ (NSData*)readBytes:(NSString*)pathFile inRange:(NSRange)byteRange; //internal use only

+ (BOOL)zeroizeFileWithRandomBytes:(NSString*)filePath; //internal use only
+ (BOOL)zeroizeFileWithZeroValues:(NSString*)filePath; //internal use only


//DFP
+ (NSData*) getDeviceFingerprint;//get encrypted DFP (internal use only)

/** Get hashed device fingerprint (DFP). The hashed value is SHA256-length (32 bytes) array
*	@return		The hashed DFP or nil if fail.
*/
+ (NSData*) getDeviceFingerprintHash;

/** Get hashed device fingerprint (DFP). The hashed value is SHA256-length (32 bytes) array
*	@param errorCode	If there is any error. This pointer's pointed value will contain the error code.
*	@return				The hashed DFP or nil if there is error.
*/
+ (NSData *) getDeviceFingerprintHashWithErrorCode: (int *) errorCode;

/** Get native handle of the virtual machine associated with VosWrapper.
* @return  pointer to V-OS VM's associated with VosWrapper. Or NULL if there is no V-OS VM associated with VosWrapper.
*/
+ (void*) getVM;
//end LHQ

/** Acquire & lock the access to VosWrapper for current thread.
 * @return pointer to V-OS VM's associated with VosWrapper. Or NULL if there is no V-OS VM associated with VosWrapper.
 */
+ (void*)threadLock;

/** Unlock the access to VosWrapper from current thread
 * @return Nothing
 */
+ (void)threadUnlock;

/** Copy "vkeylicensepack" from App bundle's Resources folder to Document folder.
*	This step is crucial if you want to start a V-OS VM without associating with VosWrapper via VOSStart() function directly. See vosInterface.h.
 *	@return Always returns YES.
 */
+(BOOL)copyAssets;

#ifdef HAVE_CUSTOM_TA
+ (void)custom_function; //internal use only
#endif

/** Registers the event callback. This callback will be fired if there is any important event happens during V-OS execution.
 *	Note: Only one callback can be registered at any time.
 * @param callback		The callback to be registered. See <code>vos_callback_fcn_ptr_t</code> in vosInterface.h.
 *						At the minimum, the callback should return true.
 * @return				Nothing
 */
+ (void)registerCallback:(vos_callback_fcn_ptr_t)callback;

/** Get a byte array containing the client certificate
 * @return      a byte array contains the client certificate if successful, otherwise returns null
 */
+(NSData*)getMtlsCertificate;

/** Get a NSString containing the client password
 * @return      a NSString contains the client password if successful, otherwise returns nil.
 *              The password length excludes the terminating null character.
 */
+(NSString*)getMtlsPassword;

/** Get Troubleshooting ID.
*	@return		The Troubleshooting ID or nil if fail.
*/
+(NSData*)getTroubleshootingId;

/** Let V-OS to verify the CFO JWS String
 * @param CfoJwsString      The CFO JWS string to be verified.
 * @return                  0 on success, negative on failure.
 */
+(int)cfoJwsVerify:(NSString*)cfoJwsString;

/** Let V-OS to verify the CEL JWS String
 * @param CelJwsString      The CEL JWS string to be verified.
 * @return                  YES on success, NO on failure.
 */
+(int)celJwsVerify:(NSString*)celJwsString;

/** Get the SHA256 hash of the Server Issued CEL JWS String
 *  @return                 valid hex String on success, empty String ("") on failure
 */
+(NSString*)getCelJwsHash;

/** Get the CEL Payload as a JSON String
 *  @return                 valid String on success, empty String ("") on failure
 */
+(NSString*)getCelPayload;


+ (void *)getVmHandle;
+ (void)releaseVmHandle;

+ (NSString*)getProcessorVersion;
+ (NSString*)getFirmwareVersion;

+ (int) execute: (id <Runnable>) r;
+ (int) executeBlock: (void(^)(void)) run;

/** Reset all V-OS files and storage including keychain items, trusted storage items, and generated files
 * @return        YES on success, NO on failure.
 */
+ (BOOL) clearVOS;
@end

VOS_EXPORT
@interface VosWrapper(VSLogger)
// VOS
+ (void)setLoggerBaseUrl:(NSString *)url;
+ (void)log:(LogLevel_t)level :(LogMode_t)mode :(NSString *)name :(NSString *)clasz :(NSString *)tag :(NSString *)msg, ...;
+ (void)addLog:(LogLevel_t)level :(LogMode_t)mode :(NSString *)name :(NSString *)clasz :(NSString *)tag :(NSString *)msg;
+ (void)forceSyncLogs;

@end

#endif//__OBJC__

//end LHQ
