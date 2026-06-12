/**	@file vosInterface_crypto.h
 *
 *	Created by Roddy Kok on 30/1/15.
 *	Copyright (c) 2015 V-Key Pte Ltd. All rights reserved.
 *
 *	Contact us with any questions or comments.
 *
 *	http://www.v-key.com
 *
 */


#ifndef vosInterface_crypto_h
#define vosInterface_crypto_h

#include "vmPtr.h"

#include "vosInterface.h"

/*----------------------interface declaration-------------------------------------------*/

/** get the crypto mode used by V-OS
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				PQR: 1
 *                      Normal: 0
 */
VOS_API int vosInterface_crypto_get_mode(void* vmhandle);

#ifndef NO_CRYPTO_API
//	hash
/** Calculates the SHA1 hash value for a given data.
 *	@param input		Pointer to input data, over which the SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize	Input data's size in bytes.
 *	@param output		This is a VM pointer pointing to a memory buffer in VM that will store the calculated hash value upon return.
 *						See <code>vm_malloc</code>.
 *						Due to the block size of SHA1, the size of the output buffer must be 20 bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha1(struct vmPtr input, int inputSize, struct vmPtr output, void* vmhandle);

/** Preprares a SHA1 operation to compute the hash value for a big input data. The input data's parts will be supplied iteratively via vosInterface_crypto_sha1_update() function.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha1_init(void* vmhandle);

/** Supplies the input data's portion to the prepared SHA1 operation. See <code>vosInterface_crypto_sha1_init</code>.
 *	@param input		Pointer to input data's portion, over which the SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize	Input data's portion's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha1_update(struct vmPtr input, int inputSize, void* vmhandle);

/** Finishes the SHA1 operation and produces the hash value. See <code>vosInterface_crypto_sha1_init</code> and <code>vosInterface_crypto_sha1_update</code>.
 *	@param output		This is a VM pointer pointing to a memory buffer in VM that will store the calculated hash value upon return.
 *						See <code>vm_malloc</code>.
 *						Due to the block size of SHA1, the size of the output buffer must be 20 bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha1_final(struct vmPtr output, void* vmhandle);

/** Calculates the SHA256 hash value for a given data.
 *	@param input		Pointer to input data, over which the SHA256 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize	Input data's size in bytes.
 *	@param output		This is a VM pointer pointing to a memory buffer in VM that will store the calculated hash value upon return.
 *						See <code>vm_malloc</code>.
 *						Due to the block size of SHA256, the size of the output buffer must be 32 bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha256(struct vmPtr input, int inputSize, struct vmPtr output, void* vmhandle);

/** Preprares a SHA256 operation to compute the hash value for a big input data. The input data's parts will be supplied iteratively via vosInterface_crypto_sha1_update() function.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha256_init(void* vmhandle);

/** Supplies the input data's portion to the prepared SHA256 operation. See <code>vosInterface_crypto_sha256_init</code>.
 *	@param input		Pointer to input data's portion, over which the SHA256 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize	Input data's portion's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha256_update(struct vmPtr input, int inputSize, void* vmhandle);

/** Finishes the SHA256 operation and produces the hash value. See <code>vosInterface_crypto_sha256_init</code> and <code>vosInterface_crypto_sha256_update</code>.
 *	@param output		This is a VM pointer pointing to a memory buffer in VM that will store the calculated hash value upon return.
 *						See <code>vm_malloc</code>.
 *						Due to the block size of SHA256, the size of the output buffer must be 32 bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_sha256_final(struct vmPtr output, void* vmhandle);



//	hmac
/** Calculates the keyed-hash message authentication code based on SHA1 for a given message.
 *	@param output		This is a VM pointer referencing an output memory buffer in VM that will store the calculated keyed-hash value upon return.
 *						See <code>vm_malloc</code>.
 *	@param outputSize	Output size in number of bytes. Due to the block size of SHA1, the maximal length of
 *						the output of HMAC-SHA1 function is 20 bytes. If the resultSize is less than
 *						20 bytes, the output of the function is truncated.
 *	@param key			Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize		Key size can be less than, same to or larger than the block size of SHA1 which is
 *						20 bytes.
 *	@param msg			Message, over which the HMAC-SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgSize		Message's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha1(struct vmPtr output, int outputSize, struct vmPtr key, int keySize, struct vmPtr msg, int msgSize, void* vmhandle);

/** Calculates the keyed-hash message authentication code based on SHA1 for a given message. This version uses a key stored inside keystore.
 *	@param output		This is a VM pointer referencing an output memory buffer in VM that will store the calculated keyed-hash value upon return.
 *						See <code>vm_malloc</code>.
 *	@param outputSize	Output size in number of bytes. Due to the block size of SHA1, the maximal length of
 *						the output of HMAC-SHA1 function is 20 bytes. If the resultSize is less than
 *						20 bytes, the output of the function is truncated.
 *	@param keyAlias		An alias used to reference the key inside the keystore. See keystore's related functions.
 *	@param msg			Message, over which the HMAC-SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgSize		Message's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha1_alias(struct vmPtr output, int outputSize, int keyAlias, struct vmPtr msg, int msgSize, void* vmhandle);

/** Preprares a HMAC-SHA1 operation to compute the keyed-hash value for a big message data. The message data's parts will be supplied iteratively via vosInterface_crypto_hmac_update() function.
 *	@param key			Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize		Key size can be less than, same to or larger than the block size of SHA1 which is
 *						20 bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha1_init(struct vmPtr key, int keySize, void* vmhandle);

/** Preprares a HMAC-SHA1 operation to compute the keyed-hash value for a big message data. The message data's parts will be supplied iteratively via vosInterface_crypto_hmac_update() function.
 *	@param keyAlias		An alias used to reference the key inside the keystore. See keystore's related functions.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha1_init_alias(int keyAlias, void* vmhandle);

/** Calculates the keyed-hash message authentication code based on SHA256 for a given message.
 *	@param output		This is a VM pointer referencing an output memory buffer in VM that will store the calculated keyed-hash value upon return.
 *						See <code>vm_malloc</code>.
 *	@param outputSize	Output size in number of bytes. Due to the block size of SHA256, the maximal length of
 *						the output of HMAC-SHA256 function is 32 bytes. If the resultSize is less than
 *						32 bytes, the output of the function is truncated.
 *	@param key			Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize		Key size can be less than, same to or larger than the block size of SHA256 which is
 *						32 bytes.
 *	@param msg			Message, over which the HMAC-SHA256 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgSize		Message's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha256(struct vmPtr output, int outputSize, struct vmPtr key, int keySize, struct vmPtr msg, int msgSize, void* vmhandle);

/** Calculates the keyed-hash message authentication code based on SHA256 for a given message. This version uses a key stored inside keystore.
 *	@param output		This is a VM pointer referencing an output memory buffer in VM that will store the calculated keyed-hash value upon return.
 *						See <code>vm_malloc</code>.
 *	@param outputSize	Output size in number of bytes. Due to the block size of SHA256, the maximal length of
 *						the output of HMAC-SHA256 function is 32 bytes. If the resultSize is less than
 *						32 bytes, the output of the function is truncated.
 *	@param keyAlias		An alias used to reference the key inside the keystore. See keystore's related functions.
 *	@param msg			Message, over which the HMAC-SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgSize		Message's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha256_alias(struct vmPtr output, int outputSize, int keyAlias, struct vmPtr msg, int msgSize, void* vmhandle);

/** Preprares a HMAC-SHA256 operation to compute the keyed-hash value for a big message data. The message data's parts will be supplied iteratively via vosInterface_crypto_hmac_update() function.
 *	@param key			Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize		Key size can be less than, same to or larger than the block size of SHA256 which is
 *						32 bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha256_init(struct vmPtr key, int keySize, void* vmhandle);

/** Preprares a HMAC-SHA256 operation to compute the keyed-hash value for a big message data. The message data's parts will be supplied iteratively via vosInterface_crypto_hmac_update() function.
 *	@param keyAlias		An alias used to reference the key inside the keystore. See keystore's related functions.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_sha256_init_alias(int keyAlias, void* vmhandle);

/** Supplies the message data's portion to the prepared HMAC_(SHA1|SHA256) operation. See <code>vosInterface_crypto_hmac_sha1_init</code> and <code>vosInterface_crypto_hmac_sha256_init</code>.
 *	@param msg			Pointer to input data's portion, over which the HMAC_SHA function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgLen		Input data's portion's size in bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_update(struct vmPtr msg, int msgLen, void* vmhandle);

/** Finishes the HMAC_(SHA1|SHA256) operation and produces the keyed-hash value. See <code>vosInterface_crypto_sha*_init</code> and <code>vosInterface_crypto_sha*_update</code>.
 *	@param output		This is a VM pointer pointing to a memory buffer in VM that will store the calculated keyed-hash value upon return.
 *						See <code>vm_malloc</code>.
 *	@param outputSize	Output size in number of bytes. Due to the block size of SHA1|SHA256, the maximal length of
 *						the output is 20|32 bytes. If the resultSize is less than
 *						20|32 bytes, the output of the function is truncated.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_hmac_final(struct vmPtr output, int outputSize, void* vmhandle);


//	kdf
/** Generates a key based on HMAC-SHA1 for a given message and derivation key.
 *	@param inputKey			Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputkeySize		Key size can be less than, same to or larger than the hash size of SHA1 which is
 *							20 bytes.
 *	@param inputMsg			Message, over which the KDF-HMAC-SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgSize			Message's size in bytes.
 *	@param outputKey		This is a VM pointer referencing an output memory buffer in VM that will store the calculated key value upon return.
 *							See <code>vm_malloc</code>.
 *	@param outputKeySize	Output key size in number of bytes.
 *	@param bitSizeIteration	Number of iterations of a sub-function (in bits).
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_kdf_hmac(struct vmPtr inputKey, int inputkeySize, struct vmPtr inputMsg, int msgSize, struct vmPtr outputKey, int outputKeySize, int bitSizeIteration, void* vmhandle);

/** Generates a key based on HMAC-SHA1 for a given message and derivation key, referenced by its alias.
 *	@param keyAlias			An alias used to reference the key inside the keystore. See keystore's related functions.
 *	@param inputMsg			Message, over which the KDF-HMAC-SHA1 function is performed. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param msgSize			Message's size in bytes.
 *	@param outputKey		This is a VM pointer referencing an output memory buffer in VM that will store the calculated key value upon return.
 *							See <code>vm_malloc</code>.
 *	@param outputKeySize	Output key size in number of bytes.
 *	@param bitSizeIteration	Number of iterations of a sub-function (in bits).
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_kdf_hmac_alias(int keyAlias, struct vmPtr inputMsg, int msgSize, struct vmPtr outputKey, int outputKeySize, int bitSizeIteration, void* vmhandle);

/** Generates a key based on SHA1 for a given password.
 *	@param output		This is a VM pointer referencing an output memory buffer in VM that will store the calculated key value upon return.
 *						See <code>vm_malloc</code>.
 *	@param pwd			Password. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param pwdSize		Password size in bytes.
 *	@param salt			Salt (non-secret) to increase diversity of input. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param saltSize		Salt's size in bytes.
 *	@param iterations	Number of iterations of a sub-function. Note: This argument is unused for now. The number of iterations is fixed as 1000.
 *	@param keySize		Output key size in number of bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_kdf_pbkdf2(struct vmPtr output, struct vmPtr pwd, int pwdSize, struct vmPtr salt, int saltSize, int iterations, int keySize, void* vmhandle);

/** Generates a key based on SHA256 for a given password.
 *	@param output		This is a VM pointer referencing an output memory buffer in VM that will store the calculated key value upon return.
 *						See <code>vm_malloc</code>.
 *	@param pwd			Password. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param pwdSize		Password size in bytes.
 *	@param salt			Salt (non-secret) to increase diversity of input. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param saltSize		Salt's size in bytes.
 *	@param iterations	Number of iterations of a sub-function. Note: This argument is unused for now. The number of iterations is fixed as 1000.
 *	@param keySize		Output key size in number of bytes.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_kdf_pbkdf2_sha256(struct vmPtr output, struct vmPtr pwd, int pwdSize, struct vmPtr salt, int saltSize, int iterations, int keySize, void* vmhandle);

//	rng
/** Initialises the random number generator.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rng_init(void* vmhandle);

/** Calls the random number generator to return a specified number of random bytes.
 *	@param buffer		Output buffer. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param bufferSize	Output buffer size in bytes, which is taken to be the number of random bytes to return.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rng_bytes(struct vmPtr buffer, int bufferSize, void* vmhandle);

//	aes
/** Encrypts the given plaintext with a key using AES-CBC.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize			Key size in bytes; can be 16, 24, or 32.
 *	@param iv				Initialisation Vector for AES-CBC. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_cbc_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-CBC.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the decrypted value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize			Key size in bytes; can be 16, 24, or 32.
 *	@param iv				Initialisation Vector for AES-CBC. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_cbc_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-CBC.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for AES-CBC. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_cbc_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-CBC.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the decrypted value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for AES-CBC. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_cbc_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-ECB.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize			Key size in bytes; can be 16, 24, or 32.
 *	@param iv				This argument is not used, it is included only for compatibility with other AES modes. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ecb_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-ECB.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the decrypted value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize			Key size in bytes; can be 16, 24, or 32.
 *	@param iv				This argument is not used, it is included only for compatibility with other AES modes. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ecb_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-ECB.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				This argument is not used, it is included only for compatibility with other AES modes. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ecb_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-ECB.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the decrypted value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				This argument is not used, it is included only for compatibility with other AES modes. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ecb_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

/** Initialises the given key and IV into an AES structure in memory.  For large number of blocks to be encrypted/decrypted by the AES algorithm.
 *	@param key				Key. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keySize			Key size in bytes; can be 16, 24, or 32.
 *	@param iv				Initialisation Vector for AES, if applicable. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param mode				ENCRYPTION or DECRYPTION.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_batch_init(struct vmPtr key, int keySize, struct vmPtr iv, int mode, void* vmhandle);

/** Initialises the given key and IV into an AES structure in memory.  For large number of AES blocks
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for AES, if applicable. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param mode				ENCRYPTION or DECRYPTION.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_batch_init_alias(int keyAlias, struct vmPtr iv, int mode, void* vmhandle);

/** Encrypts the given plaintext using AES-CBC, with a key and IV that are already initialised in AES struct.
 *	@param plainText		Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plainTextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param cipherText		This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_batch_cbc_enc_update(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle);

/** Encrypts the given plaintext using AES-CBC, with a key and IV that are already initialised in AES struct.
 *	@param cipherText		Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param cipherTextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param plainText		This is a VM pointer referencing an output memory buffer in VM that will store the plaintext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_batch_cbc_dec_update(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle);

/** Encrypts the given plaintext using AES-ECB, with a key that is already initialised in AES struct.
 *	@param plainText		Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plainTextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param cipherText		This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_batch_ecb_enc_update(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle);

/** Encrypts the given plaintext using AES-ECB, with a key that is already initialised in AES struct.
 *	@param cipherText		Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param cipherTextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param plainText		This is a VM pointer referencing an output memory buffer in VM that will store the plaintext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_batch_ecb_dec_update(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-CCM, and computes a tag for authentication.
 *	@param plain			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				AES Key of 16, 24, or 32 bytes. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param nonce			Random nonce to add diversity to the process. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Output of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ccm_enc(struct vmPtr plain, struct vmPtr buffer, struct vmPtr key, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-CCM and verifies the given tag for authentication.
 *	@param cipher			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				AES Key of 16, 24, or 32 bytes. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param nonce			Random nonce to add diversity to the process. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Input of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ccm_dec(struct vmPtr cipher, struct vmPtr buffer, struct vmPtr key, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-CCM, and computes a tag for authentication.
 *	@param plain			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param nonce			Random nonce to add diversity to the process. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Output of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ccm_enc_alias(struct vmPtr plain, struct vmPtr buffer, int keyAlias, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-CCM and verifies the given tag for authentication.
 *	@param cipher			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param nonce			Random nonce to add diversity to the process. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Input of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_ccm_dec_alias(struct vmPtr cipher, struct vmPtr buffer, int keyAlias, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-GCM, and computes a tag for authentication.
 *	@param plain			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				AES Key of 16, 24, or 32 bytes. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param iv				Initialisation Vector for AES-GCM. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Output of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_gcm_enc(struct vmPtr plain, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-GCM, and verifies the given tag for authentication.
 *	@param cipher			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				AES Key of 16, 24, or 32 bytes. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param iv				Initialisation Vector for AES-GCM. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Input of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_gcm_dec(struct vmPtr cipher, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Encrypts the given plaintext with a key using AES-GCM, and computes a tag for authentication.
 *	@param plain			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for AES-GCM. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Output of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_gcm_enc_alias(struct vmPtr plain, struct vmPtr buffer, int keyAlias, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Decrypts the given ciphertext with a key using AES-GCM, and verifies the given tag for authentication.
 *	@param cipher			Plaintext of size a multiple of 16; no padding is performed. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the AES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for AES-GCM. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param authTag			Input of authentication tag. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param sizeAuthTag		Size of authentication tag in bytes, either 20 or 32.
 *	@param authIn			Data to be authenticated only. This is a VM pointer.
 *							See <code>vm_malloc</code>.
 *	@param szBuffer			Output buffer size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_gcm_dec_alias(struct vmPtr cipher, struct vmPtr buffer, int keyAlias, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

/** Wraps the given key with a key wrapping key using AES-KW.
 *	@param keyData				Key data in plain. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keyDataSize			Size of key data in bytes.
 *	@param buffer				This is a VM pointer referencing an output memory buffer in VM that will store the wrapped key value upon return.
 *								See <code>vm_malloc</code>.
 *	@param kwk					Key Wrapping Key (KWK). This is a VM pointer. See <code>vm_malloc</code>.
 *	@param kwkSize				KWK size in bytes; can be 16, 24, or 32.
 *	@param vmhandle				Pointer to the V-OS VM.
 *	@return						Size of wrapped output if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_kw_wrap(struct vmPtr keyData, int keyDataSize, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle);

/** Unwraps the given key with a key wrapping key using AES-KW.
 *	@param wrappedKeyData		Wrapped key data. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param wrappedKeyDataSize	Size of key data in bytes.
 *	@param buffer				This is a VM pointer referencing an output memory buffer in VM that will store the unwrapped key value upon return.
 *								See <code>vm_malloc</code>.
 *	@param kwk					Key Wrapping Key (KWK). This is a VM pointer. See <code>vm_malloc</code>.
 *	@param kwkSize				KWK size in bytes; can be 16, 24, or 32.
 *	@param vmhandle				Pointer to the V-OS VM.
 *	@return						Size of unwrapped output if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_kw_unwrap(struct vmPtr wrappedKeyData, int wrappedKeyDataSize, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle);

/** Wraps the given key with a key wrapping key using AES-KW.
 *	@param keyData				Key data in plain. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param keyDataSize			Size of key data in bytes.
 *	@param buffer				This is a VM pointer referencing an output memory buffer in VM that will store the wrapped key value upon return.
 *								See <code>vm_malloc</code>.
 *	@param kwkAlias				An alias used to reference the AES KWK inside the keystore. See keystore's related functions.
 *	@param vmhandle				Pointer to the V-OS VM.
 *	@return						Size of wrapped output if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_kw_wrap_alias(struct vmPtr keyData, int keyDataSize, struct vmPtr buffer, int kwkAlias, void* vmhandle);

/** Unwraps the given key with a key wrapping key using AES-KW.
 *	@param wrappedKeyData		Key data in plain. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param wrappedKeyDataSize	Size of key data in bytes.
 *	@param buffer				This is a VM pointer referencing an output memory buffer in VM that will store the unwrapped key value upon return.
 *								See <code>vm_malloc</code>.
 *	@param kwkAlias				An alias used to reference the AES KWK inside the keystore. See keystore's related functions.
 *	@param vmhandle				Pointer to the V-OS VM.
 *	@return						Size of unwrapped output if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_kw_unwrap_alias(struct vmPtr wrappedKeyData, int wrappedKeyDataSize, struct vmPtr buffer, int kwkAlias, void* vmhandle);

/** Wraps the key in keystore referenced by the given keyAlias with a key wrapping key using AES-KW.
 *	@param keyAlias				An alias used to reference the target key inside the keystore. See keystore's related functions.
 *	@param buffer				This is a VM pointer referencing an output memory buffer in VM that will store the wrapped key value upon return.
 *								See <code>vm_malloc</code>.
 *	@param kwk					Key Wrapping Key (KWK). This is a VM pointer. See <code>vm_malloc</code>.
 *	@param kwkSize				KWK size in bytes; can be 16, 24, or 32.
 *	@param vmhandle				Pointer to the V-OS VM.
 *	@return						Size of wrapped output if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_kw_wrap_keyalias(int keyAlias, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle);

/** Wraps the key in keystore, referenced by the given keyAlias, with a key wrapping key, also in keystore and referenced by kwkAlias, using AES-KW.
 *	@param keyAlias				An alias used to reference the target key inside the keystore. See keystore's related functions.
 *	@param buffer				This is a VM pointer referencing an output memory buffer in VM that will store the wrapped key value upon return.
 *								See <code>vm_malloc</code>.
 *	@param kwkAlias				An alias used to reference the AES KWK inside the keystore. See keystore's related functions.
 *	@param vmhandle				Pointer to the V-OS VM.
 *	@return						Size of wrapped output if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_aes_kw_wrap_keyalias_alias(int keyAlias, struct vmPtr buffer, int kwkAlias, void* vmhandle);

// des3
/** Encrypts the given plaintext with a key using Triple-DES.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				Key (size must be 24 bytes). This is a VM pointer. See <code>vm_malloc</code>.
 *	@param iv				Initialisation Vector for Triple-DES. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_cbc_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, void* vmhandle);

/** Decrypts the given ciphertext with a key using Triple-DES.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the decrypted value upon return.
 *							See <code>vm_malloc</code>.
 *	@param key				Key (size must be 24 bytes). This is a VM pointer. See <code>vm_malloc</code>.
 *	@param iv				Initialisation Vector for Triple-DES. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_cbc_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, void* vmhandle);

/** Encrypts the given plaintext with a key using Triple-DES.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the 3DES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for Triple-DES. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_cbc_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

/** Decrypts the given ciphertext with a key using Triple-DES.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the decrypted value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the 3DES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for Triple-DES. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_cbc_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

/** Initialises the given key and IV into an DES3 structure in memory.  For large number of 3DES blocks
 *	@param key				Key whose size is 24 bytes. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param iv				Initialisation Vector for 3DES, if applicable. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param mode				ENCRYPTION or DECRYPTION.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_batch_init(struct vmPtr key, struct vmPtr iv, int mode, void* vmhandle);

/** Initialises the given key and IV into an DES3 structure in memory.  For large number of 3DES blocks
 *	@param keyAlias			An alias used to reference the 3DES key inside the keystore. See keystore's related functions.
 *	@param iv				Initialisation Vector for 3DES, if applicable. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param mode				ENCRYPTION or DECRYPTION.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_batch_init_alias(int keyAlias, struct vmPtr iv, int mode, void* vmhandle);

/** Encrypts the given plaintext using Triple-DES, with a key and IV that are already initialised in DES3 struct.
 *	@param plainText		Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plainTextSize	Plaintext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param cipherText		This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_batch_cbc_enc_update(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle);

/** Encrypts the given plaintext using Triple-DES, with a key and IV that are already initialised in DES3 struct.
 *	@param cipherText		Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param cipherTextSize	Ciphertext size in bytes, which must be a multiple of 16.
 *							Output size will be the same; no padding is performed
 *	@param plainText		This is a VM pointer referencing an output memory buffer in VM that will store the plaintext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_des3_batch_cbc_dec_update(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle);


// rsa
/** Encrypts with an RSA public key referenced by its alias, using PKCS #1 v1.5 padding.
 *	@param plain			Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plaintextSize	Plaintext size in bytes.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param keyAlias			An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_pub_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, void* vmhandle);

/** Decrypts with an RSA private key referenced by its alias, using PKCS #1 v1.5 padding.
 *	@param cipher			Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param ciphertextSize	Ciphertext size in bytes.
 *	@param buffer			This is a VM pointer referencing an output memory buffer in VM that will store the output value upon return.
 *							See <code>vm_malloc</code>.
 *	@param bufferSize		Size of output buffer in bytes.
 *	@param keyAlias			An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_pri_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int bufferSize, int keyAlias, void* vmhandle);

/** Encrypts with an RSA public key referenced by its alias, using OAEP.
 *	@param plainText		Plaintext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param plainTextSize	Plaintext size in bytes.
 *	@param cipherText		This is a VM pointer referencing an output memory buffer in VM that will store the ciphertext value upon return.
 *							See <code>vm_malloc</code>.
 *	@param param			OEAP input parameter or Label. This is a VM pointer. See <code>vm_malloc</code>. The buffer can contain all zero bytes.
 *	@param pLen				OEAP input parameter's size in bytes.
 *	@param keyAlias			An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_oaep_enc_alias(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, struct vmPtr param, int pLen, int keyAlias, void* vmhandle);

/** Decrypts with an RSA private key referenced by its alias, using OAEP.
 *	@param cipherText		Ciphertext. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param cipherTextSize	Ciphertext size in bytes.
 *	@param plainText		This is a VM pointer referencing an output memory buffer in VM that will store the output value upon return.
 *							See <code>vm_malloc</code>.
 *	@param param			OEAP input parameter or Label. This is a VM pointer. See <code>vm_malloc</code>. The buffer can contain all zero bytes.
 *	@param pLen				OEAP input parameter's size in bytes.
 *	@param keyAlias			An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_oaep_dec_alias(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, struct vmPtr param, int pLen, int keyAlias, void* vmhandle);

/** Computes RSA-SHA1 signature with an RSA private key referenced by its alias.
 *	@param input			Input. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param output			This is a VM pointer referencing an output memory buffer in VM that will store the signature value upon return.
 *							See <code>vm_malloc</code>.
 *	@param outputSize		Size of output buffer in bytes.
 *	@param keyAlias			An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Size of the signature value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_sha1_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);

/** Verifies RSA-SHA1 signature with an RSA public key referenced by its alias.
 *	@param signature		The precomputed signature of the message. This will be verified.
 *							This is VM pointer. See <code>vm_malloc</code>.
 *	@param signatureSize	Size of signature in bytes.
 *	@param input			Input message. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param keyAlias			An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_sha1_verify_alias(struct vmPtr signature, int signatureSize, struct vmPtr input, int inputSize, int keyAlias, void* vmhandle);

/** Computes RSA-SHA256 signature with an RSA private key referenced by its alias.
 *	@param input			Input. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param output			This is a VM pointer referencing an output memory buffer in VM that will store the signature value upon return.
 *							See <code>vm_malloc</code>.
 *	@param outputSize		Size of output buffer in bytes.
 *	@param keyAlias			An alias used to reference the RSA private key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Size of the signature value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_sha256_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);

/** Verifies RSA-SHA256 signature with an RSA public key referenced by its alias.
 *	@param signature		The precomputed signature of the message. This will be verified.
 *							This is VM pointer. See <code>vm_malloc</code>.
 *	@param signatureSize	Size of signature in bytes.
 *	@param input			Input message. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param keyAlias			An alias used to reference the RSA public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_rsa_sha256_verify_alias(struct vmPtr signature, int signatureSize, struct vmPtr input, int inputSize, int keyAlias, void* vmhandle);


// ecc
/** Computes ECDSA-SHA1 signature with an ECC private key referenced by its alias.
 *	@param input			Input. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param output			This is a VM pointer referencing an output memory buffer in VM that will store the signature value upon return.
 *							See <code>vm_malloc</code>.
 *	@param outputSize		Size of output buffer in bytes.
 *	@param keyAlias			An alias used to reference the ECC private key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Size of the signature if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_ecc_sha1_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);

/** Verifies ECDSA-SHA1 signature with an ECC public key referenced by its alias.
 *	@param signature		The precomputed signature of the message. This will be verified.
 *							This is VM pointer. See <code>vm_malloc</code>.
 *	@param signatureSize	Size of signature in bytes.
 *	@param input			Input message. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param keyAlias			An alias used to reference the ECC public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_ecc_sha1_verify_alias(struct vmPtr signature, int signatureSize, struct vmPtr input, int inputSize, int keyAlias, void* vmhandle);

/** Computes ECDSA-SHA256 signature with an ECC private key referenced by its alias.
 *	@param input			Input. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *							Output size will be the same; no padding is performed
 *	@param output			This is a VM pointer referencing an output memory buffer in VM that will store the signature value upon return.
 *							See <code>vm_malloc</code>.
 *	@param outputSize		Size of output buffer in bytes.
 *	@param keyAlias			An alias used to reference the ECC private key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Size of the signature if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_ecc_sha256_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);

/** Verifies ECDSA-SHA256 signature with an ECC public key referenced by its alias.
 *	@param signature		The precomputed signature of the message. This will be verified.
 *							This is VM pointer. See <code>vm_malloc</code>.
 *	@param signatureSize	Size of signature in bytes.
 *	@param input			Input message. This is a VM pointer. See <code>vm_malloc</code>.
 *	@param inputSize		Input size in bytes.
 *	@param keyAlias			An alias used to reference the ECC public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_ecc_sha256_verify_alias(struct vmPtr signture, int signtureSize, struct vmPtr input, int inputSize, int keyAlias, void* vmhandle);

/** Generates ECC keypair in keystore, to be referenced by the given alias.
 *	@param keySize			Size of ECC Curve in bytes, which can be 32, 48, 66.
 *	@param keyAlias			An alias used to reference the ECC public key inside the keystore. See keystore's related functions.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_crypto_ecc_generate_keypair_alias(int keySize, int keyAlias, void* vmhandle);

#endif

/** Get Device fingerprint
 *	@param ppDfp		upon returned, *ppDfp will contain the pointer to the buffer containing the DFP, which can be freed after used
 *	@param pDfpSize		to store the actual size of device fingerprint's data stored in the buffer after returning
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_enc_dfp(unsigned char** ppDfp, int* pDfpSize, void* vmhandle);

/** Get iOS's Identifier for Advertisement. Only applicable for iOS.
 *	@param idfa			Pointer to an array of 16 bytes that will contain the Advertisement Id upon return.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_gid(unsigned char* idfa, void* vmhandle);

/** Get hashed device fingerprint (DFP). The hashed value is SHA256-length (32 bytes) array
 *	@param dfpHash		Pointer to an array of 32 bytes that will contain the DFP's hash upon return.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_dfp_hash(unsigned char* dfpHash, void* vmhandle);

/** Get hashed device fingerprint (DFP) Version 2. The hashed value is SHA256-length (32 bytes) array
 *	@param dfpHash		Pointer to an array of 32 bytes that will contain the DFP's hash upon return.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_dfp_hash_v2(unsigned char* dfpHash, void* vmhandle);

/** Get hashed device fingerprint (DFP) Version 3. The hashed value is SHA256-length (32 bytes) array
 *  @param dfpHash      Pointer to an array of 32 bytes that will contain the DFP's hash upon return.
 *  @param vmhandle     Pointer to the V-OS VM.
 *  @return             Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_dfp_hash_v3(unsigned char* dfpHash, void* vmhandle);

/** Get hashed device fingerprint (DFP) Version 4. The hashed value is SHA256-length (32 bytes) array
 *  @param dfpHash      Pointer to an array of 32 bytes that will contain the DFP's hash upon return.
 *  @param vmhandle     Pointer to the V-OS VM.
 *  @return             Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_dfp_hash_v4(unsigned char* dfpHash, void* vmhandle);

/** Get current version of device fingerprint
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Current DFP version if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_dfp_current_version(void* vmhandle);

/*--------------------obfuscated function names -----------------------------------------*/

