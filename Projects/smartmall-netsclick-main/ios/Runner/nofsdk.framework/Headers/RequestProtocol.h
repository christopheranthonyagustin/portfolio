//
//  RequestProtocol.h
//  nofsdk
//
//  Created by Heru Prasetia on 9/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Protocol which implemented by Deregistration, CheckFundAvailability, and Debit
 */
@protocol RequestProtocol <NSObject>


/**
 abstract class which implemented by NOF SDK class to execute some functions

 @param successCallback method finished successfully
 @param errorCallback error occured when method executed
 */
-(void) invoke:(void (^_Nullable)(NSString* result))successCallback failure:(void (^_Nullable)(NSString* error))errorCallback;


@end

NS_ASSUME_NONNULL_END
