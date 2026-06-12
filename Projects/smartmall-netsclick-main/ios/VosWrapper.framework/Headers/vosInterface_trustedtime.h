///
///  @file vosInterface_trustedtime.h
///  V-OS 3.0
///
///  Created by Pham Hoang Le on 3/8/15.
///  Copyright (c) 2015 V-Key. All rights reserved.
///

#ifndef V_OS_3_0_vosInterface_trustedtime_h
#define V_OS_3_0_vosInterface_trustedtime_h

#include "vmPtr.h"
#include "vosInterface.h"

/*----------------------interface declaration-------------------------------------------*/
/** This function specifies the URL of the time server to be used by trusted time algorithm.
 *	@param	vmhandle	Pointer to the V-OS virtual machine.
 *	@param	urlVmPtr	A VM pointer pointing to a string containing the server's URL. see <code>vm_malloc</code>.
 *	@return				Non-negative value if succeed or negative value if fail.
 *	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
 */
VOS_API int vosInterface_trusted_time_set_url(void *vmhandle, struct vmPtr urlVmPtr);

/** This function returns the current time (in seconds since the Epoch) securely i.e. no one can alter the returned time.
 *	@param	vmhandle	Pointer to the V-OS virtual machine.
 *	@return				The current time in seconds or negative value if there is error.
 *						Note:	- This function is not synchronous. That means its operation is not guaranteed to be finished upon return.
 *								- If the trusted time algorithm is still processing, this function will return TRUSTED_TIME_REQUEST_IN_PROGRESS (-1111).
 *								In that case, you have to call this function again, until a valid time value or another error code returned.
 *	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
 */
VOS_API int vosInterface_trusted_time_get(void *vmhandle);


/*--------------------obfuscated function names -----------------------------------------*/
#define vosInterface_trustedtime_UUID _56723bf24c2b424832abfcdbffd8430
#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_trustedtime_new_name(idx) VOS_CONCAT_DEF(vosInterface_trustedtime_UUID, idx, 199901L)

#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

#define vosInterface_trusted_time_set_url_impl vosInterface_trustedtime_new_name(1)
VOS_EXPORT int vosInterface_trusted_time_set_url_impl (void *vmhandle, struct vmPtr urlVmPtr);
#define vosInterface_trusted_time_get_impl vosInterface_trustedtime_new_name(2)
VOS_EXPORT int vosInterface_trusted_time_get_impl (void *vmhandle);

#ifdef __cplusplus
} //extern "C" {
#endif

/*------------------ inline delegations ------------*/
VOS_API
int vosInterface_trusted_time_set_url(void *vmhandle, struct vmPtr urlVmPtr)
{
	return vosInterface_trusted_time_set_url_impl(vmhandle, urlVmPtr);
}

VOS_API
int vosInterface_trusted_time_get(void *vmhandle)
{
	return vosInterface_trusted_time_get_impl(vmhandle);
}

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif