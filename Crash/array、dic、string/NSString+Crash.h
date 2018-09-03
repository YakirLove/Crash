//
//  NSString+Crash.h
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Crash)

- (NSString *)yk_substringFromIndex:(NSUInteger)from;
- (NSString *)yk_substringToIndex:(NSUInteger)to;
- (NSString *)yk_substringWithRange:(NSRange)range;

@end
