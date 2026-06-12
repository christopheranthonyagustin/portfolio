/**	@file vosInterface_keystore.h
 *
 *	Created by Roddy Kok on 30/1/15.
 *	Copyright (c) 2015 V-Key Pte Ltd. All rights reserved.
 *
 *	Contact us with any questions or comments.
 *
 *	http://www.v-key.com
 *
 */

#ifndef vosInterface_keystore_h
#define vosInterface_keystore_h

#include "vmPtr.h"

#include "vosInterface.h"

#ifndef NO_CRYPTO_API

/*----------------------interface declaration-------------------------------------------*/
/** Load and construct the keystore from the encrypted, binary representation of the
 *	keystore.
 *	@param pwd				Password used to protect the encrypted keystore. Password must be stored in a VM buffer allocated via <code>vm_malloc</code>.
 *	@param pwdSize			Length of password.
 *	@param keyStore			Buffer storing the encrypted keystore. See <code>vm_malloc</code>
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_load(struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);

/** Serialize the keystore and encrypt the resulting binary with a password-based mechanism.
 *	@param pwd				Password used to protect the encrypted keystore. Password must be stored in a VM buffer allocated via <code>vm_malloc</code>.
 *	@param pwdSize			Length of password.
 *	@param keyStore			Buffer that will be used to store the encrypted keystore upon return. 
 *							See <code>vm_malloc</code> and <code>vosInterface_keystore_serial_size</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_save(struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);

/** Remove all keys from the keystore.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_clear(void* vmhandle);

/** Get the required size of the buffer to store the encrypted keystore via <code>vosInterface_keystore_save</code> function.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Required buffer size if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_serial_size(void* vmhandle);

/**	This method imports keys into the V-OS keystore. If the keystore is not empty,
 *	new keys to be imported will be added in addition to the existing keys
 *	@param pwd				Password used to protect the encrypted keys. Password must be stored in a VM buffer allocated via <code>vm_malloc</code>.
 *	@param pwdSize			Length of password.
 *	@param keyStore			Buffer storing the encrypted keys. See <code>vm_malloc</code> and <code>vosInterface_keystore_export_keys</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_import_keys(struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);

/** This method exports keys in the V-OS keystore.
 *	@param aliases			Buffer containing an array of aliases of the keys to be exported. See <code>vm_malloc</code>.
 *	@param nKeys			Number of keys to be exported.
 *	@param pwd				Password used to protect the encrypted keys. Password must be stored in a VM buffer allocated via <code>vm_malloc</code>.
 *	@param pwdSize			Length of password.
 *	@param keyStore			Buffer that will be used to store the encrypted keys upon return.
 *							See <code>vm_malloc</code> and <code>vosInterface_keystore_keys_serial_size</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_export_keys(struct vmPtr aliases, int nKeys, struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);

/** Get the required size of the buffer to store the encrypted keys via <code>vosInterface_keystore_export_keys</code> function.
 *	@param aliases			Buffer containing an array of aliases of the keys to be exported. See <code>vm_malloc</code>.
 *	@param nKeys			Number of keys to be exported.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Required buffer size if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_keys_serial_size(struct vmPtr aliases, int nKeys, void* vmhandle);

/** Get number of keys in keystore.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Number of keys if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_count(void* vmhandle);

/** Check whether a key with the specified alias exists in the keystore or not.
 *	@param keyAlias			The key alias to check.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Nonzero value if the key alias exists, zero otherwise.
 */
VOS_API int vosInterface_keystore_check_key(int keyAlias, void* vmhandle);