#define vosInterface_crypto_UUID _16923bf24c2b4257b579fcc6bffd0844 //_bcb21e8ad872421aa4e3db03adb408e3


#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_crypto_new_name(idx) VOS_CONCAT_DEF(vosInterface_crypto_UUID, idx, 199901L)


#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

//	hash
#define vosInterface_crypto_sha1_impl vosInterface_crypto_new_name(01)
VOS_EXPORT int vosInterface_crypto_sha1_impl (struct vmPtr input, int inputSize, struct vmPtr output, void* vmhandle);
#define vosInterface_crypto_sha1_init_impl vosInterface_crypto_new_name(02)
VOS_EXPORT int vosInterface_crypto_sha1_init_impl (void* vmhandle);
#define vosInterface_crypto_sha1_update_impl vosInterface_crypto_new_name(03)
VOS_EXPORT int vosInterface_crypto_sha1_update_impl (struct vmPtr input, int inputSize, void* vmhandle);
#define vosInterface_crypto_sha1_final_impl vosInterface_crypto_new_name(04)
VOS_EXPORT int vosInterface_crypto_sha1_final_impl (struct vmPtr output, void* vmhandle);

#define vosInterface_crypto_sha256_impl vosInterface_crypto_new_name(05)
VOS_EXPORT int vosInterface_crypto_sha256_impl (struct vmPtr input, int inputSize, struct vmPtr output, void* vmhandle);
#define vosInterface_crypto_sha256_init_impl vosInterface_crypto_new_name(06)
VOS_EXPORT int vosInterface_crypto_sha256_init_impl (void* vmhandle);
#define vosInterface_crypto_sha256_update_impl vosInterface_crypto_new_name(07)
VOS_EXPORT int vosInterface_crypto_sha256_update_impl (struct vmPtr input, int inputSize, void* vmhandle);
#define vosInterface_crypto_sha256_final_impl vosInterface_crypto_new_name(08)
VOS_EXPORT int vosInterface_crypto_sha256_final_impl (struct vmPtr output, void* vmhandle);

