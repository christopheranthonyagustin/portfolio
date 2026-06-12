//
//  VGuardDetectionManager.h
//  VGuard
//
//  Created by TC Tan on 11/10/12.
//  Copyright (c) 2012 V-Key Pte Ltd. All rights reserved.
//

typedef enum{
    DGB_IS_DEBUGGABLE             = 1,
    DBG_PFLAG_SET                 = 2,
    DBG_IOS_EXCEPTION_PORT_OPENED = 4,
    DBG_IOS_LLDB_ATTACHED         = 8,
    DBG_IOS_PPID_CHANGED          = 16
}VosCallBackType;

typedef enum{
    APP_SIGNER_CHECK_SUCCESS    = 0,
    APP_SIGNER_CHECK_FAIL       = -1
} AppSignerCheckStatus;

#import <Foundation/Foundation.h>
#import "VGuardManager.h"
#import "VGuardIPSModule.h"

@protocol VGuardDetectionProtocol <NSObject>
- (void)sendApplicationSignerWS:(NSString*)appSignatoryHash;
- (void)processVGuardScanResult:(NSArray*)threatArray classInfo:(NSArray*)classArray;
- (void)processDyldThreatOrDebuggerThreat:(NSArray*)threatArray;
@end

@interface VGuardDetectionManager : VGuardIPSModule

@property (unsafe_unretained, nonatomic) id<VGuardDetectionProtocol> delegate;
@property (nonatomic,assign)int stDebuggerCheckDetection;
@property (nonatomic,assign)int stAppSignerDetection;
@property (nonatomic,assign)int stDFPHookDetection;
@property (nonatomic,assign)int stCodeInjectionCheckDetection;
@property (nonatomic) BOOL isJailbrokenDetected;

+ (VGuardDetectionManager *)sharedDetectionManager;
-(void)start;
-(NSError *)outOfBand_check_ssl_hook;
-(NSError *)outOfBand_check_crypto_function_hook;
-(NSError *)outOfband_check_c_funtion_ssl_hook;
-(BOOL)analyzeVOSCallback;

- (void)updateJailbreakDetectionStatus;

/*
 * Update Application's Runtime Tampering Status
 */
- (void)updateRuntimeTamperingStatus;

@end