/**
 * Add the given encoded key to the keystore.
 *	@param keyAlias			The alias given to the key to be added.
 *	@param algo				The algorithm type of the key. Must be one of the <code>Algorithm</code> values defined in vosInterfaceConst.h.
 *	@param key				Buffer containing the encoded key. See <code>vm_malloc</code>.
 *	@param keySize			Size in bytes of buffer pointed by <code>key</code>.
 *	@param keyType			The type of the key. Must be one of the <code>TypeOfKey</code> values defined in vosInterfaceConst.h.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return Returns the size of keystore after successfully adding the given key entry.
 *	An negative error code is returned, if the key cannot be inserted, because
 *	KEYSTORE_MAX_SIZE_REACHED (the pre-configured maximal size of the keystore has already been reached),
 *	or KEYSTORE_ALIAS_ALREADY_EXISTS (the key alias already exists in the keystore).
 */
VOS_API int vosInterface_keystore_add_key(int keyAlias, int algo, struct vmPtr key, int keySize, int keyType, void* vmhandle);

/** Delete a key with the specified alias from the keystore.
 *	@param keyAlias			The key alias to delete.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_del_key(int keyAlias, void* vmhandle);

/** Deactivate a key with the specified alias from the keystore. Deactivated key cannot be used in future.
 *	@param keyAlias			The key alias to deactive.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_deactivate_key(int keyAlias, void* vmhandle);

/** Transit the state of a key with the given alias from PRE_ACTIVATION, ACTIVE or DEACTIVATED to COMPROMISED.
 *	@param keyAlias			The key alias to transit to compromised state.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_set_key_compromised(int keyAlias, void* vmhandle);

/**
 * Get the info of a key in keystore.
 *	@param keyAlias			The alias of the being queried key.
 *	@param algo				Buffer of 4 bytes that will contain the algorithm type of the key upon return. See <code>vm_malloc</code>.
 *	@param keySize			Buffer of 4 bytes that will contain the encoded size of the key upon return. See <code>vm_malloc</code>.
 *	@param keyType			Buffer of 4 bytes that will contain the type of the key upon return. See <code>vm_malloc</code>.
 *	@param parentKeyId		Buffer of 4 bytes that will contain the parent key's alias of the given key upon return. See <code>vm_malloc</code>.
 *	@param keyStatus		Buffer of 4 bytes that will contain the status (activated/deactivated/compromised/etc) of the key upon return. See <code>vm_malloc</code>.
 *	@param activateDate		Buffer of 33 bytes that will contain the activation date of the key upon return. See <code>vm_malloc</code>.
 *	@param expiryDate		Buffer of 33 bytes that will contain the expiry date of the key upon return. See <code>vm_malloc</code>.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail..
 */
VOS_API int vosInterface_keystore_get_key_info(int keyAlias, struct vmPtr algo, struct vmPtr keySize, struct vmPtr keyType,
                                  struct vmPtr parentKeyId, struct vmPtr keyStatus, struct vmPtr activateDate, struct vmPtr expiryDate, void* vmhandle);

