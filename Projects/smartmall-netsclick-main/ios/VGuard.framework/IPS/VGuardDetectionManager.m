//
//  VGuardDetectionManager.m
//  VGuard
//
//  Created by TC Tan on 11/10/12.
//  Copyright (c) 2012 V-Key Pte Ltd. All rights reserved.
//

#import "VGuardDetectionManager.h"
#import "VGuardUtility.h"
#import "VGuardPrivateUtility.h"
#import "VGuardProfileManager.h"
#import "VGuardCustomAPI.h"

#include "in_pcb.h"
#include "tcp_var.h"
#include <sys/types.h>
#include <sys/syscall.h>
#include <mach-o/fat.h>
#include <mach/vm_types.h>
#include <mach/exception_types.h>
#include <mach/task.h>
#include <mach/mach.h>
#import <sys/stat.h>
#import <sys/mman.h>
#import <sys/mount.h>
#import <string.h>

#define IPHONE_DYLD_SHARED_CACHE_DIR						"/System/Library/Caches/com.apple.dyld/"
#define DYLD_SHARED_CACHE_BASE_NAME							"dyld_shared_cache_"
#define CLASS_NAME                                          @"VGuardDetectionManager"


struct shared_file_mapping_np {
    mach_vm_address_t	sfm_address;
    mach_vm_size_t		sfm_size;
    mach_vm_offset_t	sfm_file_offset;
    vm_prot_t		sfm_max_prot;
    vm_prot_t		sfm_init_prot;
};
typedef struct shared_file_mapping_np shared_file_mapping_np_t;

struct dyld_cache_header {
    char		magic[16];
    uint32_t	mappingOffset;
    uint32_t	mappingCount;
    uint32_t	imagesOffset;
    uint32_t	imagesCount;
    uint64_t	dyldBaseAddress;
};
typedef struct dyld_cache_header dyld_cache_header_t;

struct dyld_cache_image_info {
    uint64_t	address;
    uint64_t	modTime;
    uint64_t	inode;
    uint32_t	pathFileOffset;
    uint32_t	pad;
};
typedef struct dyld_cache_image_info dyld_cache_image_info_t;

static const char* default_shared_cache_path() {
#if __i386__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "i386";
#elif __x86_64__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "x86_64";
#elif __ARM_ARCH_5TEJ__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv5";
#elif __ARM_ARCH_6K__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv6";
#elif __ARM_ARCH_7A__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv7";
#elif __ARM_ARCH_7F__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv7f";
#elif __ARM_ARCH_7K__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv7k";
#elif __ARM_ARCH_7S__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv7s";
#elif __ARM64_ARCH_8__
    return IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "arm64";
#else
#error unsupported architecture
#endif
}

typedef struct load_command load_command_t;
typedef struct linkedit_data_command linkedit_data_command_t;

#ifdef __LP64__
typedef struct mach_header_64 mach_header_t;
typedef struct segment_command_64 segment_command_t;
typedef struct section_64 section_t;
typedef struct nlist_64 nlist_t;
#define LC_SEGMENT_ARCH_DEPENDENT LC_SEGMENT_64
#define MH_MAGIC_ARCH_DEPENDENT MH_MAGIC_64
#else
typedef struct mach_header mach_header_t;
typedef struct segment_command segment_command_t;
typedef struct section section_t;
typedef struct nlist nlist_t;
#define LC_SEGMENT_ARCH_DEPENDENT LC_SEGMENT
#define MH_MAGIC_ARCH_DEPENDENT MH_MAGIC
#endif

#define INVALID_OFFSET 1

#define CPU_ARCH_ABI64          0x01000000	 /* 64 bit ABI */
#define CPU_TYPE_ARM64          (CPU_TYPE_ARM | CPU_ARCH_ABI64)

#pragma mark - DISABLE GDB
typedef int (*ptrace_ptr_t)(int _request, pid_t _pid, caddr_t _addr, int _data);

#define	PT_TRACE_ME		0	/* child declares it's being traced */
#define	PT_READ_I		1	/* read word in child's I space */
#define	PT_READ_D		2	/* read word in child's D space */
#define	PT_READ_U		3	/* read word in child's user structure */
#define	PT_WRITE_I		4	/* write word in child's I space */
#define	PT_WRITE_D		5	/* write word in child's D space */
#define	PT_WRITE_U		6	/* write word in child's user structure */
#define	PT_CONTINUE		7	/* continue the child */
#define	PT_KILL			8	/* kill the child process */
#define	PT_STEP			9	/* single step the child */
#define	PT_ATTACH		10	/* trace some running process */
#define	PT_DETACH		11	/* stop tracing a process */
#define	PT_SIGEXC		12	/* signals as exceptions for current_proc */
#define PT_THUPDATE		13	/* signal for thread# */
#define PT_ATTACHEXC	14	/* attach to running process with signal exception */
#define	PT_FORCEQUOTA	30	/* Enforce quota for root */
#define	PT_DENY_ATTACH	31
#define	PT_FIRSTMACH	32	/* for machine-specific requests */

#define test_ptrace(ptrace_fn, result_expected) { \
if ((result=ptrace_ptr(ptrace_fn,0,0,0)) != result_expected) { \
trace("Error: ptrace %d not %d, instead %d", ptrace_fn, result_expected, result); \
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL2] objectForKey:kPtrace_fn] \
withInfoName:[NSString stringWithFormat:@"ptrace %d",ptrace_fn]]; \
} else { \
trace(@"PTrace %d = %d", ptrace_fn, result); \
} \
}

#define test_gdb(_vgBuildType) {                     \
int result;												\
void* handle = dlopen(0, RTLD_GLOBAL | RTLD_NOW);		\
ptrace_ptr_t ptrace_ptr = dlsym(handle, ptrace_cstr);	\
test_ptrace(32,-1);                                     \
/*test_ptrace(12,-1); */                                \
/*test_ptrace(32,-1); */								\
/*test_ptrace(31,0);  */                                \
test_ptrace(30,-1);										\
test_ptrace(14,-1);										\
test_ptrace(13,-1);										\
test_ptrace(12,-1);										\
test_ptrace(11,-1);										\
test_ptrace(10,-1);										\
test_ptrace(9,-1);										\
test_ptrace(8,-1);										\
test_ptrace(7,-1);										\
test_ptrace(6,-1);										\
test_ptrace(5,-1);										\
test_ptrace(4,-1);										\
test_ptrace(3,-1);										\
test_ptrace(2,-1);										\
test_ptrace(1,-1);						 				\
dlclose(handle);										\
}

int run_count=0;

@interface VGuardDetectionManager ()
@property (nonatomic, assign) BOOL isVGuardDetectionDone;
@end

@implementation VGuardDetectionManager {
    NSDictionary *signatureDict;
    NSMutableArray *threatArray;
    NSMutableArray *classArray;
    VGuard_BuildConfiguration _vgBuildType;
    BOOL jailbreakDetectedByVOS;
    BOOL runtimeTamperingDetectedByVOS;
}
//NEED TO MAKE PRIVATE!!!
int original_dyld_count;
int current_dyld_count;
int protection_fatal_alert;
//self reference obj for sake of C in macro
id myself;
/* The encryption info struct and constants are missing from the iPhoneSimulator SDK, but not from the iPhoneOS or
 * Mac OS X SDKs. Since one doesn't ever ship a Simulator binary, we'll just provide the definitions here. */
#if defined(TARGET_IPHONE_SIMULATOR) && !defined(LC_ENCRYPTION_INFO)
#define LC_ENCRYPTION_INFO 0x21
struct encryption_info_command {
    uint32_t cmd;
    uint32_t cmdsize;
    uint32_t cryptoff;
    uint32_t cryptsize;
    uint32_t cryptid;
};
#endif
#define verify_fn(function_ptr, function_name, function_lib_loc, function_lib) { \
if (!dladdr_ptr(function_ptr, &info) || !function_ptr) { \
trace(@"==> ERROR: Could not find %s!", function_name); \
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_fnName] \
withInfoName:[NSString stringWithFormat:VerifyFn, function_name]];\
return 1; \
} \
if (((unsigned int)function_ptr < function_lib_loc) ||	(strcmp(info.dli_fname, function_lib)) || \
(strcmp(info.dli_sname, function_name))) { \
trace(@"==> ERROR: %s not in %s!", function_name, function_lib); \
trace(@"==> Results: 0x%08x / 0x%08x, %s / %s",	(unsigned int)function_ptr, (unsigned int)function_lib_loc,info.dli_fname, info.dli_sname);	\
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_fnNameAndInfo] \
withInfoName:[NSString stringWithFormat:VerifyFnIn, function_name, info.dli_fname]];\
return 1; \
} \
else if ((unsigned int)function_ptr == 0) { \
trace(@"==> ERROR: %s (%s) not found!", function_name, function_lib); \
return 0; \
} \
}
#define verify_f2(function_ptr, function_name, function_lib_loc, function_lib, function_lib2_loc, function_lib2) { \
if (!dladdr_ptr(function_ptr, &info) || !function_ptr) { \
trace(@"==> ERROR: Could not find %s!", function_name); \
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_f2Name] \
withInfoName:[NSString stringWithFormat:VerifyFn, function_name]];\
return 1; \
} \
if (((unsigned int)function_ptr < function_lib_loc || strcmp(info.dli_fname, function_lib) && \
((unsigned int)function_ptr < function_lib2_loc || strcmp(info.dli_fname, function_lib2))) || \
(strcmp(info.dli_sname, function_name))) { \
trace(@"==> ERROR: %s not in %s!", function_name, function_lib); \
trace(@"==> Results: 0x%08x / 0x%08x, %s / %s", (unsigned int)function_ptr, (unsigned int)function_lib_loc, info.dli_fname, info.dli_sname); \
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_f2NameAndInfo] \
withInfoName:[NSString stringWithFormat:VerifyFnIn, function_name, info.dli_fname]];\
return 1; \
} \
else if ((unsigned int)function_ptr == 0) { \
trace(@"==> ERROR: %s (%s) not found!", function_name, function_lib); \
return 0; \
} \
}
#define verify_f3(function_ptr, function_name, function_lib_loc, function_lib, function_lib2_loc, function_lib2, function_name2) { \
if (!dladdr_ptr(function_ptr, &info) || !function_ptr) { \
trace(@"==> ERROR: Could not find %s!", function_name); \
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_f3Name] \
withInfoName:[NSString stringWithFormat:VerifyFn, function_name]];\
return 1; \
} \
if ((((unsigned int)function_ptr < function_lib_loc) ||	(strcmp(info.dli_fname, function_lib)) && \
(((unsigned int)function_ptr < function_lib2_loc) || (strcmp(info.dli_fname, function_lib2)))) || \
((strcmp(info.dli_sname, function_name)) &&	(strcmp(info.dli_sname, function_name2)))) { \
trace(@"==> ERROR: %s not in %s!", function_name, function_lib); \
trace(@"==> Results: 0x%08x / 0x%08x, %s / %s",	(unsigned int)function_ptr, (unsigned int)function_lib_loc,info.dli_fname, info.dli_sname); \
[myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_f3NameAndInfo] \
withInfoName:[NSString stringWithFormat:VerifyFnIn, function_name, info.dli_fname]];\
return 1; \
} \
else if ((unsigned int)function_ptr == 0) { \
trace(@"==> ERROR: %s (%s) not found!", function_name, function_lib); \
return 0; \
} \
}