//	hmac
#define vosInterface_crypto_hmac_sha1_impl vosInterface_crypto_new_name(09)
VOS_EXPORT int vosInterface_crypto_hmac_sha1_impl (struct vmPtr output, int outputSize, struct vmPtr key, int keySize, struct vmPtr msg, int msgSize, void* vmhandle);
#define vosInterface_crypto_hmac_sha1_alias_impl vosInterface_crypto_new_name(10)
VOS_EXPORT int vosInterface_crypto_hmac_sha1_alias_impl (struct vmPtr output, int outputSize, int keyAlias, struct vmPtr msg, int msgSize, void* vmhandle);
#define vosInterface_crypto_hmac_sha1_init_impl vosInterface_crypto_new_name(11)
VOS_EXPORT int vosInterface_crypto_hmac_sha1_init_impl (struct vmPtr key, int keySize, void* vmhandle);
#define vosInterface_crypto_hmac_sha1_init_alias_impl vosInterface_crypto_new_name(12)
VOS_EXPORT int vosInterface_crypto_hmac_sha1_init_alias_impl (int keyAlias, void* vmhandle);

#define vosInterface_crypto_hmac_sha256_impl vosInterface_crypto_new_name(13)
VOS_EXPORT int vosInterface_crypto_hmac_sha256_impl (struct vmPtr output, int outputSize, struct vmPtr key, int keySize, struct vmPtr msg, int msgSize, void* vmhandle);
#define vosInterface_crypto_hmac_sha256_alias_impl vosInterface_crypto_new_name(14)
VOS_EXPORT int vosInterface_crypto_hmac_sha256_alias_impl (struct vmPtr output, int outputSize, int keyAlias, struct vmPtr msg, int msgSize, void* vmhandle);
#define vosInterface_crypto_hmac_sha256_init_impl vosInterface_crypto_new_name(15)
VOS_EXPORT int vosInterface_crypto_hmac_sha256_init_impl (struct vmPtr key, int keySize, void* vmhandle);
#define vosInterface_crypto_hmac_sha256_init_alias_impl vosInterface_crypto_new_name(16)
VOS_EXPORT int vosInterface_crypto_hmac_sha256_init_alias_impl (int keyAlias, void* vmhandle);