/** Generate a symmetric key with the specified alias and store in keystore.
 *	@param keySize			The size of the generated key.
 *	@param keyAlias			The key alias to be given to the generated key.
 *	@param algo				The algorithm type of the key. Must be one of the <code>Algorithm</code> values defined in vosInterfaceConst.h.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_gen_symm_key(int keySize, int keyAlias, int algo, void* vmhandle);

// RSA
/** Add a RSA private key to keystore.
 *	@param keyAlias			The key alias to be given to key.
 *	@param n				Buffer containing the modulus of the key. See <code>vm_malloc</code>
 *	@param nSize			Size of buffer referenced by <code>n</code> in bytes.
 *	@param e				Buffer containing the public exponent of the key. See <code>vm_malloc</code>
 *	@param eSize			Size of buffer referenced by <code>e</code> in bytes.
 *	@param d				Buffer containing the private exponent of the key. See <code>vm_malloc</code>
 *	@param dSize			Size of buffer referenced by <code>d</code> in bytes.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_rsa_add_priv_key(int keyAlias, struct vmPtr n, int nSize, struct vmPtr e, int eSize, struct vmPtr d, int dSize, void* vmhandle);

/** Specify the prime factors of a RSA private key in keystore. The key must be added via vosInterface_keystore_rsa_add_priv_key() before.
 *	@param keyAlias			The key alias of the key in keystore.
 *	@param p				Buffer containing the 1st prime factor of the key. See <code>vm_malloc</code>
 *	@param pSize			Size of buffer referenced by <code>p</code> in bytes.
 *	@param q				Buffer containing the 2nd prime factor of the key. See <code>vm_malloc</code>
 *	@param qSize			Size of buffer referenced by <code>q</code> in bytes.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_rsa_add_prime_num(int keyAlias, struct vmPtr p, int pSize, struct vmPtr q, int qSize, void* vmhandle);

/** Specify additional parameters of a RSA private key in keystore. The key must be added via vosInterface_keystore_rsa_add_priv_key() before.
 *	@param keyAlias			The key alias of the key in keystore.
 *	@param dp				Buffer containing the 1st exponent parameter of the key which is equal to <code>d mod (p - 1)</code>.
 *							See <code>vm_malloc</code>
 *	@param dpSize			Size of buffer referenced by <code>dp</code> in bytes.
 *	@param dq				Buffer containing the 2nd exponent parameter of the key which is equal to <code>d mod (q - 1)</code>.
 *							See <code>vm_malloc</code>
 *	@param dqSize			Size of buffer referenced by <code>dq</code> in bytes.
 *	@param u				Buffer containing the coefficient of the key which is equal to <code>q^-1 mod p</code>.
 *							See <code>vm_malloc</code>
 *	@param uSize			Size of buffer referenced by <code>u</code> in bytes.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_rsa_add_key_param(int keyAlias, struct vmPtr dp, int dpSize, struct vmPtr dq, int dqSize, struct vmPtr u, int uSize, void* vmhandle);

/** Add a RSA public key to keystore.
 *	@param keyAlias			The key alias to be given to the key.
 *	@param n				Buffer containing the modulus of the key. See <code>vm_malloc</code>
 *	@param nSize			Size of buffer referenced by <code>n</code> in bytes.
 *	@param e				Buffer containing the public exponent of the key. See <code>vm_malloc</code>
 *	@param eSize			Size of buffer referenced by <code>e</code> in bytes.
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_keystore_rsa_add_pub_key(int keyAlias, struct vmPtr n, int nSize, struct vmPtr e, int eSize, void* vmhandle);

#endif

/*--------------------obfuscated function names -----------------------------------------*/

#define vosInterface_keystore_UUID _16923bf24c2b4257b579fcc6bffd0844 //_3df66ad61f9145528ca8832bcf20cdeb


#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_keystore_new_name(idx) VOS_CONCAT_DEF(vosInterface_keystore_UUID, idx, 199901L)


#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

#define vosInterface_keystore_load_impl vosInterface_keystore_new_name(88)
VOS_EXPORT int vosInterface_keystore_load_impl (struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);
#define vosInterface_keystore_save_impl vosInterface_keystore_new_name(89)
VOS_EXPORT int vosInterface_keystore_save_impl (struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);
#define vosInterface_keystore_clear_impl vosInterface_keystore_new_name(90)
VOS_EXPORT int vosInterface_keystore_clear_impl (void* vmhandle);
#define vosInterface_keystore_serial_size_impl vosInterface_keystore_new_name(91)
VOS_EXPORT int vosInterface_keystore_serial_size_impl (void* vmhandle);
#define vosInterface_keystore_import_keys_impl vosInterface_keystore_new_name(92)
VOS_EXPORT int vosInterface_keystore_import_keys_impl (struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);
#define vosInterface_keystore_export_keys_impl vosInterface_keystore_new_name(93)
VOS_EXPORT int vosInterface_keystore_export_keys_impl (struct vmPtr aliases, int nKeys, struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle);
#define vosInterface_keystore_keys_serial_size_impl vosInterface_keystore_new_name(94)
VOS_EXPORT int vosInterface_keystore_keys_serial_size_impl (struct vmPtr aliases, int nKeys, void* vmhandle);

