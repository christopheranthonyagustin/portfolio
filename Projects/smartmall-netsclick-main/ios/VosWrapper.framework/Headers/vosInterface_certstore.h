//
//  vosInterface_certstore.h
//  V-OS 3.0
//
//  Created by Le Hoang Quyen on 13/3/15.
//  Copyright (c) 2015 V-Key. All rights reserved.
//

#ifndef V_OS_3_0_vosInterface_certstore_h
#define V_OS_3_0_vosInterface_certstore_h

#include "vmPtr.h"

#include "vosInterface.h"

#ifndef NO_CRYPTO_API

/*----------------------interface declaration-------------------------------------------*/

/** Get number of certificates in certstore.
*	@param vmhandle			Pointer to the V-OS VM.
*	@return					Number of certificates if succeed or negative value if fail.
*/
VOS_API int vosInterface_certstore_count(void* vmhandle);

/** Load and construct the certstore from the encrypted, binary representation of the
*	certstore.
*	@param pwd				Password used to protect the encrypted certstore. Password must be stored in a VM buffer allocated via <code>vm_malloc</code>.
*	@param pwdSize			Length of password.
*	@param encryptedCet		Buffer storing the encrypted certstore. See <code>vm_malloc</code>
*	@param encryptedCertLen	Size of <code>encryptedCet</code> in bytes.
*	@param vmhandle			Pointer to the V-OS VM.
*	@return					Non-negative value if succeed or negative value if fail.
*/
VOS_API int vosInterface_certstore_load(struct vmPtr password, int passwordLen, struct vmPtr encryptedCet, int encryptedCertLen, void* vmhandle);
VOS_API int vosInterface_certstore_save(struct vmPtr password, int passwordLen, struct vmPtr encryptedCet, void* vmhandle);
VOS_API int vosInterface_certstore_get_serialized(void* vmhandle);
VOS_API int vosInterface_certstore_clear(void* vmhandle);

VOS_API int vosInterface_certstore_set_entry(int keyAlias, struct vmPtr encodedCert, int certType, int certSize, void* vmhandle);
VOS_API int vosInterface_certstore_delete_entry(int keyAlias, void* vmhandle);
VOS_API int vosInterface_certstore_get_entry_alias(int keyAlias, struct vmPtr encodedCertBuff, int certSize, void* vmhandle);
VOS_API int vosInterface_certstore_is_entry(int keyAlias, void* vmhandle);
VOS_API int vosInterface_certstore_get_aliases(struct vmPtr aliases, void* vmhandle);

VOS_API int vosInterface_certstore_csr_generate_alias(struct vmPtr inputString, int inputStringLen, struct vmPtr pemString, int pemStringLen, struct vmPtr pin, int pinLen, int algorithm, int keyAlias, void* vmhandle);

#endif // #ifndef NO_CRYPTO_API

/*--------------------obfuscated function names -----------------------------------------*/

#define vosInterface_certstore_UUID _16923bf24c2b4257b579fcc6bffd0844 //_6750d9a152cf48e5b0bb0f51a4590c62

#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_certstore_new_name(idx) VOS_CONCAT_DEF(vosInterface_certstore_UUID, idx, 199901L)


#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

#define vosInterface_certstore_count_impl vosInterface_certstore_new_name(58)
VOS_EXPORT int vosInterface_certstore_count_impl(void* vmhandle);
#define vosInterface_certstore_load_impl vosInterface_certstore_new_name(59)
VOS_EXPORT int vosInterface_certstore_load_impl(struct vmPtr password, int passwordLen, struct vmPtr encryptedCet, int encryptedCertLen, void* vmhandle);
#define vosInterface_certstore_save_impl vosInterface_certstore_new_name(60)
VOS_EXPORT int vosInterface_certstore_save_impl (struct vmPtr password, int passwordLen, struct vmPtr encryptedCet, void* vmhandle);
#define vosInterface_certstore_get_serialized_impl vosInterface_certstore_new_name(61)
VOS_EXPORT int vosInterface_certstore_get_serialized_impl (void* vmhandle);
#define vosInterface_certstore_clear_impl vosInterface_certstore_new_name(62)
VOS_EXPORT int vosInterface_certstore_clear_impl (void* vmhandle);

