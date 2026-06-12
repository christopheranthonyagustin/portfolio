/** @file */

#ifndef VOSINTERFACE_H
#define VOSINTERFACE_H

#include "vosInterfaceConst.h"

#include <stdbool.h>

#ifndef VOS_API
#	ifdef _WIN32
#		define VOS_API static __forceinline
#	else
#		define VOS_API __attribute__ ((always_inline)) static inline
#	endif
#endif

#if defined _WIN32 && !defined __GNUC__ && !defined __clang__
#	define VOS_EXPECTED_UNUSED
#else
#	define VOS_EXPECTED_UNUSED __attribute__((unused))
#endif

#ifndef VOS_EXPORT
#	ifdef _WIN32
#		ifdef VOSWRAPPEREX_WIN32_EXPORTS
#			define VOS_EXPORT __declspec(dllexport)
#		else
#			define VOS_EXPORT __declspec(dllimport)
#		endif
#	else
#		define VOS_EXPORT __attribute__ ((visibility ("default")))
#	endif
#endif

/** callback function pointer
*	<p>
*	return false if callback doesn't or doesn't want to handle the event
*	</p>
*/
typedef bool (*vos_callback_fcn_ptr_t)(VosCallbackEventId eventId, int status);

/*----------------------interface declaration-------------------------------------------*/

typedef struct ExtraParameters {
    int vmMemSize;
    int vaMemSize;
    int libMemSize;
    char userId[256];
    char businessUnitId[256];
    int numOfStarts;
    int interval;
} ExtraParameters;

/** This function configs local threat lock period(if config as local lock).
*   <p>
*   Notes: The response mode have to use the same response mode in license file.
*	</p>
*   @param local_lock_period    The local lock period when a threat been detected in RESPONSE_MODE_LOCAL.
*/
VOS_API void VOSConfigLocalLockPeriod(int local_lock_period);

/** This function starts a V-OS virtual machine.
*	<p>
*	Notes:	- A license file called "vkeylicensepack" is required to be present in Android's data folder or iOS's Document folder.
*			Otherwise LICENSE_FILE_NOT_FOUND will be returned.
*			- An event callback must be registered before calling this function. See java/iOS wrapper layer's documents for more details about how to register the callback for Android/iOS.
*			Alternative, call <code>VOSRegisterCallback</code> to register the callback.
*	</p>
*	@param fw_kernel	Pointer to a binary array containing the kernel's machine code.
*	@param fw_size		Size of binary array pointed by <code>fw_kernel</code>.
*	@param custKey		Pointer to an array of 32 bytes that will store the customer key embedded inside the license file upon return. Can be NULL.
*	@param custID		Pointer to an integer that will hold the customer ID value embedded inside the license file upon return. Can be NULL.
*	@param custFeature	Pointer to an integer that will hold the customer features value embedded inside the license file upon return. Can be NULL.
*	@param result		Pointer to an integer that, upon return, will hold an error code (if the starting process fails) or the expiry time of kernel.
*	@return				Pointer to the successfully started V-OS virtual machine or NULL if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be written in <code>result</code> parameter.
*/
VOS_API void* VOSStart(unsigned char* fw_kernel, unsigned int fw_size, unsigned char* custKey, int* custID, int* custFeature, int* result);
VOS_API void* VOSStartEx(const unsigned char* fw_kernel, unsigned int fw_size, unsigned char* custKey, int* custID, int* custFeature, const ExtraParameters* exParams, int* result);

/** This function stops a V-OS virtual machine.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VOSStop(void* vmhandle);

/** This function locks a V-OS virtual machine. A locked VM cannot execute any further operations.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VOSLock(void* vmhandle);

/** This function returns the threats detected by V-OS.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@return				Threat infomation by categories.
*	@see https://confluence.intranet.v-key.com:9443/display/PKB/License-controlled+Threat+Response for the list of threat categories that can be returned.
*/
VOS_API int VOSGetThreats(void* vmhandle);

