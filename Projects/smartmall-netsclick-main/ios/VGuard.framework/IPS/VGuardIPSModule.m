//
//  VGuardIPSModule.m
//  VGuard
//
//  Created by Chinwee Koh on 13/6/14.
//  Copyright (c) 2014 V-Key Pte Ltd. All rights reserved.
//

#import "VGuardIPSModule.h"
#import "VGuardSignatureManager.h"

#define CLASS_NAME                  @"VGuardIPSModule"

@implementation VGuardIPSModule

-(NSDictionary*)createDictionaryForThreats:(NSString *)threatClass name:(NSString *)threatName info:(NSString *)threatInfo
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:threatClass forKey:trThreatTypeId];
    [dict setObject:threatName forKey:trName];
    [dict setObject:threatInfo forKey:trInfo];
    return dict;
}

-(NSArray*)fetchThreatsInfo:(NSDictionary*)dictionaryList withInfoName:(NSString*)infoName
{
    NSString *class = [dictionaryList objectForKey:kFileThreatClass];
    NSString *name  = [NSString stringWithFormat:@"%d",[[dictionaryList objectForKey:kFileThreatName] intValue]];

    NSString *info;
    //if withInfoName is nil, mean it's added at the file level
    if ([infoName length]==0) {
        info = [dictionaryList objectForKey:kFileThreatInfo];
    } else {
        
        // prefer to use threat info value
        NSString *threatInfo = [dictionaryList objectForKey:kFileThreatInfo];
        if (threatInfo && [threatInfo isKindOfClass:NSString.class] && threatInfo.length > 0) {
            info = threatInfo;
        } else {
            info = infoName;
        }
    }
    //if class is nil, mean signature used is not updated
    if (class == nil) {
        if ([infoName length]==0) {
            trace("undefined signature detected");
            logCat(@"undefined signature detected");
        } else {
            trace("undefined signature detected: %@", infoName);
            NSString *logC = [NSString stringWithFormat:@"undefined signature detected: %@", infoName];
            logCat(logC);
        }
        return nil;
    }
    if (info && info.length>0) {
        NSMutableArray *infoArray = [[NSMutableArray alloc] init];
        [infoArray addObject:class];
        [infoArray addObject:name];
        [infoArray addObject:info];
        return infoArray;
// DDCH check without this somem time crashed
    }else{
        logCat(@"VGuardIPSModule -- info is nill");
    }
    return nil;
}

-(NSDictionary*)fetchDictionaryForLevel:(NSString*)level
{
    NSDictionary *signatureDict = nil;
    signatureDict = [[VGuardSignatureManager sharedSignatureManagerWithError:nil] signatureObject];
    if (signatureDict == nil) {
        trace("error: fail to load signature object");
        [VGLogManager vosLogWithLevel:LOG_LEVEL_WARNING mode:LOG_MODE_ENCRYPTED class:CLASS_NAME tag:LOG_TAG_SCAN msg:MSG(@"Failed to load signature object")];
        return nil;
    }
    NSDictionary *signatureData = [[signatureDict objectForKey:signatureContainment] objectForKey:sigData];
    return [signatureData objectForKey:level];
}

- (BOOL)deviceFirmwareIsGreaterThanOrEqualTo:(NSString *)firmwareVersion {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(firmwareVersion) ? YES : NO;
}

@end
