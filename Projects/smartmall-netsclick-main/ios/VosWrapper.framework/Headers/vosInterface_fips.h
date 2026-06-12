//
//  vosInterface_fips.h
//  V-OS 3.0
//
//  Created by Le Hoang Quyen on 13/3/15.
//  Copyright (c) 2015 V-Key. All rights reserved.
//

#ifndef V_OS_3_0_vosInterface_fips_h
#define V_OS_3_0_vosInterface_fips_h

#include "vmPtr.h"

#include "vosInterface.h"

/*----------------------interface declaration-------------------------------------------*/

VOS_API int vosInterface_self_test(void* vmhandle);
VOS_API int vosInterface_get_poweruptest_status(void* vmhandle);
VOS_API int vosInterface_do_module_integrity_test(void* vmhandle);

VOS_API int vosInterface_fips_rng_bytes(struct vmPtr key, int keySize, struct vmPtr datetime, int datetimeSize, struct vmPtr seed, int seedSize, struct vmPtr buffer, int bufferSize, void* vmhandle);
VOS_API int vosInterface_fips_rng_drbg_set_entropy(struct vmPtr buffer, int bufferSize, void* vmhandle);
VOS_API int vosInterface_fips_rng_drbg_init(struct vmPtr entropy, int entropyLen, struct vmPtr nonce, int nonceLen, struct vmPtr personalizationString, int personalizationStringLen, void* vmhandle);
VOS_API int vosInterface_fips_rng_drbg_reseed(struct vmPtr entropy, int entropyLen, struct vmPtr additionalInput, int additionalInputLen, void* vmhandle);
VOS_API int vosInterface_fips_rng_drbg_generate(int predictionResistant, struct vmPtr buffer, int bufferSize, struct vmPtr additionalInput, int additionalInputLen, void* vmhandle);
VOS_API int vosInterface_fips_rng_drbg_print_state(void* vmhandle);

VOS_API int vosInterface_fips_rsa_get_priv_key(int keyAlias, struct vmPtr n, struct vmPtr nSize,
                                  struct vmPtr e, struct vmPtr eSize, struct vmPtr d,
                                  struct vmPtr dSize, void* vmhandle);
VOS_API int vosInterface_fips_rsa_get_prime_num(int keyAlias, struct vmPtr p, struct vmPtr pSize,
                                   struct vmPtr q, struct vmPtr qSize, void* vmhandle);


/*--------------------obfuscated function names -----------------------------------------*/

#define vosInterface_fips_UUID _16923bf24c2b4257b579fcc6bffd0844 //_30b83611115a4ef9904a90313ff8a28a


#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_fips_new_name(idx) VOS_CONCAT_DEF(vosInterface_fips_UUID, idx, 199901L)


#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

#define vosInterface_self_test_impl vosInterface_fips_new_name(77)
VOS_EXPORT int vosInterface_self_test_impl (void* vmhandle);
#define vosInterface_get_poweruptest_status_impl vosInterface_fips_new_name(78)
VOS_EXPORT int vosInterface_get_poweruptest_status_impl (void* vmhandle);
#define vosInterface_do_module_integrity_test_impl vosInterface_fips_new_name(79)
VOS_EXPORT int vosInterface_do_module_integrity_test_impl (void* vmhandle);

#define vosInterface_fips_rng_bytes_impl vosInterface_fips_new_name(80)
VOS_EXPORT int vosInterface_fips_rng_bytes_impl (struct vmPtr key, int keySize, struct vmPtr datetime, int datetimeSize, struct vmPtr seed, int seedSize, struct vmPtr buffer, int bufferSize, void* vmhandle);
#define vosInterface_fips_rng_drbg_set_entropy_impl vosInterface_fips_new_name(81)
VOS_EXPORT int vosInterface_fips_rng_drbg_set_entropy_impl (struct vmPtr buffer, int bufferSize, void* vmhandle);
#define vosInterface_fips_rng_drbg_init_impl vosInterface_fips_new_name(82)
VOS_EXPORT int vosInterface_fips_rng_drbg_init_impl (struct vmPtr entropy, int entropyLen, struct vmPtr nonce, int nonceLen, struct vmPtr personalizationString, int personalizationStringLen, void* vmhandle);
#define vosInterface_fips_rng_drbg_reseed_impl vosInterface_fips_new_name(83)
VOS_EXPORT int vosInterface_fips_rng_drbg_reseed_impl (struct vmPtr entropy, int entropyLen, struct vmPtr additionalInput, int additionalInputLen, void* vmhandle);
#define vosInterface_fips_rng_drbg_generate_impl vosInterface_fips_new_name(84)
VOS_EXPORT int vosInterface_fips_rng_drbg_generate_impl (int predictionResistant, struct vmPtr buffer, int bufferSize, struct vmPtr additionalInput, int additionalInputLen, void* vmhandle);
#define vosInterface_fips_rng_drbg_print_state_impl vosInterface_fips_new_name(85)
VOS_EXPORT int vosInterface_fips_rng_drbg_print_state_impl (void* vmhandle);