#pragma mark - Initialization

+ (VGuardDetectionManager *)sharedDetectionManager {
    static dispatch_once_t once;
    static VGuardDetectionManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self=[super init]) {
        myself=self;
        threatArray=[[NSMutableArray alloc] init];
        classArray=[[NSMutableArray alloc] init];
        self.isVGuardDetectionDone = NO;
        jailbreakDetectedByVOS = NO;
        runtimeTamperingDetectedByVOS = NO;
        self.isJailbrokenDetected = NO;
    }
    init_C_functions();
    return self;
}


#pragma mark - public methods

- (void)start {
    
    self.isVGuardDetectionDone = NO;
    [threatArray removeAllObjects];
    [classArray removeAllObjects];
    logCat(@"startScan");
    _vgBuildType = [[VGuardPrivateUtility sharedModule] buildConfiguration];
    switch (_vgBuildType) {
        case VGuard_Debug:
            trace("start scan in debug");
            break;
        case VGuard_Release:
            trace("start scan in release");
            break;
        default:
            break;
    }
    if (_vgBuildType==VGuard_Debug) NSLog(@"%@", NS_SCANSTART);
    
    current_dyld_count=0;
    protection_fatal_alert=0;
    
    
//#ifndef BYPASSL1L2
    logCat(@"Perform L1L2 Check");
    trace(@"Perform L1L2 Check");
    BOOL failedL1 = NO;
    failedL1 = [self checkBySignatures];
    BOOL failedL2 = NO;
    failedL2 = [self checkByHookLoadUnloadList];
    trace(@"Completed L1L2 check");
    logCat(@"Completed L1L2 check");
//#endif
    
//#ifndef BYPASSL3
    trace(@"Perform L3 Check");
    logCat(@"Perform L3 Check");
    BOOL failedL3 = NO;
    failedL3 = [self checkByFunctKernelPort];
    trace(@"Completed L3 check");
    logCat(@"Completed L3 check");
//#endif
    
//#ifndef BYPASSDEVICEAPPHASHCHECK
//    Should remove June/25
    if (_vgBuildType==VGuard_Debug) {
        trace("Application in DEBUG mode, skip application signer check");
    }
    else {
        trace("Perform Application Signer Hash Check %d",_stAppSignerDetection);
        if (_stAppSignerDetection == APP_SIGNER_CHECK_SUCCESS) {
//          DDCH  to update vtrack application, vguard need developer ids hash, Its better to get vos, becase currenly app signer check done by vos
            check_dev_or_enterprise_distribution();
        }
        [self isAppSignerCheckDetectedByVOS];
        [self isRuntimeTamperingDetected];
        trace("violatedApplicationIntegrityCheck: %d", _stAppSignerDetection);
    }
//#endif 
    trace("failedL1: %d -- failedL2: %d -- failedL3: %d", failedL1,failedL2,failedL3);
    NSString *logC = [NSString stringWithFormat:@"checkBySignatures: %d -- checkByHookLoadUnloadList: %d -- checkByFunctKernelPort: %d", failedL1,failedL2,failedL3];
    [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logC)];
    logCat(logC);
    
//#ifndef VGTEST
    [[self delegate] processVGuardScanResult:threatArray classInfo:classArray];
    if (_vgBuildType==VGuard_Debug) NSLog(@"%@", NS_SCANEND);
    logCat(NS_SCANEND);
    [threatArray removeAllObjects];
    [classArray removeAllObjects];
    self.isVGuardDetectionDone = YES;
}

#pragma mark - private methods

-(void)dyldThreatOrDebuggerThreat:(NSDictionary*)dictionaryList withInfoName:(NSString*)infoName
{
    NSString *threatClass = [dictionaryList objectForKey:kFileThreatClass];
    NSString *threatName  = [[dictionaryList objectForKey:kFileThreatName] stringValue];
    
    NSString *threatInfo;
    if ([infoName length]==0)
        threatInfo = [dictionaryList objectForKey:kFileThreatInfo];
    else
        threatInfo = infoName;
    trace("dyldThreatOrDebuggerThreat %@ %@ %@",threatClass,threatName,threatInfo);
    
    NSDictionary *dyldThreatDict = [self createDictionaryForThreats:threatClass name:threatName info:threatInfo];
    
    [[self delegate] processDyldThreatOrDebuggerThreat:[[NSArray alloc] initWithObjects:dyldThreatDict, nil]];
}