#define vosInterface_crypto_hmac_update_impl vosInterface_crypto_new_name(17)
VOS_EXPORT int vosInterface_crypto_hmac_update_impl (struct vmPtr msg, int msgLen, void* vmhandle);
#define vosInterface_crypto_hmac_final_impl vosInterface_crypto_new_name(18)
VOS_EXPORT int vosInterface_crypto_hmac_final_impl (struct vmPtr output, int outputSize, void* vmhandle);

//	kdf
#define vosInterface_crypto_kdf_hmac_impl vosInterface_crypto_new_name(19)
VOS_EXPORT int vosInterface_crypto_kdf_hmac_impl (struct vmPtr inputKey, int inputkeySize, struct vmPtr inputMsg, int msgSize, struct vmPtr outputKey, int outputKeySize, int bitSizeIteration, void* vmhandle);
#define vosInterface_crypto_kdf_hmac_alias_impl vosInterface_crypto_new_name(20)
VOS_EXPORT int vosInterface_crypto_kdf_hmac_alias_impl (int keyAlias, struct vmPtr inputMsg, int msgSize, struct vmPtr outputKey, int outputKeySize, int bitSizeIteration, void* vmhandle);
#define vosInterface_crypto_kdf_pbkdf2_impl vosInterface_crypto_new_name(21)
VOS_EXPORT int vosInterface_crypto_kdf_pbkdf2_impl (struct vmPtr output, struct vmPtr pwd, int pwdSize, struct vmPtr salt, int saltSize, int iterations, int keySize, void* vmhandle);
#define vosInterface_crypto_kdf_pbkdf2_sha256_impl vosInterface_crypto_new_name(256)
int vosInterface_crypto_kdf_pbkdf2_sha256_impl (struct vmPtr output, struct vmPtr pwd, int pwdSize, struct vmPtr salt, int saltSize, int iterations, int keySize, void* vmhandle);