#define vosInterface_fips_rsa_get_priv_key_impl vosInterface_fips_new_name(86)
VOS_EXPORT int vosInterface_fips_rsa_get_priv_key_impl (int keyAlias, struct vmPtr n, struct vmPtr nSize,
                                             struct vmPtr e, struct vmPtr eSize, struct vmPtr d,
                                             struct vmPtr dSize, void* vmhandle);
#define vosInterface_fips_rsa_get_prime_num_impl vosInterface_fips_new_name(87)
VOS_EXPORT int vosInterface_fips_rsa_get_prime_num_impl (int keyAlias, struct vmPtr p, struct vmPtr pSize,
                                              struct vmPtr q, struct vmPtr qSize, void* vmhandle);

#ifdef __cplusplus
} //extern "C" {
#endif

/*----------inline implementation------------*/
VOS_API
int vosInterface_self_test(void* vmhandle) {
    
    return vosInterface_self_test_impl(vmhandle);
}

VOS_API
int vosInterface_get_poweruptest_status(void* vmhandle){
    
    return vosInterface_get_poweruptest_status_impl(vmhandle);
}

VOS_API
int vosInterface_do_module_integrity_test(void* vmhandle){
    
    return vosInterface_do_module_integrity_test_impl(vmhandle);
}

VOS_API
int vosInterface_fips_rng_bytes(struct vmPtr key, int keySize, struct vmPtr datetime, int datetimeSize, struct vmPtr seed, int seedSize, struct vmPtr buffer, int bufferSize, void* vmhandle){
    
    return vosInterface_fips_rng_bytes_impl(key, keySize, datetime, datetimeSize, seed, seedSize, buffer, bufferSize, vmhandle);
}

VOS_API
int vosInterface_fips_rng_drbg_set_entropy(struct vmPtr buffer, int bufferSize, void* vmhandle){
    
    return vosInterface_fips_rng_drbg_set_entropy_impl(buffer, bufferSize, vmhandle);
}

VOS_API
int vosInterface_fips_rng_drbg_init(struct vmPtr entropy, int entropyLen, struct vmPtr nonce, int nonceLen, struct vmPtr personalizationString, int personalizationStringLen, void* vmhandle){
    
    return vosInterface_fips_rng_drbg_init_impl(entropy, entropyLen, nonce, nonceLen, personalizationString, personalizationStringLen, vmhandle);
}

VOS_API
int vosInterface_fips_rng_drbg_reseed(struct vmPtr entropy, int entropyLen, struct vmPtr additionalInput, int additionalInputLen, void* vmhandle){
    
    return vosInterface_fips_rng_drbg_reseed_impl(entropy, entropyLen, additionalInput, additionalInputLen, vmhandle);
}

VOS_API
int vosInterface_fips_rng_drbg_generate(int predictionResistant, struct vmPtr buffer, int bufferSize, struct vmPtr additionalInput, int additionalInputLen, void* vmhandle){
    
    return vosInterface_fips_rng_drbg_generate_impl(predictionResistant, buffer, bufferSize, additionalInput, additionalInputLen, vmhandle);
}

VOS_API
int vosInterface_fips_rng_drbg_print_state(void* vmhandle){
    
    return vosInterface_fips_rng_drbg_print_state_impl(vmhandle);
}

VOS_API
int vosInterface_fips_rsa_get_priv_key(int keyAlias, struct vmPtr n, struct vmPtr nSize,
                                       struct vmPtr e, struct vmPtr eSize, struct vmPtr d,
                                       struct vmPtr dSize, void* vmhandle){
    
    return vosInterface_fips_rsa_get_priv_key_impl(keyAlias, n, nSize,
                                                   e, eSize, d,
                                                   dSize, vmhandle);
}

VOS_API
int vosInterface_fips_rsa_get_prime_num(int keyAlias, struct vmPtr p, struct vmPtr pSize,
                                        struct vmPtr q, struct vmPtr qSize, void* vmhandle){
    
    return vosInterface_fips_rsa_get_prime_num_impl(keyAlias, p, pSize,
                                                    q, qSize, vmhandle);
}

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif
