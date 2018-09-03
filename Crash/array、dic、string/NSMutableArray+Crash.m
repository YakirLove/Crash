//
//  NSMutableArray+Crash.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "NSMutableArray+Crash.h"

@implementation NSMutableArray (Crash)

-(void)yk_addObject:(id)anObject;
{
    if([self isKindOfClass:[NSMutableArray class]])
        [(NSMutableArray *)self addObject:anObject];
}

-(void)yk_removeObjectAtIndex:(NSUInteger)index;
{
    if(index < self.count)
        [self removeObjectAtIndex:index];
}

-(void)yk_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject && index <= self.count ) {
        [self insertObject:anObject atIndex:index];
    }
}

-(void)yk_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

@end
