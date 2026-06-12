#ifndef VOSINTERFACEINTERNAL_H 
#define VOSINTERFACEINTERNAL_H

#include "vosInterface.h"

//use this as bit flag to pass to VOSStopInternal
#define VOS_STOP_INTERNAL_IGNORE_MEM_LEAKS 0x1

#ifdef __cplusplus
extern "C" {
#endif
    
	/** Return a running V-OS VM's pointer.
	*	<p>
	*	Note:				This function is deprecated.
	*	</p>
	*	@return				Pointer to a running V-OS VM.
	*/
    VOS_API void* VosGetGlobalVM(void);
    
	/** This function starts a V-OS virtual machine.
	*	<p>
	*	Notes:	- A license file called "vkeylicensepack" is required to be present in Android's data folder or iOS's Document folder.
	*			Otherwise LICENSE_FILE_NOT_FOUND will be returned.
	*			- An event callback must be registered before calling this function. See java/iOS wrapper layer's documents for more details about how to register the callback for Android/iOS.
	*	</p>
	*	@param fw_kernel				Pointer to a binary array containing the kernel's machine code.
	*	@param fw_size					Size of binary array pointed by <code>fw_kernel</code>.
	*	@param custKey					Pointer to an array of 32 bytes that will store the customer key embedded inside the license file upon return. Can be NULL.
	*	@param custID					Pointer to an integer that will hold the customer ID value embedded inside the license file upon return. Can be NULL.
	*	@param custFeature				Pointer to an integer that will hold the customer features value embedded inside the license file upon return. Can be NULL.
	*	@param sigKeyInputOutput		A byte array storing the V-guard's encrypted signature key with IV prepended. 
	*									Upon return, the content of this array will be modified to store the decrypted singature key.
	*	@param sigKeyInputOutputSize	Pointer pointing to an integer containing the size of <code>sigKeyInputOutput</code>'s content in bytes.
	*									Upon return, the size value will be modified to be the size of decrypted singature key.
	*	@param result					Pointer to an integer that, upon return, will hold an error code (if the starting process fails) or the expiry time of kernel.
	*	@return							Pointer to the successfully started V-OS virtual machine or NULL if fail.
	*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be written in <code>result</code> parameter.
	*/
    VOS_API
    void* VOSStartInternal(unsigned char* fw_kernel,
                           unsigned int fw_size,
                           unsigned char* custKey,
                           int* custID,
                           int* custFeature,
                           unsigned char* sigKeyInputOutput,
                           unsigned int* sigKeyInputOutputSize,
                           const ExtraParameters* exParams,
                           int* result);

    VOS_API
    int VOSStopInternal(void* vmhandle, int flags);

    /*---inline implementation ----*/
    #define VosGetGlobalVM_impl vosInterface_new_name(108)
	VOS_EXPORT void *VosGetGlobalVM_impl(void);
    #define VOSStartInternal_impl vosInterface_new_name(111)
	VOS_EXPORT void* VOSStartInternal_impl(unsigned char* fw_kernel,
                                unsigned int fw_size,
                                unsigned char* custKey,
                                int* custID,
                                int* custFeature,
                                unsigned char* sigKeyInputOutput,
                                unsigned int* sigKeyInputOutputSize,
                                const ExtraParameters* exParams,
                                int* result);

    #define VOSStopInternal_impl vosInterface_new_name(149)
    VOS_EXPORT int VOSStopInternal_impl(void* vmhandle, int flags);
    
    VOS_API void* VosGetGlobalVM(void)
    {
        return VosGetGlobalVM_impl();
    }
    
    VOS_API
    void* VOSStartInternal(unsigned char* fw_kernel,
                           unsigned int fw_size,
                           unsigned char* custKey,
                           int* custID,
                           int* custFeature,
                           unsigned char* sigKeyInputOutput,
                           unsigned int* sigKeyInputOutputSize,
                           const ExtraParameters* exParams,
                           int* result)
    {
        return VOSStartInternal_impl(fw_kernel,
                                     fw_size,
                                     custKey,
                                     custID,
                                     custFeature,
                                     sigKeyInputOutput,
                                     sigKeyInputOutputSize,
                                     exParams,
                                     result);
    }
    
    VOS_API
    int VOSStopInternal(void* vmhandle, int flags)
    {
        return VOSStopInternal_impl (vmhandle, flags);
    }
#ifdef __cplusplus
};
#endif

    
#endif 


