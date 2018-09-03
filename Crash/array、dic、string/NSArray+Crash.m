//
//  NSArray+Crash.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "NSArray+Crash.h"

@implementation NSArray (Crash)

-(id)yk_objectAtIndex:(NSUInteger)index;
{
    if(index >= self.count)
    {
        return nil;
    }
    else
    {
        return [self objectAtIndex:index];
    }
}

-(void)yk_addObject:(id)anObject;
{
    if([self isKindOfClass:[NSMutableArray class]])
        [(NSMutableArray *)self addObject:anObject];
}


@end
