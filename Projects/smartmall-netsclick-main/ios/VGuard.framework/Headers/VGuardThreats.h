//
//  VGuardThreats.h
//  VGuard
//
//  Created by Chinwee Koh on 12/6/14.
//  Copyright (c) 2014 V-Key Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VGuardThreatsDelegate <NSObject>

@optional

- (void)vGuardScan:(NSArray *)threatsArray;

- (void)vGuardDidDetectThreats:(NSDictionary *)threatsInfo;

- (void)vGuardDidDetectScreenSharing;

@end


@interface VGuardThreats : NSObject

@property (weak, nonatomic) id<VGuardThreatsDelegate> delegate;

+ (VGuardThreats *)sharedModule;

@end
