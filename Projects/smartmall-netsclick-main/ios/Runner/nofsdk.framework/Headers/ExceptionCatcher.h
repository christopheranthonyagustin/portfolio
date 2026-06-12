//
//  ExceptionCatcher.h
//  nofsdk
//
//  Created by Heru Prasetia on 9/4/19.
//  Copyright © 2019 NETS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 Used as bridge to catch exception from Objective-C framework on Swift UI project
 */
@interface ExceptionCatcher : NSObject


/**
 Method to catch exception

 @param tryBlock block of code to catch the exception
 @param error result of the exception
 @return result of the catch exception
 */
+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end

NS_ASSUME_NONNULL_END
