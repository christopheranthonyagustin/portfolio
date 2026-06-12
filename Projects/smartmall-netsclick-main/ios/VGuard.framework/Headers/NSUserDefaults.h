//
//  NSUserDefaults.h
//  VGuard
//
//  Created by Hong Nhat Pham on 6/12/13.
//  Copyright (c) 2013 V-Key Pte Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (VGuard)

- (id)objectForKey_vg:(NSString *)defaultName;
- (void)setObject_vg:(id)value forKey:(NSString *)defaultName;

@end
