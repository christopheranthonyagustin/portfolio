//
//  HceApiService.h
//  nofsdk
//
//  Created by Heru Prasetia on 9/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HceApiService : NSObject {
    NSArray *issuerIds;
}

@property(nonatomic, retain) NSArray *issuerIds;

-(id) init: (NSArray *)issuerId;

@end

NS_ASSUME_NONNULL_END