#define vosInterface_keystore_count_impl vosInterface_keystore_new_name(95)
VOS_EXPORT int vosInterface_keystore_count_impl (void* vmhandle);
#define vosInterface_keystore_check_key_impl vosInterface_keystore_new_name(96)
VOS_EXPORT int vosInterface_keystore_check_key_impl (int keyAlias, void* vmhandle);
#define vosInterface_keystore_add_key_impl vosInterface_keystore_new_name(97)
VOS_EXPORT int vosInterface_keystore_add_key_impl (int keyAlias, int algo, struct vmPtr key, int keySize, int keyType, void* vmhandle);
#define vosInterface_keystore_del_key_impl vosInterface_keystore_new_name(98)
VOS_EXPORT int vosInterface_keystore_del_key_impl (int keyAlias, void* vmhandle);
#define vosInterface_keystore_deactivate_key_impl vosInterface_keystore_new_name(99)
VOS_EXPORT int vosInterface_keystore_deactivate_key_impl (int keyAlias, void* vmhandle);
#define vosInterface_keystore_set_key_compromised_impl vosInterface_keystore_new_name(100)
VOS_EXPORT int vosInterface_keystore_set_key_compromised_impl (int keyAlias, void* vmhandle);
#define vosInterface_keystore_get_key_info_impl vosInterface_keystore_new_name(101)
VOS_EXPORT int vosInterface_keystore_get_key_info_impl (int keyAlias, struct vmPtr algo, struct vmPtr keySize, struct vmPtr keyType,
                                             struct vmPtr parentKeyId, struct vmPtr keyStatus, struct vmPtr activateDate, struct vmPtr expiryDate, void* vmhandle);
#define vosInterface_keystore_gen_symm_key_impl vosInterface_keystore_new_name(102)
VOS_EXPORT int vosInterface_keystore_gen_symm_key_impl (int keySize, int keyAlias, int algo, void* vmhandle);

// RSA
#define vosInterface_keystore_rsa_add_priv_key_impl vosInterface_keystore_new_name(103)
VOS_EXPORT int vosInterface_keystore_rsa_add_priv_key_impl (int keyAlias, struct vmPtr n, int nSize, struct vmPtr e, int eSize, struct vmPtr d, int dSize, void* vmhandle);
#define vosInterface_keystore_rsa_add_prime_num_impl vosInterface_keystore_new_name(104)
VOS_EXPORT int vosInterface_keystore_rsa_add_prime_num_impl (int keyAlias, struct vmPtr p, int pSize, struct vmPtr q, int qSize, void* vmhandle);
#define vosInterface_keystore_rsa_add_key_param_impl vosInterface_keystore_new_name(105)
VOS_EXPORT int vosInterface_keystore_rsa_add_key_param_impl (int keyAlias, struct vmPtr dp, int dpSize, struct vmPtr dq, int dqSize, struct vmPtr u, int uSize, void* vmhandle);
#define vosInterface_keystore_rsa_add_pub_key_impl vosInterface_keystore_new_name(106)
VOS_EXPORT int vosInterface_keystore_rsa_add_pub_key_impl (int keyAlias, struct vmPtr n, int nSize, struct vmPtr e, int eSize, void* vmhandle);

#ifdef __cplusplus
} //extern "C" {
#endif

/*--------inline implementation --------*/

#ifndef NO_CRYPTO_API

VOS_API int vosInterface_keystore_load(struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle){
    
    return vosInterface_keystore_load_impl(pwd, pwdSize, keyStore, vmhandle);
};
VOS_API int vosInterface_keystore_save(struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle){
    
    return vosInterface_keystore_save_impl(pwd, pwdSize, keyStore, vmhandle);
};
VOS_API int vosInterface_keystore_clear(void* vmhandle){
    
    return vosInterface_keystore_clear_impl(vmhandle);
};
VOS_API int vosInterface_keystore_serial_size(void* vmhandle){
    
    return vosInterface_keystore_serial_size_impl(vmhandle);
};
VOS_API int vosInterface_keystore_import_keys(struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle){
    
    return vosInterface_keystore_import_keys_impl(pwd, pwdSize, keyStore, vmhandle);
};
VOS_API int vosInterface_keystore_export_keys(struct vmPtr aliases, int nKeys, struct vmPtr pwd, int pwdSize, struct vmPtr keyStore, void* vmhandle){
    
    return vosInterface_keystore_export_keys_impl(aliases, nKeys, pwd, pwdSize, keyStore, vmhandle);
};
VOS_API int vosInterface_keystore_keys_serial_size(struct vmPtr aliases, int nKeys, void* vmhandle){
    
    return vosInterface_keystore_keys_serial_size_impl(aliases, nKeys, vmhandle);
};