#define vosInterface_certstore_set_entry_impl vosInterface_certstore_new_name(63)
VOS_EXPORT int vosInterface_certstore_set_entry_impl (int keyAlias, struct vmPtr encodedCert, int certType, int certSize, void* vmhandle);
#define vosInterface_certstore_delete_entry_impl vosInterface_certstore_new_name(64)
VOS_EXPORT int vosInterface_certstore_delete_entry_impl (int keyAlias, void* vmhandle);
#define vosInterface_certstore_get_entry_alias_impl vosInterface_certstore_new_name(65)
VOS_EXPORT int vosInterface_certstore_get_entry_alias_impl (int keyAlias, struct vmPtr encodedCertBuff, int certSize, void* vmhandle);
#define vosInterface_certstore_is_entry_impl vosInterface_certstore_new_name(66)
VOS_EXPORT int vosInterface_certstore_is_entry_impl (int keyAlias, void* vmhandle);
#define vosInterface_certstore_get_aliases_impl vosInterface_certstore_new_name(67)
VOS_EXPORT int vosInterface_certstore_get_aliases_impl (struct vmPtr aliases, void* vmhandle);

#define vosInterface_certstore_csr_generate_alias_impl vosInterface_certstore_new_name(670)
VOS_EXPORT int vosInterface_certstore_csr_generate_alias_impl(struct vmPtr inputString, int inputStringLen, struct vmPtr pemString, int pemStringLen, struct vmPtr pin, int pinLen, int algorithm, int keyAlias, void* vmhandle);

#ifdef __cplusplus
} //extern "C" {
#endif

#ifndef NO_CRYPTO_API
/*-----------inline implementation ----------*/
VOS_API
int vosInterface_certstore_count(void* vmhandle){
    
    return vosInterface_certstore_count_impl(vmhandle);
}

VOS_API
int vosInterface_certstore_load(struct vmPtr password, int passwordLen, struct vmPtr encryptedCet, int encryptedCertLen, void* vmhandle){
    
    return vosInterface_certstore_load_impl(password, passwordLen, encryptedCet, encryptedCertLen, vmhandle);
}

VOS_API
int vosInterface_certstore_save(struct vmPtr password, int passwordLen, struct vmPtr encryptedCet, void* vmhandle){
    
    return vosInterface_certstore_save_impl(password, passwordLen, encryptedCet, vmhandle);
}

VOS_API
int vosInterface_certstore_get_serialized(void* vmhandle){
    
    return vosInterface_certstore_get_serialized_impl(vmhandle);
}

VOS_API
int vosInterface_certstore_clear(void* vmhandle){
    
    return vosInterface_certstore_clear_impl(vmhandle);
}

VOS_API

int vosInterface_certstore_set_entry(int keyAlias, struct vmPtr encodedCert, int certType, int certSize, void* vmhandle){
    
    return vosInterface_certstore_set_entry_impl(keyAlias, encodedCert, certType, certSize, vmhandle);
}

VOS_API
int vosInterface_certstore_delete_entry(int keyAlias, void* vmhandle){
    
    return vosInterface_certstore_delete_entry_impl(keyAlias, vmhandle);
}

VOS_API
int vosInterface_certstore_get_entry_alias(int keyAlias, struct vmPtr encodedCertBuff, int certSize, void* vmhandle){
    
    return vosInterface_certstore_get_entry_alias_impl(keyAlias, encodedCertBuff, certSize, vmhandle);
}

VOS_API
int vosInterface_certstore_is_entry(int keyAlias, void* vmhandle){
    
    return vosInterface_certstore_is_entry_impl(keyAlias, vmhandle);
}

VOS_API
int vosInterface_certstore_get_aliases(struct vmPtr aliases, void* vmhandle){
    
    return vosInterface_certstore_get_aliases_impl(aliases, vmhandle);
}

VOS_API
int vosInterface_certstore_csr_generate_alias(struct vmPtr inputString, int inputStringLen, struct vmPtr pemString, int pemStringLen, struct vmPtr pin, int pinLen, int algorithm, int keyAlias, void* vmhandle){

    return vosInterface_certstore_csr_generate_alias_impl(inputString, inputStringLen, pemString, pemStringLen, pin, pinLen, algorithm, keyAlias, vmhandle);
}
#endif // #ifndef NO_CRYPTO_API

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif // V_OS_3_0_vosInterface_certstore_h