//	rng
#define vosInterface_crypto_rng_init_impl vosInterface_crypto_new_name(22)
VOS_EXPORT int vosInterface_crypto_rng_init_impl (void* vmhandle);
#define vosInterface_crypto_rng_bytes_impl vosInterface_crypto_new_name(23)
VOS_EXPORT int vosInterface_crypto_rng_bytes_impl (struct vmPtr buffer, int bufferSize, void* vmhandle);

//	aes
#define vosInterface_crypto_aes_cbc_enc_impl vosInterface_crypto_new_name(24)
VOS_EXPORT int vosInterface_crypto_aes_cbc_enc_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_aes_cbc_dec_impl vosInterface_crypto_new_name(25)
VOS_EXPORT int vosInterface_crypto_aes_cbc_dec_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_aes_cbc_enc_alias_impl vosInterface_crypto_new_name(26)
VOS_EXPORT int vosInterface_crypto_aes_cbc_enc_alias_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_aes_cbc_dec_alias_impl vosInterface_crypto_new_name(27)
VOS_EXPORT int vosInterface_crypto_aes_cbc_dec_alias_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

#define vosInterface_crypto_aes_ecb_enc_impl vosInterface_crypto_new_name(28)
VOS_EXPORT int vosInterface_crypto_aes_ecb_enc_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_aes_ecb_dec_impl vosInterface_crypto_new_name(29)
VOS_EXPORT int vosInterface_crypto_aes_ecb_dec_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_aes_ecb_enc_alias_impl vosInterface_crypto_new_name(30)
VOS_EXPORT int vosInterface_crypto_aes_ecb_enc_alias_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_aes_ecb_dec_alias_impl vosInterface_crypto_new_name(31)
VOS_EXPORT int vosInterface_crypto_aes_ecb_dec_alias_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

#define vosInterface_crypto_aes_batch_init_impl vosInterface_crypto_new_name(32)
VOS_EXPORT int vosInterface_crypto_aes_batch_init_impl (struct vmPtr key, int keySize, struct vmPtr iv, int mode, void* vmhandle);
#define vosInterface_crypto_aes_batch_init_alias_impl vosInterface_crypto_new_name(33)
VOS_EXPORT int vosInterface_crypto_aes_batch_init_alias_impl (int keyAlias, struct vmPtr iv, int mode, void* vmhandle);
#define vosInterface_crypto_aes_batch_cbc_enc_update_impl vosInterface_crypto_new_name(34)
VOS_EXPORT int vosInterface_crypto_aes_batch_cbc_enc_update_impl (struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle);
#define vosInterface_crypto_aes_batch_cbc_dec_update_impl vosInterface_crypto_new_name(35)
VOS_EXPORT int vosInterface_crypto_aes_batch_cbc_dec_update_impl (struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle);
#define vosInterface_crypto_aes_batch_ecb_enc_update_impl vosInterface_crypto_new_name(36)
VOS_EXPORT int vosInterface_crypto_aes_batch_ecb_enc_update_impl (struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle);
#define vosInterface_crypto_aes_batch_ecb_dec_update_impl vosInterface_crypto_new_name(37)
VOS_EXPORT int vosInterface_crypto_aes_batch_ecb_dec_update_impl (struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle);

#define vosInterface_crypto_aes_wb_cbc_enc_impl vosInterface_crypto_new_name(38)
VOS_EXPORT int vosInterface_crypto_aes_wb_cbc_enc_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void *vmhandle);
#define vosInterface_crypto_aes_wb_cbc_dec_impl vosInterface_crypto_new_name(39)
VOS_EXPORT int vosInterface_crypto_aes_wb_cbc_dec_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void *vmhandle);