/** This function loads a TA's machine code.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	isoFilename	A string containing the name of the file containing TA's machine code.
*	@param	isoTag		An unique id that will be used to reference the loaded machine code in future.
*						Notes: - You have to choose this id yourself, if there is already an used id passed to VALoad() before, this function will return VM_ERR_ISO_ENTRY_ALREADY_EXIST.
*							   - You cannot use 1 as id. It is a reserved id.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VALoad(void* vmhandle, const char* isoFilename, int isoTag);

/** This function unloads a TA's machine code.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	isoTag		An unique id that is used to reference the loaded machine code. This id must be passed to VALoad() function before.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VAUnload(void* vmhandle, int isoTag);

/** This function instantiates a TA from a loaded machine code.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	isoTag		An unique id that is used to reference the loaded machine code.
*						Note: This id must be passed to VALoad() function before. And the referenced machine code hasn't been unloaded via VAUnload() yet.
*	@param	vaID		An unique id that will be used to reference the TA instance in future.
*						Notes: - You have to choose this id yourself, if there is already an used id passed to VAAddInstance() before, this function will return VM_ERR_VA_ENTRY_ALREADY_EXIST.
*							   - You cannot use 1 as id. It is a reserved id.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VAAddInstance(void* vmhandle,int isoTag, int vaID);

/** This function destroys a TA instance. The TA must be instantiated through VAAddInstance() before.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	vaID		An unique id that is used to reference the TA instance. This id must be passed to <code>vaID</code> parameter in VAAddInstance() function before.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VARemoveInstance(void* vmhandle, int vaID);

/** This function checks whether a TA instance with specified ID exists or not.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	vaID		An unique id that is used to reference the TA instance.
*	@return				Zero if the TA referenced by <code>vaID</code> doesn't exist, non-zero value otherwise.
*/
VOS_API int VAInstanceExist(void* vmhandle, int vaID);

/** This function gets absolute default path of VA instance with specified ID.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	vaTag		An unique id that is used to reference the VA instance.
*   @param  path		Pointer address that is used to get a string containing the absolute default path for VA referenced by <code> vaTag </code>.
*						Memory of path is obtained with malloc() by VAGetDefaultFilePath, and can be freed with free().
*	@return				VM_ERR_VA_ENTRY_NOT_FOUND if the VA referenced by <code>vaTag</code> doesn't exist, '1' otherwise.
*/
VOS_API int VAGetDefaultFilePath(void* vmhandle, int vaTag, char** path);

/** This function sets absolute default path of VA instance with specified ID.
*	@param	vmhandle	Pointer to the V-OS virtual machine.
*	@param	vaTAG		An unique id that is used to reference the VA instance.
*	@param	path		A string containing the absolut default path to set VA referenced by <code>vaTag</code>'s default path.
*	@return				VM_ERR_VA_ENTRY_NOT_FOUND if the VA referenced by <code> vaTag </code> doesn't exist, '1' otherwise.
*/
VOS_API int VASetDefaultFilePath(void* vmhandle, int vaTag, const char* path);

/** Registers the event callback. This callback will be fired if there is any important event happens during V-OS execution.
*	Note: Only one callback can be registered at any time.
* @param callback		The callback to be registered. See <code>vos_callback_fcn_ptr_t</code>.
*						At the minimum, the callback should return true.
* @return				Nothing
*/
VOS_API void VOSRegisterCallback(vos_callback_fcn_ptr_t callback);

/** This function attempt to parse the debug information from a content of a file typically ending with ".dbg" extension and map to the specified TA/kernel's debug info.
*	<p>
*	Notes:	This function is only useful for debug version of processor.
*	</p>
*	@param	vmhandle		Pointer to the V-OS virtual machine.
*	@param	vaID			An unique id that is used to reference the TA instance. This id must be passed to <code>vaID</code> parameter in VAAddInstance() function before.
*	@param	debugData		Pointer to buffer containing the debug info's content.
*	@param	debugDataSize	Size of debug info's data.
*	@return				Non-negative value if succeed or negative value if fail.
*	@see http://confluence.intranet.v-key.com:9090/display/PKB/Product+Error+Codes for the list of potential error codes that can be returned.
*/
VOS_API int VAAddDebugInfo(void* vmhandle, int vaTag, const void* debugData, unsigned int debugDataSize);

