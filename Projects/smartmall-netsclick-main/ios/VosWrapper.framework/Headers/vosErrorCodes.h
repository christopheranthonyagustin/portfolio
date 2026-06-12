//
//  vosErrorCodes.h
//  V-OS 3.0
//
//  Created by Pham Hoang Le on 22/6/15.
//  Copyright (c) 2015 V-Key. All rights reserved.
//

#ifndef V_OS_3_0_vosErrorCodes_h
#define V_OS_3_0_vosErrorCodes_h

// https://confluence.intranet.v-key.com:9443/display/PKB/Product+Error+Codes

enum {

	/**
	 * __Cause(s):__
	 * The host app cannot access the file.
	 * __Recommendation(s):__
	 * - Make sure that the file is present
	 * - Make sure that the filename passed in the API call is correct
	 * - Make sure that the file path passed in the API call is correct
	 * - If on Android device, make sure that you have enabled file access permission
	 * - Try to restart the app
	 * - Try to reinstall the app
	 */
	VM_ERR_VA_FILE_CANNOT_ACCESS			= -10001,

	/**
	 * __Cause(s):__
	 * The file cannot be uncompressed. Maybe it has not been compressed, or the data is corrupted.
	 * __Recommendation(s):__
	 * - Make sure that the file is compressed
	 * - Make sure that the file is not corrupted
	 */
	VM_ERR_VA_FILE_FAIL_UNCOMPRESS			= -10002,

	/**
	 * __Cause(s):__
	 * The TA you are trying to add already existed. A TA can only be added once.
	 * __Recommendation(s):__
	 * Make sure that the TA you are adding has not been added previously.
	 */
	VM_ERR_VA_ENTRY_ALREADY_EXIST			= -10003,

	/**
	 * __Cause(s):__
	 * Unable to find the TA.
	 * __Recommendation(s):__
	 * Make sure that you have already added the TA.
	 */
	VM_ERR_VA_ENTRY_NOT_FOUND				= -10005,

	/**
	 * __Cause(s):__
	 * The TA that you are trying to switch to cannot be found.
	 * __Recommendation(s):__
	 * Make sure that the TA has already been added.
	 */
	VM_ERR_VA_ENTRY_SWITCH_NOT_FOUND		= -10006,

	/**
	 * __Cause(s):__
	 * Fail to find contiguous memory space in the VM for the TA.
	 * __Recommendation(s):__
	 * Make sure that the size of the TA is within the available memory space of the VM.
	 */
	VM_ERR_VA_ENTRY_BLOCKSPACE_NOT_FOUND	= -10007,

	/**
	 * __Cause(s):__
	 * The firmware used is incompatible with the processor.
	 * __Recommendation(s):__
	 * Make sure that the firmware used is compatible with the processor.
	 */
	VM_ERR_VA_FILE_INCOMPATIBLE             = -10008,

	/**
	 * __Cause(s):__
	 * The header data (containing version number) is invalid, corrupted, or missing.
	 * __Recommendation(s):__
	 * Make sure that the correct firmware is used.
	 */
	VM_ERR_VA_FILE_INVALID_HEADER           = -10009,

	/**
	 * __Cause(s):__
	 * The size of the TA is too big for the VM to handle.
	 * __Recommendation(s):__
	 * Reduce the size of the TA.
	 */
	VM_ERR_VA_FILE_TOO_BIG					= -10010,

	// V-OS dynamic library machine code list.
	// Not currently in use.  Keep for future use

	/**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_ISO_LIB_ALREADY_EXIST			= -10101,

    /**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_ISO_LIB_CREATE_FAIL				= -10102,

    /**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_ISO_LIB_NOT_FOUND				= -10103,

    /**
     * __Cause(s):__
     * The kernel/TA binary entry is not found in the list.
     * __Recommendation(s):__
     * Make sure that the kernel/TA binary has already been added.
     */
	VM_ERR_ISO_ENTRY_NOT_FOUND				= -10104,

    /**
     * __Cause(s):__
     * The kernel/TA binary entry of the specified tag already existed.
     * __Recommendation(s):__
     * Make sure that the kernel/TA binary tag has not been used.
     */
	VM_ERR_ISO_ENTRY_ALREADY_EXIST			= -10105,

    /**
     * __Cause(s):__
     * Failed to create kernel/TA binary entry.
     */
	VM_ERR_ISO_ENTRY_CREATE_FAIL			= -10106,

	// V-OS dynamic library machine code list error code.
	// Not currently in use.  Keep for future use

    /**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_LIB_FILE_SIZE_INVALID			= -10201,

    /**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_LIB_FILE_NOT_FOUND				= -10202,

	// V-OS dynamic library instance list error code.
	// Not currently in use.  Keep for future use

	/**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_LIB_ENTRY_ALREADY_EXIST			= -10203,

	/**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_LIB_ENTRY_CREATE_FAIL			= -10204,

	/**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_LIB_ENTRY_INIT_FAIL				= -10205,

	/**
	 * @exclude from doc. Not in use.
	 */
	VM_ERR_LIB_ENTRY_NOT_FOUND				= -10206,