-(void)appendThreatArray:(NSDictionary*)dict withInfoName:(NSString*)path
{
    NSArray *threatInfo = [self fetchThreatsInfo:dict withInfoName:path];
    NSLog(@"🔴 Threat Info = %@", threatInfo);
    if (threatInfo == nil) {
        return;
    }
    NSString *logC = [NSString stringWithFormat:@"THREATCATEGORY - %@ THREATNAME - %@ THREATINFO - %@", [threatInfo objectAtIndex:THREATCATEGORY],[threatInfo objectAtIndex:THREATNAME],[threatInfo objectAtIndex:THREATINFO]];
    logCat(logC);
    [threatArray addObject:[self createDictionaryForThreats:[threatInfo objectAtIndex:THREATCATEGORY]
                                                       name:[threatInfo objectAtIndex:THREATNAME]
                                                       info:[threatInfo objectAtIndex:THREATINFO]]];
    if (![classArray containsObject:[threatInfo objectAtIndex:THREATCATEGORY]]) {
        [classArray addObject:[threatInfo objectAtIndex:THREATCATEGORY]];
        [classArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
}

- (BOOL)analyzeVOSCallback {
//    [self isRuntimeTamperingDetected];
    BOOL found = NO;
    if (!_isVGuardDetectionDone) {
        return found;
    }
    found =  ([self addDebuggerThreats] | [self isAppSignerCheckDetectedByVOS] | [self checkFileName]
              | [self isRuntimeTamperingDetected]);
    if (found) {
        [[self delegate] processVGuardScanResult:threatArray classInfo:classArray];
    }
    return found;
}

- (void)updateJailbreakDetectionStatus {
    jailbreakDetectedByVOS = YES;
    self.isJailbrokenDetected = YES;
}

- (void)updateRuntimeTamperingStatus {
    runtimeTamperingDetectedByVOS = YES;
}

/**
 * This check jailbreak detection status
 * Use non-related name, AP-502
 */
- (BOOL)checkFileName {
    if (jailbreakDetectedByVOS) {
        NSDictionary *L2OtherDict = [self fetchDictionaryForLevel:KL2_Other];
        NSDictionary *dic = [L2OtherDict valueForKey:kAppJailbrokenDetectedVOS];
        [self appendThreatArray:dic withInfoName:[dic valueForKey:kFileThreatInfo]];
        
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isDFPHookedDetectedByVOS{
    if (_stDFPHookDetection == 1) {
        NSDictionary *L2OtherDict = [self fetchDictionaryForLevel:KL2_Other];
        NSDictionary *dic = [L2OtherDict valueForKey:kAppDFPHookedDetectedVOS];
        [self appendThreatArray:dic withInfoName:[dic valueForKey:kFileThreatInfo]];
        return YES;
    }
    return NO;
}

- (BOOL)isCodeInjectionDetectedByVOS{
    if (_stCodeInjectionCheckDetection == 1) {
        NSDictionary *L2OtherDict = [self fetchDictionaryForLevel:KL2_Other];
        NSDictionary *dic = [L2OtherDict valueForKey:kAppCodeInjectionDetectedVOS];
        [self appendThreatArray:dic withInfoName:[dic valueForKey:kFileThreatInfo]];
        return YES;
    }
    return NO;
}

- (BOOL)isDebuggerCheckDetectedByVOS{
    BOOL found=NO;
#if !defined (DEBUG) && !defined (ENABLEGDB)
    NSDictionary *L2OtherDict = [self fetchDictionaryForLevel:KL2_Other];
    if(_vgBuildType != VGuard_Debug) {
        for (NSString *key in [L2OtherDict allKeys]) {
            NSDictionary *dic = [L2OtherDict valueForKey:key];
            int name = [[dic valueForKey:kFileThreatName]intValue];
            if ([self threatMatchForName:name]) {
                [self appendThreatArray:dic withInfoName:[dic valueForKey:kFileThreatInfo]];
                found = YES;
            }
        }
    }
    test_gdb(_vgBuildType);
#endif
    return found;
}

- (BOOL)isAppSignerCheckDetectedByVOS{
    BOOL found=NO;
    if (_stAppSignerDetection != APP_SIGNER_CHECK_SUCCESS) {
        [self appendThreatArray:[[self fetchDictionaryForLevel:kL4L5] objectForKey:kAppHashMismatch] withInfoName:nil];
        found = YES;
    }
    return found;
}

- (BOOL)isRuntimeTamperingDetected {
    if (runtimeTamperingDetectedByVOS) {
        NSDictionary *L2OtherDict = [self fetchDictionaryForLevel:KL2_Other];
        NSDictionary *dic = [L2OtherDict valueForKey:kRuntimeTamperingDetectedByVOS];
        
        [self appendThreatArray:dic withInfoName:[dic valueForKey:kFileThreatInfo]];
        
        return YES;
    }
    
    return NO;
}

- (BOOL)threatMatchForName:(int)name {
    int threatValue;
    name = name-80;
    if (name<0 || name>16) {
        return NO;
    }
    if ((name&DGB_IS_DEBUGGABLE) == DGB_IS_DEBUGGABLE) {
        threatValue = DGB_IS_DEBUGGABLE;
    }else if ((name&DBG_PFLAG_SET) == DBG_PFLAG_SET) {
        threatValue = DBG_PFLAG_SET;
    }else if ((name&DBG_IOS_EXCEPTION_PORT_OPENED) == DBG_IOS_EXCEPTION_PORT_OPENED) {
        threatValue = DBG_IOS_EXCEPTION_PORT_OPENED;
    }else if ((name&DBG_IOS_LLDB_ATTACHED) == DBG_IOS_LLDB_ATTACHED) {
        threatValue = DBG_IOS_LLDB_ATTACHED;
    }else if ((name&DBG_IOS_PPID_CHANGED) == DBG_IOS_PPID_CHANGED) {
        threatValue = DBG_IOS_PPID_CHANGED;
    }else{
        return NO;
    }
    if ((_stDebuggerCheckDetection&threatValue) == threatValue) {
        return YES;
    }
    return NO;
}


- (BOOL)addDebuggerThreats {
    return ([self isDebuggerCheckDetectedByVOS] | [self isDFPHookedDetectedByVOS] | [self isCodeInjectionDetectedByVOS]);
}

//alpine

-(BOOL)checkBySignatures //L1
{
    trace("in checkBySignatures");
    BOOL found=NO;
    found = [self addDebuggerThreats] | [self checkFileName];
    NSDictionary *L1Dict = [self fetchDictionaryForLevel:kL1];
    NSDictionary *L2Dict = [self fetchDictionaryForLevel:kL2]; 
    for (NSString *path in [L1Dict allKeys]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path])  {
            trace("jailbreak: %@:",path);
            NSDictionary *dict = [L1Dict objectForKey:path];
            if (!dict) {
                NSString *logStr = [NSString stringWithFormat:@"missing definition in signature: %@", path];
                [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                logCat(logStr);
                trace("%@", logStr);
            } else {
                [self appendThreatArray:dict withInfoName:path];
            }
            found=YES;
            break;
        }
    }
    //init for libraries check
    uint32_t imageCount=_dyld_image_count();
    char **names=calloc(sizeof(char *),imageCount);
    int32_t *versions=calloc(sizeof(int32_t),imageCount);
    trace("imagecount: %u",imageCount);
    
    for (uint32_t i=0; i<imageCount; i++) {
        names[i]=(char *)_dyld_get_image_name(i);
        versions[i]=NSVersionOfLinkTimeLibrary(names[i]);
        
        NSString *imageName = [NSString stringWithCString:names[i] encoding:NSUTF8StringEncoding];
        for (NSString *keys in [L1Dict allKeys]) {
            if ([imageName rangeOfString:keys].location != NSNotFound) {
                [self appendThreatArray:[L1Dict objectForKey:keys] withInfoName:imageName];
                found=YES;
                break;
            }
        }
    }
    
#pragma mark Screencaptures: kVeencyPath & OpenSSH
    
    NSArray *L2Keys = [L2Dict allKeys];
    
    for (NSString *path in L2Keys) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path])  {
            [self appendThreatArray:[L2Dict objectForKey:path] withInfoName:path];
            NSString *logString = [NSString stringWithFormat:@"threat path found: %@", path];
            logCat(logString);
            trace(@"%@", logString);
            found=YES;
        }
    }
    free(names);
    free(versions);
    return found;
}