/**
 *Executes TA's main() function. (variadic arguments version)
 *@param	vmhandle	Pointer to the V-OS virtual machine.
 *@param	vaID		An unique id that is used to reference the TA instance. This id must be passed to <code>vaID</code> parameter in VAAddInstance() function before.
 *@param	functionID	Function ID. This will be translated to the first element in the arguments array of TA's main() function.
 *@param	numArgs		This indicates the number of arguments specified in the <code>ellipsis</code> argument.
 *@param	...			Actual arguments for VM function, all must be integer, for vmPtr, use ".addr_vm" instead.
 *						These arguments will translated to [2nd element - (<code>numArgs</code> + 1)-th element] in arguments array of TA's main() function.
 *@return				The return code of TA's main() function.
 */
#ifndef __OPTIMIZE__
VOS_EXPECTED_UNUSED
static int call_vm_function(void* vmhandle, int vaID, int functionID, unsigned int numArgs, ...);
#else
#define call_vm_function call_vm_function_impl
#endif//#ifndef __OPTIMIZE__

 /**
 *Executes TA's main() function. (arguments array version)
 *@param	vmhandle	Pointer to the V-OS virtual machine.
 *@param	vaID		An unique id that is used to reference the TA instance. This id must be passed to <code>vaID</code> parameter in VAAddInstance() function before.
 *@param	functionID	Function ID. This will be translated to the first element in the arguments array of TA's main() function.
 *@param	numArgs		This indicates the number of elements in the <code>args</code> argument.
 *@param	args		Actual arguments for VM function, all must be integer, for vmPtr, use ".addr_vm" instead.
 *						These arguments will translated to [2nd element - (<code>numArgs</code> + 1)-th element] in arguments array of TA's main() function.
 *@return				The return code of TA's main() function.
 */
VOS_API int call_vm_function_a(void* vmhandle, int vaID, int functionID, unsigned int numArgs, const int* args);

/** Get Troubleshooting ID.
 *	@param tid		    Pointer to an array of SHA_DIGEST_SIZE bytes that will contain the
 *                      Troubleshooting ID upon return.
 *	@param vmhandle		Pointer to the V-OS VM.
 *	@return				Non-negative value if succeed or negative value if fail.
 */
VOS_API int vosInterface_sys_get_troubleshooting_id(unsigned char* tid, void* vmhandle);

/**
 * Get processor version
 * 
 * @param   version     Pointer to buffer to return processor version
 * @param   size        Size of the processor version buffer. If version == NULL and *size == 0,
 *                      this function will return the required buffer size to copy the version.
 * @return              Size of processor version string if successfull. -1 if not success.
 */
VOS_API int vosInterface_get_processor_version(unsigned char* version, int size);

/**
 * Get firmware version
 * 
 * @param   version     Pointer to buffer to return firmware version
 * @param   size        Size of the firmware version buffer. If version == NULL and *size == 0,
 *                      this function will return the required buffer size to copy the version.
 * @return              Size of firmware version string if successfull. -1 if not success.
 */
VOS_API int vosInterface_get_firmware_version(unsigned char* version, int size);

/*--------------------obfuscated function names -----------------------------------------*/

#include <stdarg.h>

#define vosInterface_UUID _16923bf24c2b4257b579fcc6bffd0844


#define VOS_CONCAT_DEF_DETAIL(a, b, c) a ## b ## c
#define VOS_CONCAT_DEF(a, b, c) VOS_CONCAT_DEF_DETAIL(a, b, c)
#define vosInterface_new_name(idx) VOS_CONCAT_DEF(vosInterface_UUID, idx , 199901L)


