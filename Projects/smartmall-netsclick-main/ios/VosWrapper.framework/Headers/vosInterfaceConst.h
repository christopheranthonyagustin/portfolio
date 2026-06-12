///
///  @file vosInterfaceConst.h
///  V-OS 3.0
///
///  Created by Pham Hoang Le on 22/6/15.
///  Copyright (c) 2015 V-Key. All rights reserved.
///

#ifndef V_OS_3_0_vosInterfaceConstants_h
#define V_OS_3_0_vosInterfaceConstants_h

/*!
 IMPORTANT : DONT CHANGE THE VALUE OF THESE ENUMS. THESE VALUES ARE TIGHTHTEN WTIH THE FIRMWARE CODE
 */

typedef enum VosCallbackEventId {
    DEBUGGER_CHECK_ID = 0x01000000,
    APP_SIGNER_CHECK_ID = 0x02000000,
    JAIL_BROKEN_ID = 0x03000000,
    DFP_HOOKED_ID = 0x04000000,
    TIME_HOOKED_ID = 0x05000000,
    RUNTIME_TAMPERING_ID = 0x06000000,
    CODE_INJECTION_CHECK_ID = 0x10000000,
	SILENT_MODE_THREAT_ID = 0x20000000,
	ROOT_THREAT_ID = 0x09000000,
} VosCallbackEventId;

typedef enum PaddingType{
	NO_PADDING, //no padding
	PKCS7_PADDING, //PKCS7 padding
}PaddingType;

typedef enum {
	CBC,
	ECB,
	WB,
}CipherMode;

typedef enum {
    GCM,
    CCM
}AuthCipherMode;

typedef enum {
	PRIVATE,
	SECRET,
	PUBLIC,
}TypeOfKey;

typedef enum {
	DES3_ALGO = 400,
	AES_ALGO = 500,
	RSA_ALGO = 600,
    HMAC_ALGO = 700,
    ECC_ALGO = 800,
}Algorithm;

typedef enum{
	ENCRYPTION = 0,
	DECRYPTION = 1,
}EncDec;

typedef enum {
	RSA_2048 = 256,
}RSAKeyBlockSize;

typedef enum {
    ECDSA_256 = 128,
}ECDSA_SigLength;

#endif
