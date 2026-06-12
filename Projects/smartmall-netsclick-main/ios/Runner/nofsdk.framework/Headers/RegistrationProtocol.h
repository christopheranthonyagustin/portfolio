//
//  RegistrationProtocol.h
//  nofsdk
//
//  Created by Heru Prasetia on 3/2/21.
//  Copyright © 2021 NETS. All rights reserved.
//

#ifndef RegistrationProtocol_h
#define RegistrationProtocol_h

/**
 Protocol which implemented by Registration
 */
@protocol RegistrationProtocol <NSObject>

/**
 abstract class which implemented by NOF SDK class to execute some functions
 
 @param successCallback method finished successfully
 @param errorCallback error occured when method executed
 */
-(void) invoke:(void (^_Nullable)(NSString* _Nonnull result, NSString* _Nonnull result2))successCallback failure:(void (^_Nullable)(NSString* _Nonnull error))errorCallback;

@end
#endif /* RegistrationProtocol_h */