#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#ifdef __cplusplus
extern "C" {
#endif

#define VOSConfigLocalLockPeriod_impl vosInterface_new_name(152)
VOS_EXPORT void VOSConfigLocalLockPeriod_impl(int local_lock_period);
#define VOSStart_impl vosInterface_new_name(69)
VOS_EXPORT void* VOSStart_impl(unsigned char* fw_kernel, unsigned int fw_size, unsigned char* custKey, int* custID, int* custFeature, int* result);
#define VOSStartEx_impl vosInterface_new_name(150)
VOS_EXPORT void* VOSStartEx_impl(const unsigned char* fw_kernel, unsigned int fw_size, unsigned char* custKey, int* custID, int* custFeature, const ExtraParameters* exParams, int* result);
#define VOSStop_impl vosInterface_new_name(70)
VOS_EXPORT int VOSStop_impl (void* vmhandle);
#define VOSLock_impl vosInterface_new_name(71)
VOS_EXPORT int VOSLock_impl (void* vmhandle);
#define VOSGetThreats_impl vosInterface_new_name(151)
VOS_EXPORT int VOSGetThreats_impl (void* vmhandle);
#define VALoad_impl vosInterface_new_name(72)
VOS_EXPORT int VALoad_impl (void* vmhandle, const char* isoFilename, int isoTag);
#define VAUnload_impl vosInterface_new_name(73)
VOS_EXPORT int VAUnload_impl (void* vmhandle, int isoTag);
#define VAAddInstance_impl vosInterface_new_name(74)
VOS_EXPORT int VAAddInstance_impl (void* vmhandle,int isoTag, int vaTag);
#define VARemoveInstance_impl vosInterface_new_name(75)
VOS_EXPORT int VARemoveInstance_impl (void* vmhandle, int vaTag);
#define VAInstanceExist_impl vosInterface_new_name(137)
VOS_EXPORT int VAInstanceExist_impl(void* vmhandle, int vaTag);
#define VAGetDefaultFilePath_impl vosInterface_new_name(141)
VOS_EXPORT int VAGetDefaultFilePath_impl(void* vmhandle, int vaTag, char** path);
#define VASetDefaultFilePath_impl vosInterface_new_name(142)
VOS_EXPORT int VASetDefaultFilePath_impl(void* vmhandle, int vaTag, const char* path);

#define VOSRegisterCallback_impl vosInterface_new_name(139)
VOS_EXPORT void VOSRegisterCallback_impl(vos_callback_fcn_ptr_t callback);

#define VAAddDebugInfo_impl vosInterface_new_name(148)
VOS_EXPORT int VAAddDebugInfo_impl(void* vmhandle, int vaTag, const void* debugData, unsigned int debugDataSize);

#define call_vm_function_v_impl vosInterface_new_name(76)
VOS_EXPORT int call_vm_function_v_impl (void* vmhandle, int vaID, int functionID, unsigned int numArgs, va_list args);

#define call_vm_function_impl vosInterface_new_name(112)
VOS_EXPORT int call_vm_function_impl (void* vmhandle, int vaID, int functionID, unsigned int numArgs, ...);

#define call_vm_function_a_impl vosInterface_new_name(136)
VOS_EXPORT int call_vm_function_a_impl(void* vmhandle, int vaID, int functionID, unsigned int numArgs, const int* args);

#define vosInterface_sys_get_troubleshooting_id_impl vosInterface_new_name(154)
VOS_EXPORT int vosInterface_sys_get_troubleshooting_id_impl(unsigned char* tid, void* vmhandle);

#define vosInterface_crypto_get_mode_impl vosInterface_new_name(153)
VOS_EXPORT int vosInterface_crypto_get_mode_impl(void* vmhandle);

#define vosInterface_get_processor_version_impl vosInterface_new_name(156)
VOS_EXPORT int vosInterface_get_processor_version_impl(unsigned char* version, int size);

#define vosInterface_get_firmware_version_impl vosInterface_new_name(157)
VOS_EXPORT int vosInterface_get_firmware_version_impl(unsigned char* version, int size);

#ifdef __cplusplus
}//extern "C" {
#endif

/*----------inline implementation ----------*/
VOS_API void VOSConfigLocalLockPeriod(int local_lock_period) {
    VOSConfigLocalLockPeriod_impl(local_lock_period);
}