VOS_API int vosInterface_keystore_count(void* vmhandle){
    
    return vosInterface_keystore_count_impl(vmhandle);
};
VOS_API int vosInterface_keystore_check_key(int keyAlias, void* vmhandle){
    
    return vosInterface_keystore_check_key_impl(keyAlias, vmhandle);
};
VOS_API int vosInterface_keystore_add_key(int keyAlias, int algo, struct vmPtr key, int keySize, int keyType, void* vmhandle){
    
    return vosInterface_keystore_add_key_impl(keyAlias, algo, key, keySize, keyType, vmhandle);
};
VOS_API int vosInterface_keystore_del_key(int keyAlias, void* vmhandle){
    
    return vosInterface_keystore_del_key_impl(keyAlias, vmhandle);
};
VOS_API int vosInterface_keystore_deactivate_key(int keyAlias, void* vmhandle){
    
    return vosInterface_keystore_deactivate_key_impl(keyAlias, vmhandle);
};
VOS_API int vosInterface_keystore_set_key_compromised(int keyAlias, void* vmhandle){
    
    return vosInterface_keystore_set_key_compromised_impl(keyAlias, vmhandle);
};
VOS_API int vosInterface_keystore_get_key_info(int keyAlias, struct vmPtr algo, struct vmPtr keySize, struct vmPtr keyType,
                                                                       struct vmPtr parentKeyId, struct vmPtr keyStatus, struct vmPtr activateDate, struct vmPtr expiryDate, void* vmhandle){
    
    return vosInterface_keystore_get_key_info_impl(keyAlias, algo, keySize, keyType, parentKeyId, keyStatus, activateDate, expiryDate, vmhandle);
};
VOS_API int vosInterface_keystore_gen_symm_key(int keySize, int keyAlias, int algo, void* vmhandle){
    
    return vosInterface_keystore_gen_symm_key_impl(keySize, keyAlias, algo, vmhandle);
};

// RSA
VOS_API
int vosInterface_keystore_rsa_add_priv_key(int keyAlias, struct vmPtr n, int nSize, struct vmPtr e, int eSize, struct vmPtr d, int dSize, void* vmhandle) {
    
    return vosInterface_keystore_rsa_add_priv_key_impl(keyAlias, n, nSize, e, eSize, d, dSize, vmhandle);
}
VOS_API
int vosInterface_keystore_rsa_add_prime_num(int keyAlias, struct vmPtr p, int pSize, struct vmPtr q, int qSize, void* vmhandle){
    
    return vosInterface_keystore_rsa_add_prime_num_impl(keyAlias, p, pSize, q, qSize, vmhandle);
}
VOS_API
int vosInterface_keystore_rsa_add_key_param(int keyAlias, struct vmPtr dp, int dpSize, struct vmPtr dq, int dqSize, struct vmPtr u, int uSize, void* vmhandle){
    
    return vosInterface_keystore_rsa_add_key_param_impl(keyAlias, dp, dpSize, dq, dqSize, u, uSize, vmhandle);
}
VOS_API
int vosInterface_keystore_rsa_add_pub_key(int keyAlias, struct vmPtr n, int nSize, struct vmPtr e, int eSize, void* vmhandle){
    
    return vosInterface_keystore_rsa_add_pub_key_impl(keyAlias, n, nSize, e, eSize, vmhandle);
}
#endif

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif
