/** @file VosWrapper_capi.h
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
 *
 *This file is the C interface for Android's java & iOS's Objective-C equivalent VosWrapper class
 */

#ifndef VosWrapper_common_h
#define VosWrapper_common_h

#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif
	
	#include "vosInterface.h"
	
	/*----------------------interface declaration-------------------------------------------*/
	
	// VOS
	/** This function starts the V-OS virtual machine and associates it with VosWrapper. This is the same as calling:
	*	1. [VosWrapper startVos: appData] on iOS.
	*	2. VosWrapper.getInstance(context).startVos(appData, null, null, null, null) on Android.
	*
	*	<p>
	*	Note: Calling VOSWrapper_start() when there is already a running VM will restart it. This has the same effects as calling VOSWrapper_stop() and then VOSWrapper_start().
	*	</p>
	*	@param appData			A binary array containing the V-OS kernel's machine code.
	*	@param appDataSize		Size of kernel's machine code in bytes.
	*	@return	int				Error code (if the starting process fails) or the expiry time of the kernel.
	*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
	*/
	VOS_API int VOSWrapper_start(const unsigned char* appData, size_t appDataSize);
	/** stop and destroy the V-OS instance associated with VosWrapper. Calling this function is the same as calling:
	*	1. [VosWrapper stopVos] on iOS.
	*	2. VosWrapper.getInstance(context).stopVos() on Android.
	*
	*/
	VOS_API int VOSWrapper_stop();
	
	/** Acquire & lock the access to VosWrapper for current thread.
	*	@return Pointer to V-OS VM associated with VosWrapper. Or NULL if there is no V-OS VM associated with VosWrapper.
	*/
	VOS_API void* VOSWrapper_acquire();
	
	/** Unlock the access to VosWrapper from current thread
	*	@return Nothing
	*/
	VOS_API void VOSWrapper_release();
	
	/** Get the running V-OS VM associated with VosWrapper.
	*	@return Pointer to V-OS VM associated with VosWrapper. Or NULL if there is no V-OS VM associated with VosWrapper.
	*/
	VOS_API void* VOSWrapper_getVM();
	
	
	
	//NOTE: THE BELOW SECTION CAN BE IGNORED BY USER OF THIS API
	/*--------------------obfuscated function names -----------------------------------------*/
#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#define VOSWrapper_start_impl vosInterface_new_name(132)
	VOS_EXPORT int VOSWrapper_start_impl(const unsigned char* appData, size_t appDataSize);
#define VOSWrapper_stop_impl vosInterface_new_name(133)
	VOS_EXPORT int VOSWrapper_stop_impl();
	
#define VOSWrapper_acquire_impl vosInterface_new_name(134)
	VOS_EXPORT void* VOSWrapper_acquire_impl();
	
#define VOSWrapper_release_impl vosInterface_new_name(135)
	VOS_EXPORT void VOSWrapper_release_impl();
	
#define VOSWrapper_getVM_impl vosInterface_new_name(138)
	VOS_EXPORT void* VOSWrapper_getVM_impl();
	
	/*---------inline implementation ----------*/
	VOS_API int VOSWrapper_start(const unsigned char* appData, size_t appDataSize) {
		return VOSWrapper_start_impl(appData, appDataSize);
	}
	
	VOS_API int VOSWrapper_stop() {
		return VOSWrapper_stop_impl();
	}
	
	VOS_API void* VOSWrapper_acquire() {
		return VOSWrapper_acquire_impl();
	}
	
	VOS_API void VOSWrapper_release()
	{
		VOSWrapper_release_impl();
	}
	
	VOS_API void* VOSWrapper_getVM()
	{
		return VOSWrapper_getVM_impl();
	}

#endif //#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION


#ifdef __cplusplus
}//	extern "C"
#endif


#endif /* VosWrapper_common_h */