VOS_API void* VOSStart(unsigned char* fw_kernel, unsigned int fw_size, unsigned char* custKey, int* custID, int* custFeature, int* result) {
    return VOSStart_impl(fw_kernel, fw_size, custKey, custID, custFeature, result);
}

VOS_API void* VOSStartEx(const unsigned char* fw_kernel, unsigned int fw_size, unsigned char* custKey, int* custID, int* custFeature, const ExtraParameters* exParams, int* result) {
    return VOSStartEx_impl(fw_kernel, fw_size, custKey, custID, custFeature, exParams, result);
}

VOS_API int VOSStop(void* vmhandle){
    return VOSStop_impl(vmhandle);
}

VOS_API
int VOSLock(void* vmhandle)
{
    return VOSLock_impl(vmhandle);
}

VOS_API
int VOSGetThreats(void* vmhandle)
{
    return VOSGetThreats_impl(vmhandle);
}

VOS_API int VALoad(void* vmhandle, const char* isoFilename, int isoTag) {

    return VALoad_impl(vmhandle, isoFilename, isoTag);
}

VOS_API int VAUnload(void* vmhandle, int isoTag) {
    return VAUnload_impl(vmhandle, isoTag);
}

VOS_API int VAAddInstance(void* vmhandle, int isoTag, int vaTag) {
    return VAAddInstance_impl(vmhandle, isoTag, vaTag);
}

VOS_API int VARemoveInstance(void* vmhandle, int vaTag) {
    return VARemoveInstance_impl(vmhandle, vaTag);
}

VOS_API int VAInstanceExist(void* vmhandle, int vaTag) {
	return VAInstanceExist_impl(vmhandle, vaTag);
}

VOS_API int VAGetDefaultFilePath(void* vmhandle, int vaTag, char** path) {
    return VAGetDefaultFilePath_impl(vmhandle, vaTag, path);
}

VOS_API int VASetDefaultFilePath(void* vmhandle, int vaTag, const char* path){
    return VASetDefaultFilePath_impl(vmhandle, vaTag, path);
}

VOS_API void VOSRegisterCallback(vos_callback_fcn_ptr_t callback) {
	VOSRegisterCallback_impl(callback);
}

VOS_API int VAAddDebugInfo(void* vmhandle, int vaTag, const void* debugData, unsigned int debugDataSize)
{
	return VAAddDebugInfo_impl(vmhandle, vaTag, debugData, debugDataSize);
}

#ifndef __OPTIMIZE__
/*
 *Call a VM function
 *Params:
 *-vaID: VA ID
 *-functionID: function ID
 *-numArgs: number of succeeding arguments - the actual arguments for the VM function
 *-...: actual arguments for VM function, all must be integer, for vmPtr, use ".addr_vm" instead
 */
int call_vm_function(void* vmhandle, int vaID, int functionID, unsigned int numArgs, ...)
{
    int re;
    va_list vl;

    va_start(vl, numArgs);

    //call implementation function
    re = call_vm_function_v_impl(vmhandle, vaID, functionID, numArgs, vl);

    va_end(vl);

    return re;
}
#endif//ifndef __OPTIMIZE__

VOS_API int call_vm_function_a(void* vmhandle, int vaID, int functionID, unsigned int numArgs, const int* args)
{
	return call_vm_function_a_impl(vmhandle, vaID, functionID, numArgs, args);
}

VOS_API
int vosInterface_sys_get_troubleshooting_id(unsigned char* tid, void* vmhandle)
{
    return vosInterface_sys_get_troubleshooting_id_impl(tid, vmhandle);
}

VOS_API int vosInterface_crypto_get_mode(void* vmhandle){
    return vosInterface_crypto_get_mode_impl(vmhandle);
};

VOS_API int vosInterface_get_processor_version(unsigned char* version, int size)
{
    return vosInterface_get_processor_version_impl(version, size);
}

VOS_API int vosInterface_get_firmware_version(unsigned char* version, int size)
{
    return vosInterface_get_firmware_version_impl(version, size);
}

#endif//#ifndef SKIP_VOSINTERFACE_IMPL_DECLARATION

#endif
