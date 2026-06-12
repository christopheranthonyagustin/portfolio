//
//  VGuardIPSModule.h
//  VGuard
//
//  Created by Chinwee Koh on 13/6/14.
//  Copyright (c) 2014 V-Key Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

//for using dyld
#include <mach-o/dyld.h>
//for getting dl_info
#include <dlfcn.h>
//for using sysctl
#include <sys/sysctl.h>
//for class_get
#include <objc/runtime.h>
//for cccrypt
#import <CommonCrypto/CommonCryptor.h>
//for cc_sha1
#import <CommonCrypto/CommonDigest.h>

//start of re-directing static C functions into dynamic
//re-declare function pointers for dynamic functions
typedef uint32_t (*_dyld_image_count_ptr_t)(void);
typedef char *(*_dyld_get_image_name_ptr_t)(uint32_t idx);
typedef unsigned long (*_dyld_get_image_header_ptr_t)(uint32_t idx);
typedef int (*dladdr_ptr_t)(const void *, Dl_info *);
typedef int (*sysctlnametomib_ptr_t)(const char *, int *, size_t *);
typedef int (*sysctl_ptr_t)(int *name, u_int namelen, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
typedef char * (*strstr_ptr_t)(const char *, const char *);
typedef int (*sysctlbyname_ptr_t)(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
typedef void (*_dyld_register_func_for_add_image_ptr_t)(void (*func)(const struct mach_header *, intptr_t));
typedef void (*_dyld_register_func_for_remove_image_ptr_t)(void (*func)(const struct mach_header *, intptr_t));
typedef const char *(*class_getImageName_ptr_t)(__unsafe_unretained Class cls);
typedef const char *(*class_getName_ptr_t)(__unsafe_unretained Class cls);
typedef Method *(*class_copyMethodList_ptr_t)(__unsafe_unretained Class cls, unsigned int *outCount);
typedef SEL (*method_getName_ptr_t)(Method m);
typedef IMP (*method_getImplementation_ptr_t)(Method M);
typedef int (*strcmp_ptr_t)(const char *, const char *);
typedef time_t (*time_ptr_t)(time_t *);
typedef void (*exit_ptr_t)(int);
typedef unsigned int (*sleep_ptr_t)(unsigned int);
typedef unsigned long (*strlen_ptr_t)(const char *);
typedef char * (*strncpy_ptr_t)(char *, const char *, unsigned long);
typedef unsigned long long (*strtoull_ptr_t)(const char *, char **, int);
typedef void * (*memcpy_ptr_t)(void *, const void *, unsigned long);
typedef int (*memcmp_ptr_t)(const void *, const void *, size_t);
typedef pid_t (*fork_ptr_t)(void);
typedef double (*trunc_ptr_t)(double);
typedef unsigned char (*CC_SHA1_ptr_t)(const void *data, CC_LONG len, unsigned char *md);
typedef unsigned char (*CC_SHA256_ptr_t)(const void *data, CC_LONG len, unsigned char *md);
typedef CCCryptorStatus (*CCCrypt_ptr_t)(
										 CCOperation op,         /* kCCEncrypt, etc. */
										 CCAlgorithm alg,        /* kCCAlgorithmAES128, etc. */
										 CCOptions options,      /* kCCOptionPKCS7Padding, etc. */
										 const void *key,
										 size_t keyLength,
										 const void *iv,         /* optional initialization vector */
										 const void *dataIn,     /* optional per op and alg */
										 size_t dataInLength,
										 void *dataOut,          /* data RETURNED here */
										 size_t dataOutAvailable,
										 size_t *dataOutMoved);

typedef OSStatus (*SecItemAdd_ptr_t)(CFDictionaryRef attributes, CFTypeRef *result);
typedef OSStatus (*SecItemDelete_ptr_t)(CFDictionaryRef query);
typedef OSStatus (*SecItemCopyMatching_ptr_t)(CFDictionaryRef query, CFTypeRef *result);
typedef CFDataRef (*SecCertificateCopyData_ptr_t)(SecCertificateRef certificate);
typedef SecCertificateRef (*SecTrustGetCertificateAtIndex_ptr_t)(SecTrustRef trust, CFIndex ix);
typedef OSStatus (*SSLWrite_ptr_t)(SSLContextRef context, const void *data, size_t dataLength, size_t *processed);
typedef OSStatus (*SSLRead_ptr_t)(SSLContextRef context, void *data, size_t dataLength, size_t *processed);
//verified C functions but not redirected
typedef void *(*dlsym_ptr_t);
typedef void *(*dlopen_ptr_t);
typedef void (*dlclose_ptr_t);

//redirect existing static signatures with dynamic signatures
#define _dyld_image_count                       _dyld_image_count_ptr
#define _dyld_get_image_name                    _dyld_get_image_name_ptr
#define _dyld_get_image_header                  _dyld_get_image_header_ptr
#define dladdr                                  dladdr_ptr
#define sysctlnametomib                         sysctlnametomib_ptr
#define sysctl                                  sysctl_ptr
#define strstr                                  strstr_ptr
#define sysctlbyname                            sysctlbyname_ptr
#define _dyld_register_func_for_add_image		_dyld_register_func_for_add_image_ptr
#define _dyld_register_func_for_remove_image	_dyld_register_func_for_remove_image_ptr
#define class_getImageName                      class_getImageName_ptr
#define class_getName                           class_getName_ptr
#define class_copyMethodList                    class_copyMethodList_ptr
#define method_getName							method_getName_ptr
#define method_getImplementation				method_getImplementation_ptr
#define strcmp                                  strcmp_ptr
#define time                                    time_ptr
#define exit                                    exit_ptr
#define sleep                                   sleep_ptr
#define strlen                                  strlen_ptr
#define strtoull                                strtoull_ptr
#define memcmp                                  memcmp_ptr
#define fork                                    fork_ptr
#define trunc                                   trunc_ptr
#define CC_SHA1                                 CC_SHA1_ptr
#define CC_SHA256                               CC_SHA256_ptr
#define CCCrypt                                 CCCrypt_ptr
#define SecItemAdd                              SecItemAdd_ptr
#define SecItemDelete                           SecItemDelete_ptr
#define SecItemCopyMatching                     SecItemCopyMatching_ptr
#define SecCertificateCopyData                  SecCertificateCopyData_ptr
#define SecTrustGetCertificateAtIndex           SecTrustGetCertificateAtIndex_ptr
#define SSLRead                                 SSLRead_ptr
#define SSLWrite                                SSLWrite_ptr
//#define strncpy                                 strncpy_ptr //causing Lexical warning of macro redefined
//#define memcpy                                  memcpy_ptr //causing Lexical warning of macro redefined

//THIS SECTION IS FOR WAT??
_dyld_image_count_ptr_t                     _dyld_image_count_ptr;
_dyld_get_image_name_ptr_t                  _dyld_get_image_name_ptr;
_dyld_get_image_header_ptr_t                _dyld_get_image_header_ptr;
dladdr_ptr_t                                dladdr_ptr;
sysctlnametomib_ptr_t                       sysctlnametomib_ptr;
sysctl_ptr_t                                sysctl_ptr;
strstr_ptr_t                                strstr_ptr;
sysctlbyname_ptr_t                          sysctlbyname_ptr;
_dyld_register_func_for_add_image_ptr_t		_dyld_register_func_for_add_image_ptr;
_dyld_register_func_for_remove_image_ptr_t	_dyld_register_func_for_remove_image_ptr;
class_getName_ptr_t                         class_getName_ptr;
class_copyMethodList_ptr_t                  class_copyMethodList_ptr;
method_getName_ptr_t                        method_getName_ptr;
method_getImplementation_ptr_t              method_getImplementation_ptr;
strcmp_ptr_t                                strcmp_ptr;
time_ptr_t                                  time_ptr;
exit_ptr_t                                  exit_ptr;
sleep_ptr_t                                 sleep_ptr;
strlen_ptr_t                                strlen_ptr;
strncpy_ptr_t                               strncpy_ptr;
strtoull_ptr_t                              strtoull_ptr;
memcpy_ptr_t                                memcpy_ptr;
memcmp_ptr_t                                memcmp_ptr;
fork_ptr_t                                  fork_ptr;
trunc_ptr_t                                 trunc_ptr;
CC_SHA1_ptr_t                               CC_SHA1_ptr;
CC_SHA256_ptr_t                             CC_SHA256_ptr;
CCCrypt_ptr_t                               CCCrypt_ptr;
SecItemAdd_ptr_t                            SecItemAdd_ptr;
SecItemDelete_ptr_t                         SecItemDelete_ptr;
SecItemCopyMatching_ptr_t                   SecItemCopyMatching_ptr;
SecCertificateCopyData_ptr_t                SecCertificateCopyData_ptr;
SecTrustGetCertificateAtIndex_ptr_t         SecTrustGetCertificateAtIndex_ptr;
SSLWrite_ptr_t                              SSLWrite_ptr;
SSLRead_ptr_t                               SSLRead_ptr;
dlsym_ptr_t                                 dlsym_ptr;
dlopen_ptr_t                                dlopen_ptr;
dlclose_ptr_t                               dlclose_ptr;

enum {
    THREATCATEGORY=0,
    THREATNAME,
    THREATINFO
};

@interface VGuardIPSModule : NSObject

-(NSDictionary*)fetchDictionaryForLevel:(NSString*)level;

-(NSDictionary*)createDictionaryForThreats:(NSString *)threatClass name:(NSString *)threatName info:(NSString *)threatInfo;

-(NSArray*)fetchThreatsInfo:(NSDictionary*)dictionaryList withInfoName:(NSString*)infoName;

-(BOOL)deviceFirmwareIsGreaterThanOrEqualTo:(NSString *)firmwareVersion;

@end
