/**	@file vosInterface_mtls.h
 *
 *	Created by Yeo Yek Chong on 18/1/18.
 *	Copyright (c) 2018 V-Key Pte Ltd. All rights reserved.
 *
 *	Contact us with any questions or comments.
 *
 *	http://www.v-key.com
 *
 */

#ifndef vosInterface_mtls_h
#define vosInterface_mtls_h

#include "vmPtr.h"
#include "vosInterface.h"

/*----------------------interface declaration-------------------------------------------*/
/** Get mTLS certificate buffer size
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Certificate buffer size
 */
VOS_API int get_mtls_cert_buf_size(void* vmhandle);

/** Get mTLS certificate
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@param cert			    mTLS certificate buffer to store and returned.
 *  @sz                     Size of 'cert' buffer.
 *	@return					Size of the certificate copied if success. Negative error
 *                          code if failure.
 */
VOS_API int get_mtls_certificate(void* vmhandle, unsigned char* cert, int sz);

/** Get mTLS password buffer size
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@return					Password buffer size.
 */
VOS_API int get_mtls_pwd_buf_size(void* vmhandle);

/** Get mTLS password
 *	@param vmhandle			Pointer to the V-OS VM.
 *	@param pwd			    mTLS password buffer to store and returned.
 *  @sz                     Size of pwd buffer
 *	@return					Size of the password copied if success. Negative error code
 *                          if failure.
 */
VOS_API int get_mtls_password(void* vmhandle, unsigned char* pwd, int sz);

/*--------------------obfuscated function names -----------------------------------------*/

#define vosInterface_mtls_UUID _6b8845065044480d82fe031f7b6ab649
#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_mtls_new_name(idx) VOS_CONCAT_DEF(vosInterface_mtls_UUID, idx, 199901L)

#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

/* MTLS Range: 160 - 169 */
#define vosInterface_get_mtls_cert_buf_size_impl vosInterface_mtls_new_name(160)
VOS_EXPORT int vosInterface_get_mtls_cert_buf_size_impl (void* vmhandle);

#define vosInterface_get_mtls_certificate_impl vosInterface_mtls_new_name(161)
VOS_EXPORT int vosInterface_get_mtls_certificate_impl (void* vmhandle, unsigned char* cert, int sz);

#define vosInterface_get_mtls_pwd_buf_size_impl vosInterface_mtls_new_name(162)
VOS_EXPORT int vosInterface_get_mtls_pwd_buf_size_impl (void* vmhandle);

#define vosInterface_get_mtls_password_impl vosInterface_mtls_new_name(163)
VOS_EXPORT int vosInterface_get_mtls_password_impl (void* vmhandle, unsigned char* pwd, int sz);

#ifdef __cplusplus
} //extern "C" {
#endif

/*--------inline implementation --------*/
VOS_API
int get_mtls_cert_buf_size(void* vmhandle){
    
    return vosInterface_get_mtls_cert_buf_size_impl(vmhandle);
}
VOS_API
int get_mtls_certificate(void* vmhandle, unsigned char* cert, int sz){
    
    return vosInterface_get_mtls_certificate_impl(vmhandle, cert, sz);
}
VOS_API
int get_mtls_pwd_buf_size(void* vmhandle){
    
    return vosInterface_get_mtls_pwd_buf_size_impl(vmhandle);
}
VOS_API
int get_mtls_password(void* vmhandle, unsigned char* pwd, int sz){
    
    return vosInterface_get_mtls_password_impl(vmhandle, pwd, sz);
}

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif
