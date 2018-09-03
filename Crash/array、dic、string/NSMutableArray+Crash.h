//
//  NSMutableArray+Crash.h
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Crash)

-(void)yk_addObject:(id)anObject;

-(void)yk_removeObjectAtIndex:(NSUInteger)index;

-(void)yk_insertObject:(id)anObject atIndex:(NSUInteger)index;

-(void)yk_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