- (BOOL)checkByHookLoadUnloadList { // L2
    trace("in checkByHooksLoadUnloadList");
    BOOL found=NO;
    
    struct statfs filefs;
    if (statfs("/", &filefs) == 0) {
        NSString *logStr = [NSString stringWithFormat:@"mount name: %@", [NSString stringWithUTF8String:filefs.f_mntonname]];
        logCat(logStr);
        trace(@"%@", logStr);
        
        if (memcmp(kernbypass_mount_slash_cstr, filefs.f_mntonname, strlen(kernbypass_mount_cstr)) == 0 || memcmp(kernbypass_mount_cstr, filefs.f_mntonname, strlen(kernbypass_mount_cstr)) == 0) {
            NSDictionary *L2OtherDict = [self fetchDictionaryForLevel:KL2_Other];
            [self appendThreatArray:[L2OtherDict valueForKey:kAppJailbrokenDetected] withInfoName:nil];
            found = YES;
        }
    }
    
    NSDictionary *L2Dict = [self fetchDictionaryForLevel:kL2];
    
    //jailbreaking detection
//    TODO: Chek with vos team
    char *env = getenv(DYLD_INSERT_LIBRARIES_cstr);
    if (env != NULL) {
        [self appendThreatArray:[L2Dict objectForKey:kJailbrokenEnv] withInfoName:nil];
        logCat(@"checkByHookLoadUnloadList - kJailbrokenEnv");
        found=YES;
    }
    
    //init for hook check
    uint32_t count=_dyld_image_count();
    void *uikit_loc=0;
    void *found_loc=0;
    void *corelocation_loc=0;
    void *corefound_loc=0;
    trace("imagecount: %u",count);
    //look for uikit & foundation in libraries
    for (uint32_t i=0; i<count; i++) {
        const char *check_image_name=_dyld_get_image_name(i);
        if (!strcmp(check_image_name,SystemLibFrameworkUIKit)) {
            uikit_loc=(void *)(unsigned long)(_dyld_get_image_header(i));
        }
        else if (!strcmp(check_image_name,SystemLibFrameworkFoundation)) {
            found_loc=(void *)(unsigned long)(_dyld_get_image_header(i));
        }
        else if (!strcmp(check_image_name,SystemLibFrameworkCorelocation)) {
            corelocation_loc=(void *)(unsigned long)(_dyld_get_image_header(i));
        }
        else if (!strcmp(check_image_name,SystemLibFrameworkCoreFoundation)) {
            corefound_loc=(void *)(unsigned long)(_dyld_get_image_header(i));
        }
    }
    //rootkit
    Class NSFileManager=NSClassFromString(kNSFileManager);
    IMP funcptr_NSFM=[NSFileManager instanceMethodForSelector:@selector(fileExistsAtPath:isDirectory:)];
    IMP funcptr_NSFM_fileExistAtPath=[NSFileManager instanceMethodForSelector:@selector(fileExistsAtPath:)];
    
    if ((int)funcptr_NSFM<(int)found_loc || (int)funcptr_NSFM_fileExistAtPath<(int)found_loc) {
        trace("rootkit: %d %d",(int)funcptr_NSFM, (int)funcptr_NSFM_fileExistAtPath);
        [self appendThreatArray:[L2Dict objectForKey:kNSFileManager] withInfoName:nil];
        
        NSString *logStr = @"checkByHookLoadUnloadList - kNSFileManager";
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
        logCat(logStr);
        found=YES;
    }
    
    // Jailbroken detectd by App Protection
    if (found == YES) {
        self.isJailbrokenDetected = YES;
    }
    
    //locationspoofers
    Class CLLocationManager = NSClassFromString(kCLLocationManager);
    Class CLLocation = NSClassFromString(kCLLocation);
    IMP funcptr_CLLocationManager_location = [CLLocationManager instanceMethodForSelector:@selector(location)];
    IMP funcptr_CLLocation_coordinate = [CLLocation instanceMethodForSelector:@selector(coordinate)];
    if (((int)funcptr_CLLocationManager_location<(int)corelocation_loc) || ((int)funcptr_CLLocation_coordinate<(int)corelocation_loc)) {
        trace("locationspoofers: location: %d coordinate: %d",(int)funcptr_CLLocationManager_location, (int)funcptr_CLLocation_coordinate);
        [self appendThreatArray:[L2Dict objectForKey:kCLLocationManager] withInfoName:nil];
        NSString *logStr = @"checkByHookLoadUnloadList - kCLLocationManager";
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
        logCat(logStr);
        found=YES;
    }
    //screencaptures
    Class UIWindow = NSClassFromString(kUIWindow);
    IMP funcptr_UIWindow_sendEvent = [UIWindow instanceMethodForSelector:@selector(sendEvent:)];
    
    // TODO: Find out which library Apple is using for screentime and whitelist the lib instead of bypassing the threat on iOS 12 and above.
    if (((int)funcptr_UIWindow_sendEvent < (int)uikit_loc)
        && (iOS_VERSION < 12.0)) {
        trace("screencaptures: %d",(int)funcptr_UIWindow_sendEvent);
        [self appendThreatArray:[L2Dict objectForKey:kUIWindow] withInfoName:nil];
        
        NSString *logStr = @"checkByHookLoadUnloadList - kUIWindow";
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
        logCat(logStr);
        found = YES;
    }
    
    //runtime tampering - Flex v2
    Class CNSArray = NSClassFromString(kNSArray);
    IMP funcptr_CNSArray_arrayByCollapsing = [CNSArray instanceMethodForSelector:@selector(arrayByCollapsing)];
    IMP funcptr_CNSArray_isSerializable = [CNSArray instanceMethodForSelector:@selector(isSerializable)];
    if ((int)funcptr_CNSArray_arrayByCollapsing != (int)funcptr_CNSArray_isSerializable) {
        if (((int)funcptr_CNSArray_arrayByCollapsing<(int)corefound_loc) && ((int)funcptr_CNSArray_isSerializable<(int)corefound_loc)) {
            trace("runtime patching Flex 2: arrayByCollapsing: %d isSerializable: %d",(int)funcptr_CNSArray_arrayByCollapsing, (int)funcptr_CNSArray_isSerializable);
            [self appendThreatArray:[L2Dict objectForKey:kNSArray] withInfoName:nil];
            
            NSString *logStr = @"checkByHookLoadUnloadList - kNSArray - Flex v2";
            [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
            logCat(logStr);
            found=YES;
        }
    }
    //runtime tampering - Flex v1
    Class CNSBundle = NSClassFromString(kNSBundle);
    IMP funcptr_CNSBundle_loadAndReturnError = [CNSBundle instanceMethodForSelector:@selector(loadAndReturnError:)];
    IMP funcptr_CNSBundle_load = [CNSBundle instanceMethodForSelector:@selector(load)];
    if (((int)funcptr_CNSBundle_loadAndReturnError<(int)found_loc) && ((int)funcptr_CNSBundle_load<(int)found_loc)) {
        trace("runtime patching Flex 1: loadAndReturnError: %d load: %d",(int)funcptr_CNSBundle_loadAndReturnError, (int)funcptr_CNSBundle_load);
        [self appendThreatArray:[L2Dict objectForKey:kNSArray] withInfoName:nil];
        
        NSString *logStr = @"checkByHookLoadUnloadList - kNSArray";
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
        logCat(logStr);
        found=YES;
    }
    
    return found;
}


-(BOOL)checkByFunctKernelPort //L3
{
    trace("in checkByKernelFunctPort");
    BOOL found=NO;

    //check C functions
    if (check_C_functions()) {
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(@"check_C_functions")];
        logCat(@"check_C_functions");
        found=YES;
    }
    
    if(check_C_functions_inline_hook()) {
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(@"check_C_functions_inline_hook")];
        logCat(@"check_C_functions_inline_hook");
        found=YES;
    }
    
    NSDictionary *L3Dict = [self fetchDictionaryForLevel:kL3];
    
    //init for kernel check
    int i=0, res=0;
    int mib[4];
    size_t plen;
    struct kinfo_proc kp;
    plen=4;
    
    // NOTE: iOS 9 appears to have blocked off access to kern.proc.pid; this chunk of code checking the process listing should either be
    //       (a) replaced with something else, if we can research into other ways to access to;
    //       (b) left as-if, if it can still work, for example on jailbroken phones when the iOS 9 jailbreak comes out, or
    //       (c) removed entirely
    //
    // We have a lot stronger protections against gdb / cycript at runtime now so the importance of these checks have diminished
    //
    // Note also that Apple still allows access to the network process listing, but the same considerations could apply for that in future.
    // For now we have also made that chunk of code fail gracefully, in case Apple closes that off in future.
    //
    // - Joseph Gan, 5 Oct 2015
    
    res=sysctlnametomib(kKernProcPid_cstr, mib, &plen);
    
    if (res==-1) {
        trace("sysctl error: %d",res);
    }
    else if (VG_IOS_VERSION_LESS_THAN(VG_IOS_9)) {
//        Due to kern.proc.pid sys call block in ios 9.0 onwards do only this test for bellow ios 9.0 versions.
        for (i=0; i<65535; i++)
        {
            mib[3]=i;
            plen=sizeof(kp);
            
            
            res=sysctl(mib, 4, &kp, &plen, NULL, 0);
            if (res !=-1 && plen>0) {
                // Part 1 of detections: search based on process names in process listing
                
                NSString *pid_path=[self pathFromProcessID:i];
                trace(@"%5d %5d %5d %s %@\n",kp.kp_proc.p_pid,kp.kp_eproc.e_pgid,kp.kp_eproc.e_ppid,kp.kp_proc.p_comm,pid_path);
                if (strstr(kp.kp_proc.p_comm, kSshd_ctsr)) {
#ifndef DEBUG
                    NSString *logStr = [NSString stringWithFormat:@"kernel: sshd process %d", kp.kp_proc.p_pid];
                    trace(@"%@", logStr);
                    [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                    logCat(logStr);
                    [self appendThreatArray:[L3Dict objectForKey:kKernSshd] withInfoName:nil];
                    found=YES;
#endif
                }
                else if (strstr(kp.kp_proc.p_comm, kGDB_cstr)) {
                    NSString *logStr = [NSString stringWithFormat:@"kernel: gdb process %d", kp.kp_proc.p_pid];
                    [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                    trace(@"%@", logStr);
                    logCat(logStr);
                    [self appendThreatArray:[L3Dict objectForKey:kGDB] withInfoName:nil];
                    found=YES;
                }
                else if (strstr(kp.kp_proc.p_comm, kCycript_cstr)) {
                    NSString *logStr = [NSString stringWithFormat:@"kernel: cycript process %d", kp.kp_proc.p_pid];
                    [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                    trace(@"%@", logStr);
                    logCat(logStr);
                    [self appendThreatArray:[L3Dict objectForKey:kCycript] withInfoName:nil];
                    found=YES;
                }
            }
        }
    } // end check for iOS < 9
    
    //init for port
    size_t len=0;
    res=sysctlbyname(kNetInetTcpPcblist_cstr, 0, &len, 0, 0);
    if (res<0) {
        // Prelude to Part 2: If sysctlbyname function call fails, fail gracefully
        trace("sysctl error: %d",res);
    }
    else {
        char *mibvar=kNetInetTcpPcblist_cstr;
        char *buf;
        buf=(char*)malloc(sizeof(char) * len);
        res=sysctlbyname(mibvar, buf, &len, 0, 0);
        if (res<0) {
            // Another prelude to Part 2: If sysctlbyname function call fails, fail gracefully
            free(buf);
            trace("sysctl error: %d",res);
        }
        else {
#if !TARGET_IPHONE_SIMULATOR /* bypass for simulator start - 0 */
            
            struct xinpgen *xig;
            struct inpcb *inp;
            struct xsocket *so;
            
            // Part 2 of detections: search based on listening ports in network connection listing
            xig = (struct xinpgen *)buf;
            for (xig=(struct xinpgen *)((char *)xig + xig->xig_len); xig->xig_len>sizeof(struct xinpgen); xig=(struct xinpgen *)((char *)xig + xig->xig_len)) {

                inp=&((struct xtcpcb *)xig)->xt_inp;
                so=&((struct xtcpcb *)xig)->xt_socket; 
                
                // ignore local connections
                if ((inp->inp_laddr.s_addr==((1 << 24) + 127))&&(inp->inp_faddr.s_addr==((1 << 24) + 127)))
                    continue;
                // swap port endianness
                unsigned short lport=((inp->inp_lport >> 8) & 0xff)|((inp->inp_lport & 0xff) << 8);
                unsigned short fport=((inp->inp_fport >> 8) & 0xff)|((inp->inp_fport & 0xff) << 8);
                trace(@"Local %d.%d.%d.%d:%d, Remote %d.%d.%d.%d:%d, UID %d, State %d",
                      (inp->inp_laddr.s_addr      ) & 0xff,
                      (inp->inp_laddr.s_addr >>  8) & 0xff,
                      (inp->inp_laddr.s_addr >> 16) & 0xff,
                      (inp->inp_laddr.s_addr >> 24) & 0xff,
                      lport,
                      (inp->inp_faddr.s_addr      ) & 0xff,
                      (inp->inp_faddr.s_addr >>  8) & 0xff,
                      (inp->inp_faddr.s_addr >> 16) & 0xff,
                      (inp->inp_faddr.s_addr >> 24) & 0xff,
                      fport,
                      so->so_uid, so->so_state);
                if ((inp->inp_laddr.s_addr==0)&&(inp->inp_faddr.s_addr==0)&&(lport!=62078)) {
                    if (lport==22) {
                        
                        // Port 22 is commonly used by SSH server, and also has to be opened by root user
                        
#ifndef DEBUG
                        NSString *logStr = @"found port 22";
                        trace(@"%@", logStr);
                        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                        logCat(logStr);
                        [self appendThreatArray:[L3Dict objectForKey:kPort22] withInfoName:[NSString stringWithFormat:kPortUID,lport,so->so_uid]];
                        found=YES;
#endif
                    }
                    else if (lport==5900) {
                        // Port 5900 is commonly used by VNC server
                        NSString *logStr = @"found port 5900";
                        trace(@"%@", logStr);
                        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                        logCat(logStr);
                        [self appendThreatArray:[L3Dict objectForKey:kPort5900] withInfoName:[NSString stringWithFormat:kPortUID,lport,so->so_uid]];
                        found=YES;
                    }
                    else if ((so->so_uid==0) && (lport!=0)) {
                        // Ignore other ports, UNLESS they are owned by a root process, in which case assume they are a backdoor
                        NSString *logStr = [NSString stringWithFormat:@"non-user port %d", lport];
                        trace(@"%@", logStr);
                        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
                        logCat(logStr);
                        [self appendThreatArray:[L3Dict objectForKey:kPort501] withInfoName:[NSString stringWithFormat:kPortUID,lport,so->so_uid]];
                        found=YES;
                    }
                }
            }
            free(buf);
            
#endif /* bypass for simulator end - 0 */
        }
    }
    
    //debugger check - previously in macro
#if !defined (DEBUG) && !defined (ENABLEGDB)
    size_t size = sizeof(struct kinfo_proc);
    struct kinfo_proc info;
    int name[4];
    memset(&info,0,sizeof(struct kinfo_proc));
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID;
    name[3] = getpid();
    //this means debugger check got problem
    if((sysctl(name,4,&info,&size,NULL,0))) {
        
        // Prelude to part 3: Assume an error with sysctl function call here indicates an anti-debugging attack
        // We now have many anti-debugging protections, and we want to fail gracefully if Apple blocks off this check
        
        //silent report don exit
        //[self appendThreatArray:[L3Dict objectForKey:kDebugging] withInfoName:nil];
        //found=YES;
    }
    if(info.kp_proc.p_flag & P_TRACED) {

        // Part 3: If our current process is being traced, report that a debugger is attached
        NSString *logStr = @"ptraced is found";
        trace(@"%@", logStr);
        [VGLogManager vosLogWithLevel:LOG_LEVEL_INFO mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(logStr)];
        logCat(logStr);
        //silent report don exit
        [self appendThreatArray:[L3Dict objectForKey:kPTrace] withInfoName:nil];
        found=YES;
    }
#endif

    return found;
}

-(NSString *)pathFromProcessID:(int)pid //previously in C
{
    // First ask the system how big a buffer we should allocate
    int mib[3]={CTL_KERN, KERN_ARGMAX, 0};
    size_t argmaxsize=sizeof(size_t);
    size_t size;
    int real_size;
    int ret=sysctl(mib, 2, &size, &argmaxsize, NULL, 0);
    if (ret!=0) {
        trace("Error '%s' (%d) getting KERN_ARGMAX",strerror(errno),errno);
        [self appendThreatArray:[[self fetchDictionaryForLevel:kL3] objectForKey:kKernArgmax] withInfoName:nil];
        return nil;
    }
    
    // Then we can get the path information we actually want
    mib[1] = KERN_PROCARGS2;
    mib[2] = pid;
    
    // workaround for sysctl's bug in handling 64-bit size_t
    real_size = size;
    size = real_size;
    
    char *procargv = malloc(real_size);
    ret=sysctl(mib, 3, procargv, &size, NULL, 0);
    if (ret!=0) {
        free(procargv);
        return nil;
    }
    
    NSString *path=[NSString stringWithCString:(procargv + sizeof(size_t)) encoding:NSASCIIStringEncoding];
    free(procargv);
    return path;
}

-(void)sendApplicationSignerWS
{
    [[self delegate] sendApplicationSignerWS:APPLE_SIGNER];
}


#pragma mark - private C methods

static inline void init_C_functions(void)
{
    trace("in init_C_functions");
    void* handle = dlopen(0,RTLD_GLOBAL|RTLD_NOW);
    _dyld_image_count_ptr = dlsym(handle,_dyld_image_count_cstr);
    _dyld_get_image_name_ptr = dlsym(handle,_dyld_get_image_name_cstr);
    _dyld_get_image_header_ptr = dlsym(handle, _dyld_get_image_header_cstr);
    dladdr_ptr = dlsym(handle,dladd_cstr);
    sysctlnametomib_ptr = dlsym(handle,sysctlnametomib_cstr);
    sysctl_ptr = dlsym(handle,sysctl_cstr);
    strstr_ptr = dlsym(handle,strstr_cstr);
    if (!strstr_ptr) {
        strstr_ptr = dlsym(handle, platform_strstr_cstr);
    }
    sysctlbyname_ptr = dlsym(handle,sysctlbyname_cstr);
    _dyld_register_func_for_add_image_ptr = dlsym(handle,_dyld_register_func_for_add_image_cstr);
    _dyld_register_func_for_remove_image_ptr = dlsym(handle,_dyld_register_func_for_remove_image_cstr);
    class_getName_ptr = dlsym(handle,class_getName_cstr);
    class_copyMethodList_ptr = dlsym(handle,class_copyMethodList_cstr);
    method_getName_ptr = dlsym(handle,kMethodGetName_cstr);
    method_getImplementation_ptr = dlsym(handle,kMethodGetImplementation_cstr);
    strcmp_ptr = dlsym(handle,strcmp_cstr);
    if (!strcmp_ptr) {
        strcmp_ptr = dlsym(handle, _platform_strcmp);
    }
    time_ptr = dlsym(handle,time_cstr);
    exit_ptr = dlsym(handle,exit_cstr);
    sleep_ptr = dlsym(handle,sleep_cstr);
    strlen_ptr = dlsym(handle,strlen_cstr);
    if (!strlen_ptr) {
        strlen_ptr = dlsym(handle, platform_strlen_cstr);
    }
    strncpy_ptr = dlsym(handle,strncpy_cstr);
    if (!strncpy_ptr) {
        strncpy_ptr = dlsym(handle, platform_strncpy_cstr);
    }
    strtoull_ptr = dlsym(handle,strtoull_cstr);
    memcpy_ptr = dlsym(handle,memcpy_cstr);
    memcmp_ptr = dlsym(handle,memcmp_cstr);
    if (!memcmp_ptr) {
        memcmp_ptr = dlsym(handle, _platform_memcmp);
    }
    fork_ptr = dlsym(handle,fork_cstr);
    trunc_ptr = dlsym(handle,trunc_cstr);
    CC_SHA1_ptr = dlsym(handle,CC_SHA1_cstr);
    CC_SHA256_ptr = dlsym(handle,CC_SHA256_cstr);
    CCCrypt_ptr = dlsym(handle,CCCrypt_cstr);
    SecItemAdd_ptr = dlsym(handle,SecItemAdd_cstr);
    SecItemDelete_ptr = dlsym(handle,SecItemDelete_cstr);
    SecItemCopyMatching_ptr = dlsym(handle,SecItemCopyMatching_cstr);
    SecCertificateCopyData_ptr = dlsym(handle,SecCertificateCopyData_cstr);
    SecTrustGetCertificateAtIndex_ptr = dlsym(handle,SecTrustGetCertificateAtIndex_cstr);
    SSLWrite_ptr = dlsym(handle,SSLWrite_cstr);
    SSLRead_ptr = dlsym(handle,SSLRead_cstr);
    dlsym_ptr = dlsym(handle,dlsym_cstr);
    dlopen_ptr = dlsym(handle,dlopen_cstr);
    dlclose_ptr = dlsym(handle,dlclose_cstr);
    dlclose(handle);
}

static inline int check_C_functions(void)
{
    trace("in check_C_functions");
    uint32_t imageCount;
    char **names;
    int32_t *versions;
    unsigned int libLoc;
    unsigned int loc_libsystem_c=0, loc_libSystem_B=0, loc_libsystem_m=0, loc_libsystem_p=0;
    unsigned int loc_libdyld=0, loc_libcommonCrypto=0, loc_libSecurityFramework=0;
    
    imageCount = _dyld_image_count_ptr();
    trace(@"imageCount: %u", imageCount);
    names = calloc(sizeof(char *), imageCount);
    versions = calloc(sizeof(int32_t), imageCount);
    for (uint32_t idx=0; idx<imageCount; idx++) {
        names[idx]=(char *)_dyld_get_image_name_ptr(idx);
        libLoc=(unsigned int)_dyld_get_image_header_ptr(idx);
        if (strstr(names[idx], usrlibsystemlibsystem_c_dylib) > 0) {
            loc_libsystem_c = libLoc;
        } else if (strstr(names[idx], usrlibsystemlibsystem_platform_dylib) > 0) {
            loc_libsystem_p = libLoc;
        } else if (strstr(names[idx], usrlibsystemlibsystem_m_dylib) > 0) {
            loc_libsystem_m = libLoc;
        } else if (strstr(names[idx], usrliblibSystem_B_dylib) > 0) {
            loc_libSystem_B = libLoc;
        } else if (strstr(names[idx], usrlibsystemlibdyld_dylib) > 0) {
            loc_libdyld = libLoc;
        } else if (strstr(names[idx], usrlibsystemlibcommonCrypto_dylib) > 0) {
            loc_libcommonCrypto = libLoc;
        } else if (strstr(names[idx], SystemLibSecurity) > 0) {
            loc_libSecurityFramework = libLoc;
        }
    }
    
    free(names);
    free(versions);
    
    /* Match c function pointer to library source */
    Dl_info info;
    verify_fn(SSLWrite_ptr, SSLWrite_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_fn(SSLRead_ptr, SSLRead_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_f2(sysctlbyname_ptr,sysctlbyname_cstr,loc_libsystem_c, usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(sysctlnametomib_ptr,sysctlnametomib_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(time_ptr,time_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(exit_ptr,exit_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(sleep_ptr,sleep_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    
    if ([myself deviceFirmwareIsGreaterThanOrEqualTo:@"12.0"]) {
        verify_f2(strstr_ptr,platform_strstr_cstr,loc_libsystem_c,usrlibsystemlibsystem_platform_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
        verify_f2(strlen_ptr,platform_strlen_cstr,loc_libsystem_c,usrlibsystemlibsystem_platform_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
        verify_f2(strncpy_ptr,platform_strncpy_cstr,loc_libsystem_c,usrlibsystemlibsystem_platform_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    } else {
        verify_f2(strstr_ptr,strstr_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
        verify_f2(strlen_ptr,strlen_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
        verify_f2(strncpy_ptr,strncpy_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    }
    
    verify_f2(strtoull_ptr,strtoull_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f3(fork_ptr,fork_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib,__fork);
    // trunc found in libsystem_m for iOS 6
    verify_f2(trunc_ptr,trunc_cstr,loc_libSystem_B,usrliblibSystem_B_dylib,loc_libsystem_m,usrlibsystemlibsystem_m_dylib);
    verify_f2(dladdr_ptr,dladd_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(_dyld_image_count_ptr,_dyld_image_count_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(_dyld_get_image_name_ptr,_dyld_get_image_name_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(_dyld_get_image_header_ptr,_dyld_get_image_header_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(_dyld_register_func_for_add_image_ptr,_dyld_register_func_for_add_image_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
   	verify_f2(_dyld_register_func_for_remove_image_ptr,_dyld_register_func_for_remove_image_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(CC_SHA1_ptr,CC_SHA1_cstr,loc_libcommonCrypto,usrlibsystemlibcommonCrypto_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(CC_SHA256_ptr,CC_SHA256_cstr,loc_libcommonCrypto,usrlibsystemlibcommonCrypto_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(CCCrypt_ptr,CCCrypt_cstr,loc_libcommonCrypto,usrlibsystemlibcommonCrypto_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_fn(SecItemAdd_ptr,SecItemAdd_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_fn(SecItemDelete_ptr,SecItemDelete_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_fn(SecItemCopyMatching_ptr,SecItemCopyMatching_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_fn(SecCertificateCopyData_ptr,SecCertificateCopyData_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_fn(SecTrustGetCertificateAtIndex_ptr,SecTrustGetCertificateAtIndex_cstr,loc_libSecurityFramework,SystemLibSecurity);
    verify_f2(dlsym_ptr,dlsym_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(dlopen_ptr,dlopen_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    verify_f2(dlclose_ptr,dlclose_cstr,loc_libdyld,usrlibsystemlibdyld_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    
    if ([myself deviceFirmwareIsGreaterThanOrEqualTo:@"7.0"])
    {
        verify_f2(strcmp_ptr,_platform_strcmp,loc_libsystem_p,usrlibsystemlibsystem_platform_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
        verify_f2(memcmp_ptr,_platform_memcmp,loc_libsystem_p,usrlibsystemlibsystem_platform_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    }
    else
    {
        verify_f2(strcmp_ptr,strcmp_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
        verify_f2(memcmp_ptr,bcmp_cstr,loc_libsystem_c,usrlibsystemlibsystem_c_dylib,loc_libSystem_B,usrliblibSystem_B_dylib);
    }
    return 0;
}

#pragma mark - LC CODE SIGNATURE

static inline BOOL check_dev_or_enterprise_distribution(void)
{
#ifdef __LP64__
    const struct mach_header_64 *image_header = (const struct mach_header_64 *)(unsigned long)_dyld_get_image_header(0);
#else
    const struct mach_header *image_header = (const struct mach_header *)(unsigned long)_dyld_get_image_header(0);
#endif
    Dl_info info;
    dladdr(image_header, &info);
    
    char img[PATH_MAX+1];
    realpath(info.dli_fname, img);
    int des = syscall(SYS_open, img, O_RDONLY);
    off_t head_offset = read_head_offset(des, image_header->cpusubtype);
    if (head_offset == 1) {
        trace(@"invalid head_offset");
    }
    
    uintptr_t cur = (uintptr_t)image_header + sizeof(mach_header_t);
    load_command_t *cur_ld_cmd = NULL;
    linkedit_data_command_t *code_sig_cmd = NULL;
    
    //find offset and size of code-section of the library
    for (uint i = 0; i < image_header->ncmds; i++, cur += cur_ld_cmd->cmdsize)
    {
        cur_ld_cmd = (load_command_t *)cur;
        if (cur_ld_cmd->cmd == LC_CODE_SIGNATURE)
        {
            code_sig_cmd = (linkedit_data_command_t *)cur;
            break;
        }
    }
    
    bool violatedAppCheck = false;
    if (code_sig_cmd == NULL) {
        trace(@"LC_CODE_SIGNATURE section is missing");
        close(des);
        violatedAppCheck = true;
        return violatedAppCheck;
    }
    
    unsigned char *data = malloc(code_sig_cmd->datasize);
    read_file(des, data, head_offset + code_sig_cmd->dataoff, code_sig_cmd->datasize);
    
    //certificate characteristic for Developer or Enterprise Distribution
    char *characteristic = iPhoneDeveloper_cstr;
    char *characteristic2 = iPhoneDistribution_cstr;
    
    void *developername = memmem(data, code_sig_cmd->datasize, characteristic, strlen(characteristic));
    void *distributionname = memmem(data, code_sig_cmd->datasize, characteristic2, strlen(characteristic2));
    if (developername != NULL) {
        violatedAppCheck = [myself checkAppCertificatesforDevEnterpriseDistribution:developername];
    } else if (distributionname != NULL) {
        violatedAppCheck = [myself checkAppCertificatesforDevEnterpriseDistribution:distributionname];
    } else {
        violatedAppCheck = [myself checkAppEncryptionforAppStoreApp];
        if (!violatedAppCheck) {
            [myself sendApplicationSignerWS];//send application signer WS, if not violated
        }
    }
    free(data);
    close(des);
    return violatedAppCheck;
}

static ssize_t read_file(int f, unsigned char *buf, size_t offset, size_t count)
{
    
    if (lseek(f, offset, SEEK_SET) < 0)
        return -1;
    
    return read(f, buf, count);
}

static off_t read_head_offset(int descriptor, int arch)
{
    uint32_t magic;
    
    uint32_t nfat_arch, i;
    struct fat_arch const *fat_archs = 0;
    struct fat_arch const *fat_arch_i;
    
    if (read(descriptor, &magic, sizeof(uint32_t)) != sizeof(uint32_t))
        return INVALID_OFFSET;
    
    //if only one architecture
    if (magic == MH_MAGIC_ARCH_DEPENDENT)
        return 0;
    
    magic = OSSwapInt32(magic);
    
    if (magic != FAT_MAGIC){
        return INVALID_OFFSET;
    }
    
    //if fat binary
    if (read(descriptor, &nfat_arch, sizeof(uint32_t)) != sizeof(uint32_t))
        return INVALID_OFFSET;
    
    nfat_arch = OSSwapInt32(nfat_arch);
    unsigned char buf[nfat_arch * sizeof(struct fat_arch)];
    
    ssize_t len = read_file(descriptor, buf, sizeof(struct fat_header), nfat_arch * sizeof(struct fat_arch));
    fat_archs = (struct fat_arch const *)buf;
    
    if (len == -1)
        return INVALID_OFFSET;
    
    for (fat_arch_i = fat_archs, i = 0; i < nfat_arch; ++fat_arch_i, ++i)
    {
        cpu_type_t cpu_type = fat_arch_i->cputype;
        cpu_type = OSSwapInt32(cpu_type);
        
        if (cpu_type == CPU_TYPE_ARM || cpu_type == CPU_TYPE_ARM64)
            //if (cpu_type == CPU_TYPE_ARM)
        {
            cpu_subtype_t cpu_subtype = fat_arch_i->cpusubtype;
            cpu_subtype = OSSwapInt32(cpu_subtype);
            if (cpu_subtype == arch)
                return OSSwapInt32(fat_arch_i->offset);
        }
    }
    return INVALID_OFFSET;
}

static inline int check_C_functions_inline_hook(void) {
    char strcmp_str[20];
    
    if ([myself deviceFirmwareIsGreaterThanOrEqualTo:@"7.0"]) {
        strlcpy(strcmp_str, _platform_strcmp, sizeof(strcmp_str));
    } else {
        strlcpy(strcmp_str, strcmp_cstr, sizeof(strcmp_str));
    }
    
    const char *func[22][3] = {
        {dlopen_cstr,  usrlibsystemlibdyld_dylib, NULL},
        {dladd_cstr, usrlibsystemlibdyld_dylib,NULL},
        {dlsym_cstr, usrlibsystemlibdyld_dylib, NULL},
        {dlclose_cstr, usrlibsystemlibdyld_dylib},
        {malloc_cstr, usrlibsystemlibsystem_c_dylib, usrlibsystemlibsystem_malloc_dylib},
        {strcmp_str, usrlibsystemlibsystem_c_dylib, usrlibsystemlibsystem_platform_dylib},
        {strstr_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {fopen_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {system_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {popen_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {fork_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {sysctl_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {getenv_cstr, usrlibsystemlibsystem_c_dylib, NULL},
        {stat_cstr, usrlibsystemlibsystem_kernel_dylib, NULL},
        {lstat_cstr, usrlibsystemlibsystem_kernel_dylib, NULL},
        {access_cstr, usrlibsystemlibsystem_kernel_dylib, NULL},
        {symlink_cstr, usrlibsystemlibsystem_kernel_dylib, NULL},
        {__open__cstr, usrlibsystemlibsystem_kernel_dylib, NULL},
        {__connect_cstr, usrlibsystemlibsystem_kernel_dylib, NULL},
        {__ptrace, usrlibsystemlibsystem_kernel_dylib, NULL},
        {SSLRead_cstr,SystemLibSecurity,NULL},
        {SSLWrite_cstr,SystemLibSecurity,NULL},
    };
    
    int func_size = sizeof(func) / sizeof(func[0]);
    int isHook = 0;
    
#if !TARGET_IPHONE_SIMULATOR /* bypass for simulator start - 0 */
    const char *cache_path = default_shared_cache_path();
    int fd = open(cache_path, O_RDONLY);
    
    if (fd == -1) {
        cache_path = IPHONE_DYLD_SHARED_CACHE_DIR DYLD_SHARED_CACHE_BASE_NAME "armv7s";
        fd = open(cache_path, O_RDONLY);
        if (fd == -1) {
            trace("fd: %d, unable to find cache path", fd);
            return 0;
        }
    }
    
    struct stat statbuf;
    stat(cache_path, &statbuf);
    unsigned char *cache_data = (unsigned char*)mmap(NULL, statbuf.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    close(fd);
    
    // FGS: We do not perform the following if cache_data has errors
    // Happened on Sheila's iPhone 4 (iOS 7.1.2)
    if (cache_data == MAP_FAILED) {
         trace(@"error: %s", strerror(errno));
    } else {
        // read info of the images
        dyld_cache_header_t *cache_header = (dyld_cache_header_t *) cache_data;
        dyld_cache_image_info_t *cache_image_info = (dyld_cache_image_info_t *) (cache_data + cache_header->imagesOffset);
        
        for (int i = 0; i < _dyld_image_count(); i++) {
            int startlibcheck = 0;
            const struct mach_header *image_header = (const struct mach_header *)(unsigned long)_dyld_get_image_header(i);
            Dl_info info;
            dladdr(image_header, &info);
            // check library name
            if (strcmp(_dyld_get_image_name(i), info.dli_fname) != 0) {
                continue;
            }
            // only start the verification for the library that we specific
            for (int k = 0; k < func_size; k++) {
                if (strstr(info.dli_fname, func[k][1]) != 0) {
                    startlibcheck = 1;
                    break;
                }
            }
            if (startlibcheck) {
                off_t offset = 0;
                size_t count = 0;
                uintptr_t cur = (uintptr_t)image_header + sizeof(mach_header_t);
                segment_command_t *cur_seg_cmd;
                // find offset and size of code-section of the library
                for (uint i = 0; i < image_header->ncmds; i++, cur += cur_seg_cmd->cmdsize) {
                    cur_seg_cmd = (segment_command_t *)cur;
                    if (cur_seg_cmd->cmd == LC_SEGMENT_ARCH_DEPENDENT && strcmp(cur_seg_cmd->segname, SEG_TEXT) == 0) {
                        for (uint j = 0; j < cur_seg_cmd->nsects; j++) {
                            section_t *sect = (section_t *)(cur + sizeof(segment_command_t)) + j;
                            if (strcmp(sect->sectname, SECT_TEXT) == 0) {
                                offset = sect->addr - cur_seg_cmd->vmaddr;  //0x8980 - 0x4000
                                count = sect->size;
                                break;
                            }
                        }
                        break;
                    }
                }
                unsigned char *mem = (unsigned char *) ((off_t)image_header + offset);
                unsigned char *disk = (unsigned char *) malloc(count);
                int des = open(info.dli_fname, O_RDONLY);
                // extract code-section of the library either from physical file or from dyld_shared_cache_armvX file
                if (des == -1) {
                    
                    if (cache_header->imagesCount > 0) {
                        for (int j = 0; j < cache_header->imagesCount; j++) {
                            const char *img_name = (const char *) (cache_data + cache_image_info[j].pathFileOffset);
                            if (strcmp(info.dli_fname, img_name) == 0) {
                                shared_file_mapping_np_t *mapping = (shared_file_mapping_np_t *) (cache_data + cache_header->mappingOffset);
                                off_t startaddr = cache_image_info[j].address - mapping->sfm_address;
                                memcpy(disk, cache_data + startaddr + offset, count);
                                break;
                            }
                        }
                    } else {
                        trace(@"can not retrieve Cache header");
                        free(disk);
                        return isHook;
                    }
                    
                } else {
                    off_t head_offset = read_head_offset(des, image_header->cpusubtype);
                    if (head_offset == INVALID_OFFSET) {
                        free(disk);
                        continue;
                    }
                    read_file(des, disk, head_offset + offset, count);
                    close(des);
                }
                // compare the obtained code-sections
                for (size_t n = 0; n < count; n++) {
                    if (mem[n] != disk[n]) {
                        // find the hooked functions
                        Dl_info tmp;
                        dladdr((const void *) (mem + n), &tmp);
                        if (tmp.dli_saddr != info.dli_saddr && tmp.dli_saddr != 0) {
                            info = tmp;
                            for (int k = 0; k < func_size; k++) {
                                if (strcmp(info.dli_sname, func[k][0]) == 0) {
                                    isHook = 1;
                                    [myself appendThreatArray:[[myself fetchDictionaryForLevel:kL3] objectForKey:kVerify_f2NameAndInfo] withInfoName:[NSString stringWithFormat:kVerifyFn_Inline, func[k][0], info.dli_fname]];
                                    trace("INLINE HOOK FOUND: %s / %s\n", info.dli_fname, info.dli_sname);
                                }
                            }
                        }
                        
                    }
                }
                free(disk);
            }
        }
        munmap(cache_data, (long)statbuf.st_size);
    }
#endif /* bypass for simulator end - 0 */
    return isHook;
}

int check_C_functions_inline_hook_outOfBand(const char* func[][3], int func_size) {
    int isHook = 0;
    const char *cache_path = default_shared_cache_path();
    int fd = open(cache_path, O_RDONLY);
    if (fd == -1) {
        trace("fd: %d, unable to find cache path", fd);
        return 0;
    }
    
    // read info of the images
    dyld_cache_header_t cache_header;
    pread(fd, &cache_header, sizeof(cache_header), 0);
    
    for (int i = 0; i < _dyld_image_count(); i++) {
        int startlibcheck = 0;
        const struct mach_header *image_header = (const struct mach_header *)(unsigned long)_dyld_get_image_header(i);
        Dl_info info;
        dladdr(image_header, &info);
        // check library name
        if (strcmp(_dyld_get_image_name(i), info.dli_fname) != 0) {
            continue;
        }
        // only start the verification for the library that we specific
        for (int k = 0; k < func_size; k++) {
            if (strstr(info.dli_fname, func[k][1]) != 0) {
                startlibcheck = 1;
                break;
            }
        }
        if (startlibcheck) { // check dylib in the List
            off_t offset = 0;
            size_t count = 0;
            uintptr_t cur = (uintptr_t)image_header + sizeof(mach_header_t);
            segment_command_t *cur_seg_cmd;
            // find offset and size of code-section of the library
            for (uint i = 0; i < image_header->ncmds; i++, cur += cur_seg_cmd->cmdsize) {
                cur_seg_cmd = (segment_command_t *)cur;
                if (cur_seg_cmd->cmd == LC_SEGMENT_ARCH_DEPENDENT && strcmp(cur_seg_cmd->segname, SEG_TEXT) == 0) {
                    for (uint j = 0; j < cur_seg_cmd->nsects; j++) {
                        section_t *sect = (section_t *)(cur + sizeof(segment_command_t)) + j;
                        if (strcmp(sect->sectname, SECT_TEXT) == 0) {
                            offset = sect->addr - cur_seg_cmd->vmaddr;  //0x8980 - 0x4000
                            count = sect->size;
                            break;
                        }
                    }
                    break;
                }
            }
            unsigned char *mem = (unsigned char *) ((off_t)image_header + offset);
            unsigned char *disk = (unsigned char *) malloc(count);
            int des = open(info.dli_fname, O_RDONLY);
            // extract code-section of the library either from physical file or from dyld_shared_cache_armvX file
            if (des == -1) {
                
                if (cache_header.imagesCount > 0) {
                    for (int j = 0; j < cache_header.imagesCount; j++) {
                        dyld_cache_image_info_t cache_image_info;
                        pread(fd, &cache_image_info, sizeof(cache_image_info), cache_header.imagesOffset + j*sizeof(cache_image_info));
                        char img_name[PATH_MAX];
                        pread(fd, img_name, PATH_MAX, cache_image_info.pathFileOffset);
                        if (strcmp(info.dli_fname, img_name) == 0) {
                            shared_file_mapping_np_t mapping;
                            pread(fd, &mapping, sizeof(mapping), cache_header.mappingOffset);
                            off_t startaddr = cache_image_info.address - mapping.sfm_address;
                            pread(fd, disk, count, startaddr + offset);
                            break;
                        }
                    }
                } else {
                    trace(@"can not retrieve Cache header");
                    free(disk);
                    return isHook;
                }
                
            } else { // file open succeeded
                off_t head_offset = read_head_offset(des, image_header->cpusubtype);
                if (head_offset == INVALID_OFFSET) {
                    free(disk);
                    continue;
                }
                read_file(des, disk, head_offset + offset, count);
                close(des);
            }
            // compare the obtained code-sections
            for (size_t n = 0; n < count; n++) {
                if (mem[n] != disk[n]) {
                    // find the hooked functions
                    Dl_info tmp;
                    dladdr((const void *) (mem + n), &tmp);
                    if (tmp.dli_saddr != info.dli_saddr && tmp.dli_saddr != 0) {
                        info = tmp;
                        for (int k = 0; k < func_size; k++) {
                            if (strstr(info.dli_sname, func[k][0]) != 0) {
                                isHook = 1;
                            }
                        }
                    }
                }
            }
            free(disk);
        }
    }
    close(fd);
    return isHook;
}

-(NSDictionary*) getMobileProvision
{
    static NSDictionary* mobileProvision = nil;
    if (!mobileProvision) {
        NSString *provisioningPath = EMBEDDED_MOBILEPROVISION_PATH;
        if (!provisioningPath) {
            return nil;
        }
        // NSISOLatin1 keeps the binary wrapper from being parsed as unicode and dropped as invalid
        NSString *binaryString = [NSString stringWithContentsOfFile:provisioningPath encoding:NSISOLatin1StringEncoding error:NULL];
        if (!binaryString) {
            return nil;
        }
        NSScanner *scanner = [NSScanner scannerWithString:binaryString];
        BOOL ok = [scanner scanUpToString:@"<plist" intoString:nil];
        if (!ok) {
            trace(@"unable to find beginning of plist");
            return nil;
        }
        NSString *plistString;
        ok = [scanner scanUpToString:@"</plist>" intoString:&plistString];
        if (!ok) {
            trace(@"unable to find end of plist");
            return nil;
        }
        plistString = [NSString stringWithFormat:@"%@</plist>",plistString];
        // juggle latin1 back to utf-8!
        NSData *plistdata_latin1 = [plistString dataUsingEncoding:NSISOLatin1StringEncoding];
        NSError *error = nil;
        mobileProvision = [NSPropertyListSerialization propertyListWithData:plistdata_latin1 options:NSPropertyListImmutable format:NULL error:&error];
        if (error) {
            trace(@"error parsing extracted plist — %@",error);
            return nil;
        }
    }
    return mobileProvision;
}

- (BOOL)checkAppCertificatesforDevEnterpriseDistribution:(void *)signername {
    NSString *signer = [NSString stringWithUTF8String:signername];
    BOOL violatedApplicationCertValidity=YES;
    BOOL matchSignerName=NO;

    NSDictionary *mobileProvision = [self getMobileProvision];
    if (!mobileProvision) {
        trace(@"embeded.mobileprovision not found");
        return violatedApplicationCertValidity;
        
    } else if ([mobileProvision objectForKey:kDeveloperCertificates] == nil) {
        trace(@"embeded.mobileprovision content not valid");
        return violatedApplicationCertValidity;
    }
    NSArray * developercerts = [mobileProvision objectForKey:kDeveloperCertificates];
    
    //first check - compare the signer name which obtained from app 'binary' with the one from 'embedded.provision'
    
    NSString *appCertificate;
    
    for (int j=0; j<[developercerts count]; j++) {
        SecCertificateRef cert = SecCertificateCreateWithData(NULL, (__bridge CFDataRef)developercerts[j]);
        if( cert != NULL ) {
            CFStringRef certSummary = SecCertificateCopySubjectSummary(cert);
            CFRelease(cert);

            NSString *summaryString = (__bridge_transfer NSString *)certSummary;
            trace(@"app signer name matched: %@", summaryString);
            if ([summaryString isEqualToString:signer]){
                trace(@"app signer name matched: %@", summaryString);
                matchSignerName=YES;
                appCertificate = [VGuardPrivateUtility sha256FromData:developercerts[j]];
                break;
            }
        }
    }
    
    if (matchSignerName==NO)
        trace("mismatch signer name");
    
    if (matchSignerName) {
        violatedApplicationCertValidity = NO;
        [[self delegate] sendApplicationSignerWS:appCertificate];//send application signer WS, if all match
    }
    return violatedApplicationCertValidity;
}

- (BOOL)checkAppEncryptionforAppStoreApp {
    BOOL violatedApplicationEncryption=NO;
//#if !TARGET_IPHONE_SIMULATOR /* bypass for simulator start - 0 */
    trace(@"checked LC_ENCRYPTION_INFO");
    const struct mach_header *header;
    Dl_info dlinfo;
    // Fetch the dlinfo for main()
    //if (dladdr((__bridge void*)self, &dlinfo) == 0 || dlinfo.dli_fbase == NULL) {
    if (dladdr((__bridge void *)([self class]), &dlinfo) == 0) {
        trace("fetch dlinfo fail");
        violatedApplicationEncryption=YES;
    }
    header = dlinfo.dli_fbase;
    // Compute the image size and search for a UUID
    struct load_command *cmd = (struct load_command *) (header+1);
    uint32_t j;
    for (j = 0; cmd != NULL && j < header->ncmds; j++) {
        // Encryption info segment
        if (cmd->cmd == LC_ENCRYPTION_INFO) {
            struct encryption_info_command *crypt_cmd = (struct encryption_info_command *) cmd;
            // Check if binary encryption is enabled
            if (crypt_cmd->cryptid < 1) {
                // Disabled, probably pirated
                trace("app encryption disabled");
                violatedApplicationEncryption=YES;
                break;
            }
            break;
        }
        cmd = (struct load_command *) ((uint8_t *) cmd + cmd->cmdsize);
    }
//#endif /* bypass for simulator end - 0 */
    return violatedApplicationEncryption;
}

#pragma mark - GDB/Debugger
//    shuold remove 23/June
static inline BOOL check_gdb_exceptionport() {
    struct macosx_exception_info
    {
        exception_mask_t masks[EXC_TYPES_COUNT];
        mach_port_t ports[EXC_TYPES_COUNT];
        exception_behavior_t behaviors[EXC_TYPES_COUNT];
        thread_state_flavor_t flavors[EXC_TYPES_COUNT];
        mach_msg_type_number_t count;
    };
    struct macosx_exception_info *info = malloc(sizeof(struct macosx_exception_info));
    
    task_get_exception_ports(mach_task_self(),EXC_MASK_ALL, info->masks, &info->count, info->ports, info->behaviors, info->flavors);
    
    for (uint32_t i=0; i < info->count; i++)
    {
        //if (info->ports[i] != 0 || info->flavors[i] == THREAD_STATE_NONE)
        if (info->flavors[i] == THREAD_STATE_NONE)
        {
            free(info);
            trace("%@", NS_SCANSTART);
            return YES;
        }
    }
    free(info);
    return NO;
}


- (NSError *)outOfBand_check_ssl_hook{
    //Cperform SSL hooking check
    //this could prevent app being run in dynaminc analysis tool 'Snoop-It')
    trace("in outOfBand_check_ssl_hock");
    NSString *tileDirectory = [[NSBundle mainBundle] executablePath];
    const char *currrentexecutable_path = [tileDirectory UTF8String];
    uint32_t count = _dyld_image_count();
    void *currentexecutable_loc=0;
    int foundexecutable = 0;
    void *found_loc=0;
    for (uint32_t i=0; i<count; i++) {
        const char *check_image_name=_dyld_get_image_name(i);
        if (foundexecutable == 1) {
            currentexecutable_loc=(void *)(unsigned long)(_dyld_get_image_header(i));
            foundexecutable = 0;
        }
        if (!strcmp(check_image_name,currrentexecutable_path)) {
            foundexecutable = 1;
        }
        if (!strcmp(check_image_name,SystemLibFrameworkFoundation)) {
            found_loc=(void *)(unsigned long)(_dyld_get_image_header(i));
        }
    }
    Class NSURLConn=NSClassFromString(NSURLConnection_Class);
    IMP funcptr_initWithRequest=[NSURLConn instanceMethodForSelector:@selector(initWithRequest:delegate:)];
    IMP funcptr_startImmediately=[NSURLConn instanceMethodForSelector:@selector(initWithRequest:delegate:startImmediately:)];
    if (((int)funcptr_initWithRequest>(int)currentexecutable_loc && (int)funcptr_initWithRequest<(int)found_loc) ||
        ((int)funcptr_startImmediately>(int)currentexecutable_loc && (int)funcptr_startImmediately<(int)found_loc) ){
        NSString *errorDes = [NSString stringWithFormat:@"out-of-band ssl hook found: funcptr_initWithRequest %d funcptr_startImmediately %d currentexecutable_loc %d found_loc %d",(int)funcptr_initWithRequest, (int)funcptr_startImmediately, (int)currentexecutable_loc, (int)found_loc];
        trace("%@",errorDes);
        logCat(errorDes);
        return [[NSError alloc]initWithDomain:VGuardErrorDomain code:VGUARD_ERROR_HOOK_SSL_FOUND userInfo:@{NSLocalizedDescriptionKey:errorDes}];
    }
    return nil;
}


-(NSError *)outOfBand_check_crypto_function_hook{
    // perform hooking check for crypto functions keychain functions
    // this could prevent app being run in dynaminc analysis tool 'Introspy'
    trace("in outOfBand_check_crypto_function_hook");
    int func_C_size;
    unsigned int isInlineHooked = 0;
    const char *func_C[10][3] = {
        {CCCCrypt_cstr,  usrlibsystemlibcommonCrypto_dylib, NULL},
        {CCCryptorCreate_cstr,  usrlibsystemlibcommonCrypto_dylib, NULL},
        {CCCryptorUpdate_cstr,  usrlibsystemlibcommonCrypto_dylib, NULL},
        {CCCryptorFinal_cstr,  usrlibsystemlibcommonCrypto_dylib, NULL},
        {CCCryptorCreateFromData_cstr,  usrlibsystemlibcommonCrypto_dylib, NULL},
        {CCKeyDerivationPBKDF_cstr,  usrlibsystemlibcommonCrypto_dylib, NULL},
        {SecItemCopyMatching_cstr, SystemLibSecurity,NULL},
        {SecItemUpdate_cstr, SystemLibSecurity,NULL},
        {SecItemAdd_cstr, SystemLibSecurity,NULL},
        {SecItemDelete_cstr, SystemLibSecurity,NULL},
    };
    func_C_size = sizeof(func_C) / sizeof(func_C[0]);
    isInlineHooked = check_C_functions_inline_hook_outOfBand(func_C, func_C_size);
    if (isInlineHooked) {
        NSString *errorDes = logc_oob_check_c_function_hook;
        trace("%@",errorDes);
        logCat(errorDes);
        return [[NSError alloc]initWithDomain:VGuardErrorDomain code:VGUARD_ERROR_HOOK_C_FUNCTION_FOUND userInfo:@{NSLocalizedDescriptionKey:errorDes}];
    }
    return nil;
}

- (NSError *)outOfband_check_c_funtion_ssl_hook{
    // perform hooking check for ssl functions
    // this could prevent app being run in dynaminc analysis tool SSL pinning bypassed 'SSL Kill Switch'
    trace("in outOfBand_check_crypto_function_hook");
    int func_C_size;
    unsigned int isInlineHooked = 0;
    const char *func_C[3][3] = {
        {SSLHandshake_cstr, SystemLibSecurity,NULL},
        {SSLSetSessionOption_cstr, SystemLibSecurity,NULL},
        {SSLCreateContext_cstr, SystemLibSecurity,NULL},
    };
    func_C_size = sizeof(func_C) / sizeof(func_C[0]);
    isInlineHooked = check_C_functions_inline_hook_outOfBand(func_C, func_C_size);
    if (isInlineHooked) {
        NSString *errorDes = @"out of band c funtion hook ssl hock found";
        trace("%@",errorDes);
        return [[NSError alloc]initWithDomain:VGuardErrorDomain code:VGUARD_ERROR_HOOK_SSL_FOUND
                                     userInfo:@{NSLocalizedDescriptionKey:errorDes}];
    }
    return nil;
}

@end