#define vosInterface_crypto_aes_ccm_enc_impl vosInterface_crypto_new_name(118)
VOS_EXPORT int vosInterface_crypto_aes_ccm_enc_impl (struct vmPtr plain, struct vmPtr buffer, struct vmPtr key, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);
#define vosInterface_crypto_aes_ccm_dec_impl vosInterface_crypto_new_name(119)
VOS_EXPORT int vosInterface_crypto_aes_ccm_dec_impl (struct vmPtr cipher, struct vmPtr buffer, struct vmPtr key, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);
#define vosInterface_crypto_aes_ccm_enc_alias_impl vosInterface_crypto_new_name(120)
VOS_EXPORT int vosInterface_crypto_aes_ccm_enc_alias_impl (struct vmPtr plain, struct vmPtr buffer, int keyAlias, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);
#define vosInterface_crypto_aes_ccm_dec_alias_impl vosInterface_crypto_new_name(121)
VOS_EXPORT int vosInterface_crypto_aes_ccm_dec_alias_impl (struct vmPtr cipher, struct vmPtr buffer, int keyAlias, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

#define vosInterface_crypto_aes_gcm_enc_impl vosInterface_crypto_new_name(122)
VOS_EXPORT int vosInterface_crypto_aes_gcm_enc_impl (struct vmPtr plain, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);
#define vosInterface_crypto_aes_gcm_dec_impl vosInterface_crypto_new_name(123)
VOS_EXPORT int vosInterface_crypto_aes_gcm_dec_impl (struct vmPtr cipher, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);
#define vosInterface_crypto_aes_gcm_enc_alias_impl vosInterface_crypto_new_name(124)
VOS_EXPORT int vosInterface_crypto_aes_gcm_enc_alias_impl (struct vmPtr plain, struct vmPtr buffer, int keyAlias, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);
#define vosInterface_crypto_aes_gcm_dec_alias_impl vosInterface_crypto_new_name(125)
VOS_EXPORT int vosInterface_crypto_aes_gcm_dec_alias_impl (struct vmPtr cipher, struct vmPtr buffer, int keyAlias, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle);

#define vosInterface_crypto_aes_kw_wrap_impl vosInterface_crypto_new_name(126)
VOS_EXPORT int vosInterface_crypto_aes_kw_wrap_impl (struct vmPtr keyData, int keyDataSize, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle);
#define vosInterface_crypto_aes_kw_unwrap_impl vosInterface_crypto_new_name(127)
VOS_EXPORT int vosInterface_crypto_aes_kw_unwrap_impl (struct vmPtr wrappedKeyData, int wrappedKeyDataSize, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle);
#define vosInterface_crypto_aes_kw_wrap_alias_impl vosInterface_crypto_new_name(128)
VOS_EXPORT int vosInterface_crypto_aes_kw_wrap_alias_impl (struct vmPtr keyData, int keyDataSize, struct vmPtr buffer, int kwkAlias, void* vmhandle);
#define vosInterface_crypto_aes_kw_unwrap_alias_impl vosInterface_crypto_new_name(129)
VOS_EXPORT int vosInterface_crypto_aes_kw_unwrap_alias_impl (struct vmPtr wrappedKeyData, int wrappedKeyDataSize, struct vmPtr buffer, int kwkAlias, void* vmhandle);
#define vosInterface_crypto_aes_kw_wrap_keyalias_impl vosInterface_crypto_new_name(130)
VOS_EXPORT int vosInterface_crypto_aes_kw_wrap_keyalias_impl (int keyAlias, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle);
#define vosInterface_crypto_aes_kw_wrap_keyalias_alias_impl vosInterface_crypto_new_name(131)
VOS_EXPORT int vosInterface_crypto_aes_kw_wrap_keyalias_alias_impl (int keyAlias, struct vmPtr buffer, int kwkAlias, void* vmhandle);

// des3
#define vosInterface_crypto_des3_cbc_enc_impl vosInterface_crypto_new_name(40)
VOS_EXPORT int vosInterface_crypto_des3_cbc_enc_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_des3_cbc_dec_impl vosInterface_crypto_new_name(41)
VOS_EXPORT int vosInterface_crypto_des3_cbc_dec_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_des3_cbc_enc_alias_impl vosInterface_crypto_new_name(42)
VOS_EXPORT int vosInterface_crypto_des3_cbc_enc_alias_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);
#define vosInterface_crypto_des3_cbc_dec_alias_impl vosInterface_crypto_new_name(43)
VOS_EXPORT int vosInterface_crypto_des3_cbc_dec_alias_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle);

#define vosInterface_crypto_des3_batch_init_impl vosInterface_crypto_new_name(44)
VOS_EXPORT int vosInterface_crypto_des3_batch_init_impl (struct vmPtr key, struct vmPtr iv, int desEncDec, void* vmhandle);
#define vosInterface_crypto_des3_batch_init_alias_impl vosInterface_crypto_new_name(45)
VOS_EXPORT int vosInterface_crypto_des3_batch_init_alias_impl (int keyAlias, struct vmPtr iv, int desEncDec, void* vmhandle);
#define vosInterface_crypto_des3_batch_cbc_enc_update_impl vosInterface_crypto_new_name(46)
VOS_EXPORT int vosInterface_crypto_des3_batch_cbc_enc_update_impl (struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle);
#define vosInterface_crypto_des3_batch_cbc_dec_update_impl vosInterface_crypto_new_name(47)
VOS_EXPORT int vosInterface_crypto_des3_batch_cbc_dec_update_impl (struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle);


// rsa
#define vosInterface_crypto_rsa_pub_enc_alias_impl vosInterface_crypto_new_name(48)
VOS_EXPORT int vosInterface_crypto_rsa_pub_enc_alias_impl (struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, void* vmhandle);
#define vosInterface_crypto_rsa_pri_dec_alias_impl vosInterface_crypto_new_name(49)
VOS_EXPORT int vosInterface_crypto_rsa_pri_dec_alias_impl (struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int bufferSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_rsa_oaep_enc_alias_impl vosInterface_crypto_new_name(50)
VOS_EXPORT int vosInterface_crypto_rsa_oaep_enc_alias_impl (struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, struct vmPtr param, int pLen, int keyAlias, void* vmhandle);
#define vosInterface_crypto_rsa_oaep_dec_alias_impl vosInterface_crypto_new_name(51)
VOS_EXPORT int vosInterface_crypto_rsa_oaep_dec_alias_impl (struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, struct vmPtr param, int pLen, int keyAlias, void* vmhandle);

#define vosInterface_crypto_rsa_sha1_sign_alias_impl vosInterface_crypto_new_name(52)
VOS_EXPORT int vosInterface_crypto_rsa_sha1_sign_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_rsa_sha1_verify_alias_impl vosInterface_crypto_new_name(53)
VOS_EXPORT int vosInterface_crypto_rsa_sha1_verify_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_rsa_sha256_sign_alias_impl vosInterface_crypto_new_name(54)
VOS_EXPORT int vosInterface_crypto_rsa_sha256_sign_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_rsa_sha256_verify_alias_impl vosInterface_crypto_new_name(55)
VOS_EXPORT int vosInterface_crypto_rsa_sha256_verify_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);


/*
 *Get Device fingerprint
 *Params:
 *-ppDfp: upon returned, *ppDfp will contain the pointer to the buffer containing the DFP, which can be freed after used
 *-pDfpSize: to store the actual size of device fingerprint's data stored in the buffer after returning
 */
#define vosInterface_sys_get_enc_dfp_impl vosInterface_crypto_new_name(56)
VOS_EXPORT int vosInterface_sys_get_enc_dfp_impl (unsigned char** ppDfp, int* pDfpSize, void* vmhandle);

/*
 *Get Identifier for Advertisement
 */
#define vosInterface_sys_get_gid_impl vosInterface_crypto_new_name(57)
VOS_EXPORT int vosInterface_sys_get_gid_impl (unsigned char* idfa, void* vmhandle);


// ecc
#define vosInterface_crypto_ecc_sha1_sign_alias_impl vosInterface_crypto_new_name(540)
VOS_EXPORT int vosInterface_crypto_ecc_sha1_sign_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_ecc_sha1_verify_alias_impl vosInterface_crypto_new_name(541)
VOS_EXPORT int vosInterface_crypto_ecc_sha1_verify_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_ecc_sha256_sign_alias_impl vosInterface_crypto_new_name(542)
VOS_EXPORT int vosInterface_crypto_ecc_sha256_sign_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_ecc_sha256_verify_alias_impl vosInterface_crypto_new_name(543)
VOS_EXPORT int vosInterface_crypto_ecc_sha256_verify_alias_impl (struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle);
#define vosInterface_crypto_ecc_generate_keypair_alias_impl vosInterface_crypto_new_name(560)
VOS_EXPORT int vosInterface_crypto_ecc_generate_keypair_alias_impl (int keySize, int keyAlias, void* vmhandle);

#define vosInterface_sys_get_dfp_hash_impl vosInterface_crypto_new_name(113)
VOS_EXPORT int vosInterface_sys_get_dfp_hash_impl(unsigned char* dfpHash, void* vmhandle);

#define vosInterface_sys_get_dfp_hash_v2_impl vosInterface_crypto_new_name(115)
VOS_EXPORT int vosInterface_sys_get_dfp_hash_v2_impl(unsigned char* dfpHash, void* vmhandle);

#define vosInterface_sys_get_dfp_hash_v3_impl vosInterface_crypto_new_name(116)
VOS_EXPORT int vosInterface_sys_get_dfp_hash_v3_impl(unsigned char* dfpHash, void* vmhandle);

#define vosInterface_sys_get_dfp_hash_v4_impl vosInterface_crypto_new_name(117)
VOS_EXPORT int vosInterface_sys_get_dfp_hash_v4_impl(unsigned char* dfpHash, void* vmhandle);

#define vosInterface_sys_get_dfp_current_version_impl vosInterface_crypto_new_name(114)
VOS_EXPORT int vosInterface_sys_get_dfp_current_version_impl(void* vmhandle);

#ifdef __cplusplus
} //extern "C" {
#endif

/*---------------inline implementation ------------*/


//	hash

#ifndef NO_CRYPTO_API

VOS_API int vosInterface_crypto_sha1(struct vmPtr input, int inputSize, struct vmPtr output, void* vmhandle){

    return vosInterface_crypto_sha1_impl(input, inputSize, output, vmhandle);
};
VOS_API int vosInterface_crypto_sha1_init(void* vmhandle){

    return vosInterface_crypto_sha1_init_impl(vmhandle);
};
VOS_API int vosInterface_crypto_sha1_update(struct vmPtr input, int inputSize, void* vmhandle){

    return vosInterface_crypto_sha1_update_impl(input, inputSize, vmhandle);
};
VOS_API int vosInterface_crypto_sha1_final(struct vmPtr output, void* vmhandle){

    return vosInterface_crypto_sha1_final_impl(output, vmhandle);
};

