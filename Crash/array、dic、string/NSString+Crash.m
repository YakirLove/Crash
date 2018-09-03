//
//  NSString+Crash.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "NSString+Crash.h"

@implementation NSString (Crash)

- (NSString *)yk_substringFromIndex:(NSUInteger)from;
{
    if(from <= self.length)
    {
        return [self substringFromIndex:from];
    }
    return self;
}

- (NSString *)yk_substringToIndex:(NSUInteger)to;
{
    if(to <= self.length)
    {
        return [self substringToIndex:to];
    }
    return self;
}

- (NSString *)yk_substringWithRange:(NSRange)range;
{
    if (range.location <= self.length && (range.location + range.length <= self.length))
    {
        return [self substringWithRange:range];
    }
    return self;
}

@end