	// // Old Trusted time - No longer in use
	// VM_ERR_TRT_SSL_CONNECT_FAILED			= -10311,
	// VM_ERR_TRT_SSL_CANNOT_WRITE				= -10312,
	// VM_ERR_TRT_SSL_CANNOT_READ_HEADER		= -10313,
	// VM_ERR_TRT_SSL_CANNOT_READ_RESPONSE		= -10314,
	// VM_ERR_TRT_SSL_STATUS_FAILED			= -10315,

	// Trusted time

	/**
	 * __Cause(s):__
	 * Unable to connect to the trusted time server.
	 * __Recommendation(s):__
	 * - Make sure that the network connection is available.
	 * - Make sure that the trusted time server is up and running.
	 */
	VM_ERR_TRT_CONNECTION_FAILED			= -10301,

	/**
	 * __Cause(s):__
	 * Failed to get success response from the trusted time server.
	 * __Recommendation(s):__
	 * Make sure that the server can decrypt the TTK sent from V-OS.
	 */
	VM_ERR_TRT_RESPONSE_FAILED				= -10302,

	/**
	 * __Cause(s):__
	 * Failed to authenticate with a valid user ID and/or password with the
	 * trusted time server.
	 * __Recommendation(s):__
	 * Make sure that the valid user ID and password are used.
	 */
	VM_ERR_TRT_AUTHENTICATION_FAILED		= -10303,

	/**
	 * __Cause(s):__
	 * The trusted time server response with a 5xx HTTP status code.
	 * __Recommendation(s):__
	 * - Make sure that the trusted time server is up and running
	 * - Make sure that the request to the trusted time server is valid
	 */
	VM_ERR_TRT_SERVER_FAILED				= -10304,

	/**
	 * __Cause(s):__
	 * The format of the response from the trusted time server is not the
	 * expected format.
	 * __Recommendation(s):__
	 * - Make sure the format of the response from the trusted time server is correct
	 * - Make sure that the request to the trusted time server is valid
	 */
	VM_ERR_TRT_RESPONSE_BAD_FORMAT			= -10305,

	/**
	 * __Cause(s):__
	 * The request to the trusted time server is timed out.
	 * __Recommendation(s):__
	 * - Make sure that the trusted time server is up and running
	 * - Make sure that a valid network connection is present
	 * - Make sure that the request to the trusted time server is valid
	 */
	VM_ERR_TRT_REQUEST_TIMEOUT				= -10306,

	/**
	 * __Cause(s):__
	 * The trusted time server returns an unknown error.
	 * __Recommendation(s):__
	 * - Make sure that the trusted time server is up and running
	 * - Make sure that the request to the trusted time server is valid
	 */
	VM_ERR_TRT_UNKNOWN_ERROR				= -10307,

	/**
	 * __Cause(s):__
	 * Unable to validate the time returned from the trusted time server.
	 * __Recommendation(s):__
	 * Make sure that the device has not been tampered (debugged, etc.) with.
	 */
	VM_ERR_CANNOT_VALIDATE_TIME				= -10401,

	/**
	 * __Cause(s):__
	 * V-OS Processor has insufficient device memory allocated for its operations.
	 * __Recommendation(s):__
	 * Check the host app memory usage on the device. If the majority of the device
	 * memory usage is from V-OS, there may be an issue with the V-OS Processor
	 * that you use. Make sure that the correct V-OS Processor is used.
	 */
	VM_ERR_INSUFFICIENT_MEMORY				= -10901,

	/**
	 * __Cause(s):__
	 * Invalid arguments are supplied to the function call.
	 * __Recommendation(s):__
	 * Make sure that the arguments supplied to the function call are valid.
	 */
	VM_ERR_BAD_ARGUMENTS					= -10902,

	/**
	 * __Cause(s):__
	 * The `vmHandler` is `null`. The V-OS might have not been started successfully.
	 * __Recommendation(s):__
	 * Make sure that V-OS is started successfully before any operations are executed.
	 */
	VM_ERR_INVALID_HANDLE					= -10903,

	/**
	 * __Cause(s):__
	 * An unsupported cryptographic function is detected.
	 * __Recommendation(s):__
	 * Make sure that only supported cryptographic function is executed.
	 */
	VM_ERR_UNSUPPORTED_CRYPTO_FUNC			= -10904,

	// VM_ERR_THREAT_RESPONSE_MODE_NOT_DEFINED = -11000,

	/**
	 * __Cause(s):__
	 * The mTLS certificate and password are not found or not compiled into the kernel.
	 * __Recommendation(s):__
	 * - Provide mTLS certificate and password for assets generation
	 * - Do not access mTLS certificate and password
	 */
	VM_ERR_MTLS_ENTRY_NOT_FOUND				= -11100,

	// VM_ERR_MTLS_INSUFFICIENT_BUFSIZE		= -11101,
};

#endif