VOS_API int vosInterface_crypto_sha256(struct vmPtr input, int inputSize, struct vmPtr output, void* vmhandle){

    return vosInterface_crypto_sha256_impl(input, inputSize, output, vmhandle);
};
VOS_API int vosInterface_crypto_sha256_init(void* vmhandle){

    return vosInterface_crypto_sha256_init_impl(vmhandle);
};
VOS_API int vosInterface_crypto_sha256_update(struct vmPtr input, int inputSize, void* vmhandle){

    return vosInterface_crypto_sha256_update_impl(input, inputSize, vmhandle);
};
VOS_API int vosInterface_crypto_sha256_final(struct vmPtr output, void* vmhandle){

    return vosInterface_crypto_sha256_final_impl(output, vmhandle);
};

//	hmac
VOS_API int vosInterface_crypto_hmac_sha1(struct vmPtr output, int outputSize, struct vmPtr key, int keySize, struct vmPtr msg, int msgSize, void* vmhandle){

    return vosInterface_crypto_hmac_sha1_impl(output, outputSize, key, keySize, msg, msgSize, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_sha1_alias(struct vmPtr output, int outputSize, int keyAlias, struct vmPtr msg, int msgSize, void* vmhandle){

    return vosInterface_crypto_hmac_sha1_alias_impl(output, outputSize, keyAlias, msg, msgSize, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_sha1_init(struct vmPtr key, int keySize, void* vmhandle){

    return vosInterface_crypto_hmac_sha1_init_impl(key, keySize, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_sha1_init_alias(int keyAlias, void* vmhandle){

    return vosInterface_crypto_hmac_sha1_init_alias_impl(keyAlias, vmhandle);
};

VOS_API int vosInterface_crypto_hmac_sha256(struct vmPtr output, int outputSize, struct vmPtr key, int keySize, struct vmPtr msg, int msgSize, void* vmhandle){

    return vosInterface_crypto_hmac_sha256_impl(output, outputSize, key, keySize, msg, msgSize, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_sha256_alias(struct vmPtr output, int outputSize, int keyAlias, struct vmPtr msg, int msgSize, void* vmhandle){

    return vosInterface_crypto_hmac_sha256_alias_impl(output, outputSize, keyAlias, msg, msgSize, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_sha256_init(struct vmPtr key, int keySize, void* vmhandle){

    return vosInterface_crypto_hmac_sha256_init_impl(key, keySize, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_sha256_init_alias(int keyAlias, void* vmhandle){

    return vosInterface_crypto_hmac_sha256_init_alias_impl(keyAlias, vmhandle);
};

VOS_API int vosInterface_crypto_hmac_update(struct vmPtr msg, int msgLen, void* vmhandle){

    return vosInterface_crypto_hmac_update_impl(msg, msgLen, vmhandle);
};
VOS_API int vosInterface_crypto_hmac_final(struct vmPtr output, int outputSize, void* vmhandle){

    return vosInterface_crypto_hmac_final_impl(output, outputSize, vmhandle);
};

//	kdf
VOS_API int vosInterface_crypto_kdf_hmac(struct vmPtr inputKey, int inputkeySize, struct vmPtr inputMsg, int msgSize, struct vmPtr outputKey, int outputKeySize, int bitSizeIteration, void* vmhandle){

    return vosInterface_crypto_kdf_hmac_impl(inputKey, inputkeySize, inputMsg, msgSize, outputKey, outputKeySize, bitSizeIteration, vmhandle);
};
VOS_API int vosInterface_crypto_kdf_hmac_alias(int keyAlias, struct vmPtr inputMsg, int msgSize, struct vmPtr outputKey, int outputKeySize, int bitSizeIteration, void* vmhandle){

    return vosInterface_crypto_kdf_hmac_alias_impl(keyAlias, inputMsg, msgSize, outputKey, outputKeySize, bitSizeIteration, vmhandle);
};
VOS_API int vosInterface_crypto_kdf_pbkdf2(struct vmPtr output, struct vmPtr pwd, int pwdSize, struct vmPtr salt, int saltSize, int iterations, int keySize, void* vmhandle){

    return vosInterface_crypto_kdf_pbkdf2_impl(output, pwd, pwdSize, salt, saltSize, iterations, keySize, vmhandle);
};
VOS_API int vosInterface_crypto_kdf_pbkdf2_sha256(struct vmPtr output, struct vmPtr pwd, int pwdSize, struct vmPtr salt, int saltSize, int iterations, int keySize, void* vmhandle){

    return vosInterface_crypto_kdf_pbkdf2_sha256_impl(output, pwd, pwdSize, salt, saltSize, iterations, keySize, vmhandle);
};

//	rng
VOS_API int vosInterface_crypto_rng_init(void* vmhandle){

    return vosInterface_crypto_rng_init_impl(vmhandle);
};
VOS_API int vosInterface_crypto_rng_bytes(struct vmPtr buffer, int bufferSize, void* vmhandle){

    return vosInterface_crypto_rng_bytes_impl(buffer, bufferSize, vmhandle);
};

//	aes
VOS_API int vosInterface_crypto_aes_cbc_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_cbc_enc_impl(plain, plaintextSize, buffer, key, keySize, iv, vmhandle);
};
VOS_API int vosInterface_crypto_aes_cbc_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_cbc_dec_impl(cipher, ciphertextSize, buffer, key, keySize, iv, vmhandle);
};
VOS_API int vosInterface_crypto_aes_cbc_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_cbc_enc_alias_impl(plain, plaintextSize, buffer, keyAlias, iv, vmhandle);
};
VOS_API int vosInterface_crypto_aes_cbc_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_cbc_dec_alias_impl(cipher, ciphertextSize, buffer, keyAlias, iv, vmhandle);
};

VOS_API int vosInterface_crypto_aes_ecb_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_ecb_enc_impl(plain, plaintextSize, buffer, key, keySize, iv, vmhandle);
};
VOS_API int vosInterface_crypto_aes_ecb_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_ecb_dec_impl(cipher, ciphertextSize, buffer, key, keySize, iv, vmhandle);
};
VOS_API int vosInterface_crypto_aes_ecb_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_ecb_enc_alias_impl(plain, plaintextSize, buffer, keyAlias, iv, vmhandle);
};
VOS_API int vosInterface_crypto_aes_ecb_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle){

    return vosInterface_crypto_aes_ecb_dec_alias_impl(cipher, ciphertextSize, buffer, keyAlias, iv, vmhandle);
};

VOS_API int vosInterface_crypto_aes_batch_init(struct vmPtr key, int keySize, struct vmPtr iv, int mode, void* vmhandle){

    return vosInterface_crypto_aes_batch_init_impl(key, keySize, iv, mode, vmhandle);
};
VOS_API int vosInterface_crypto_aes_batch_init_alias(int keyAlias, struct vmPtr iv, int mode, void* vmhandle){

    return vosInterface_crypto_aes_batch_init_alias_impl(keyAlias, iv, mode, vmhandle);
};
VOS_API int vosInterface_crypto_aes_batch_cbc_enc_update(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle){

    return vosInterface_crypto_aes_batch_cbc_enc_update_impl(plainText, plainTextSize, cipherText, vmhandle);
};
VOS_API int vosInterface_crypto_aes_batch_cbc_dec_update(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle){

    return vosInterface_crypto_aes_batch_cbc_dec_update_impl(cipherText, cipherTextSize, plainText, vmhandle);
};
VOS_API int vosInterface_crypto_aes_batch_ecb_enc_update(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle){

    return vosInterface_crypto_aes_batch_ecb_enc_update_impl(plainText, plainTextSize, cipherText, vmhandle);
};
VOS_API int vosInterface_crypto_aes_batch_ecb_dec_update(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle){

    return vosInterface_crypto_aes_batch_ecb_dec_update_impl(cipherText, cipherTextSize, plainText, vmhandle);
};

VOS_API
int vosInterface_crypto_aes_wb_cbc_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void *vmhandle) {

    return vosInterface_crypto_aes_wb_cbc_enc_impl(plain, plaintextSize, buffer, key, keySize, iv, vmhandle);
}

VOS_API
int vosInterface_crypto_aes_wb_cbc_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, int keySize, struct vmPtr iv, void *vmhandle) {

    return vosInterface_crypto_aes_wb_cbc_dec_impl(cipher, ciphertextSize, buffer, key, keySize, iv, vmhandle);
}

VOS_API int vosInterface_crypto_aes_ccm_enc(struct vmPtr plain, struct vmPtr buffer, struct vmPtr key, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_ccm_enc_impl(plain, buffer, key, nonce, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};
VOS_API int vosInterface_crypto_aes_ccm_dec(struct vmPtr cipher, struct vmPtr buffer, struct vmPtr key, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_ccm_dec_impl(cipher, buffer, key, nonce, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};
VOS_API int vosInterface_crypto_aes_ccm_enc_alias(struct vmPtr plain, struct vmPtr buffer, int keyAlias, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_ccm_enc_alias_impl(plain, buffer, keyAlias, nonce, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};
VOS_API int vosInterface_crypto_aes_ccm_dec_alias(struct vmPtr cipher, struct vmPtr buffer, int keyAlias, struct vmPtr nonce, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_ccm_dec_alias_impl(cipher, buffer, keyAlias, nonce, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};

VOS_API int vosInterface_crypto_aes_gcm_enc(struct vmPtr plain, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_gcm_enc_impl(plain, buffer, key, iv, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};
VOS_API int vosInterface_crypto_aes_gcm_dec(struct vmPtr cipher, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_gcm_dec_impl(cipher, buffer, key, iv, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};
VOS_API int vosInterface_crypto_aes_gcm_enc_alias(struct vmPtr plain, struct vmPtr buffer, int keyAlias, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_gcm_enc_alias_impl(plain, buffer, keyAlias, iv, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};
VOS_API int vosInterface_crypto_aes_gcm_dec_alias(struct vmPtr cipher, struct vmPtr buffer, int keyAlias, struct vmPtr iv, struct vmPtr authTag, int sizeAuthTag, struct vmPtr authIn, struct vmPtr szBuffer, void* vmhandle){

    return vosInterface_crypto_aes_gcm_dec_alias_impl(cipher, buffer, keyAlias, iv, authTag, sizeAuthTag, authIn, szBuffer, vmhandle);
};

VOS_API int vosInterface_crypto_aes_kw_wrap(struct vmPtr keyData, int keyDataSize, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle){

    return vosInterface_crypto_aes_kw_wrap_impl(keyData, keyDataSize, buffer, kwk, kwkSize, vmhandle);
};
VOS_API int vosInterface_crypto_aes_kw_unwrap(struct vmPtr wrappedKeyData, int wrappedKeyDataSize, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle){

    return vosInterface_crypto_aes_kw_unwrap_impl(wrappedKeyData, wrappedKeyDataSize, buffer, kwk, kwkSize, vmhandle);
};
VOS_API int vosInterface_crypto_aes_kw_wrap_alias(struct vmPtr keyData, int keyDataSize, struct vmPtr buffer, int kwkAlias, void* vmhandle){

    return vosInterface_crypto_aes_kw_wrap_alias_impl(keyData, keyDataSize, buffer, kwkAlias, vmhandle);
};
VOS_API int vosInterface_crypto_aes_kw_unwrap_alias(struct vmPtr wrappedKeyData, int wrappedKeyDataSize, struct vmPtr buffer, int kwkAlias, void* vmhandle){

    return vosInterface_crypto_aes_kw_unwrap_alias_impl(wrappedKeyData, wrappedKeyDataSize, buffer, kwkAlias, vmhandle);
};
VOS_API int vosInterface_crypto_aes_kw_wrap_keyalias(int keyAlias, struct vmPtr buffer, struct vmPtr kwk, int kwkSize, void* vmhandle){

    return vosInterface_crypto_aes_kw_wrap_keyalias_impl(keyAlias, buffer, kwk, kwkSize, vmhandle);
};
VOS_API int vosInterface_crypto_aes_kw_wrap_keyalias_alias(int keyAlias, struct vmPtr buffer, int kwkAlias, void* vmhandle){

    return vosInterface_crypto_aes_kw_wrap_keyalias_alias_impl(keyAlias, buffer, kwkAlias, vmhandle);
};

//des3
VOS_API
int vosInterface_crypto_des3_cbc_enc(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, void* vmhandle) {

    return vosInterface_crypto_des3_cbc_enc_impl(plain, plaintextSize, buffer, key, iv, vmhandle);
}
VOS_API
int vosInterface_crypto_des3_cbc_dec(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, struct vmPtr key, struct vmPtr iv, void* vmhandle) {

    return vosInterface_crypto_des3_cbc_dec_impl(cipher, ciphertextSize, buffer, key, iv, vmhandle);
}
VOS_API
int vosInterface_crypto_des3_cbc_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle) {

    return vosInterface_crypto_des3_cbc_enc_alias_impl(plain, plaintextSize, buffer, keyAlias, iv, vmhandle);
}
VOS_API
int vosInterface_crypto_des3_cbc_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int keyAlias, struct vmPtr iv, void* vmhandle) {

    return vosInterface_crypto_des3_cbc_dec_alias_impl(cipher, ciphertextSize, buffer, keyAlias, iv, vmhandle);
}

VOS_API
int vosInterface_crypto_des3_batch_init(struct vmPtr key, struct vmPtr iv, int desEncDec, void* vmhandle) {

    return vosInterface_crypto_des3_batch_init_impl(key, iv, desEncDec, vmhandle);
}
VOS_API
int vosInterface_crypto_des3_batch_init_alias(int keyAlias, struct vmPtr iv, int desEncDec, void* vmhandle) {

    return vosInterface_crypto_des3_batch_init_alias_impl(keyAlias, iv, desEncDec, vmhandle);
}
VOS_API
int vosInterface_crypto_des3_batch_cbc_enc_update(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, void* vmhandle) {

    return vosInterface_crypto_des3_batch_cbc_enc_update_impl(plainText, plainTextSize, cipherText, vmhandle);
}
VOS_API
int vosInterface_crypto_des3_batch_cbc_dec_update(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, void* vmhandle) {

    return vosInterface_crypto_des3_batch_cbc_dec_update_impl(cipherText, cipherTextSize, plainText, vmhandle);
}

// rsa
VOS_API
int vosInterface_crypto_rsa_pub_enc_alias(struct vmPtr plain, int plaintextSize, struct vmPtr buffer, int keyAlias, void* vmhandle) {

    return vosInterface_crypto_rsa_pub_enc_alias_impl(plain, plaintextSize, buffer, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_pri_dec_alias(struct vmPtr cipher, int ciphertextSize, struct vmPtr buffer, int bufferSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_pri_dec_alias_impl(cipher, ciphertextSize, buffer, bufferSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_oaep_enc_alias(struct vmPtr plainText, int plainTextSize, struct vmPtr cipherText, struct vmPtr param, int pLen, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_oaep_enc_alias_impl(plainText, plainTextSize, cipherText, param, pLen, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_oaep_dec_alias(struct vmPtr cipherText, int cipherTextSize, struct vmPtr plainText, struct vmPtr param, int pLen, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_oaep_dec_alias_impl(cipherText, cipherTextSize, plainText, param, pLen, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_sha1_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_sha1_sign_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_sha1_verify_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_sha1_verify_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_sha256_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_sha256_sign_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_rsa_sha256_verify_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_rsa_sha256_verify_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}

// ecc
VOS_API
int vosInterface_crypto_ecc_sha1_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_ecc_sha1_sign_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_ecc_sha1_verify_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_ecc_sha1_verify_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_ecc_sha256_sign_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_ecc_sha256_sign_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_ecc_sha256_verify_alias(struct vmPtr input, int inputSize, struct vmPtr output, int outputSize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_ecc_sha256_verify_alias_impl(input, inputSize, output, outputSize, keyAlias, vmhandle);
}
VOS_API
int vosInterface_crypto_ecc_generate_keypair_alias(int keySize, int keyAlias, void* vmhandle){

    return vosInterface_crypto_ecc_generate_keypair_alias_impl(keySize, keyAlias, vmhandle);
}
#endif
//begin LHQ

VOS_API int vosInterface_sys_get_enc_dfp(unsigned char** ppDfp, int* pDfpSize, void* vmhandle)
{
    return vosInterface_sys_get_enc_dfp_impl(ppDfp, pDfpSize, vmhandle);
}

VOS_API
int vosInterface_sys_get_gid(unsigned char* idfa, void* vmhandle)
{
    return vosInterface_sys_get_gid_impl(idfa, vmhandle);
}

VOS_API
int vosInterface_sys_get_dfp_hash(unsigned char* dfpHash, void* vmhandle)
{
    return vosInterface_sys_get_dfp_hash_impl(dfpHash, vmhandle);
}

VOS_API
int vosInterface_sys_get_dfp_hash_v2(unsigned char* dfpHash, void* vmhandle)
{
    return vosInterface_sys_get_dfp_hash_v2_impl(dfpHash, vmhandle);
}

VOS_API
int vosInterface_sys_get_dfp_hash_v3(unsigned char* dfpHash, void* vmhandle)
{
    return vosInterface_sys_get_dfp_hash_v3_impl(dfpHash, vmhandle);
}

VOS_API
int vosInterface_sys_get_dfp_hash_v4(unsigned char* dfpHash, void* vmhandle)
{
    return vosInterface_sys_get_dfp_hash_v4_impl(dfpHash, vmhandle);
}

VOS_API
int vosInterface_sys_get_dfp_current_version(void* vmhandle)
{
	return vosInterface_sys_get_dfp_current_version_impl(vmhandle);
}

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif // vosInterface_crypto_h
