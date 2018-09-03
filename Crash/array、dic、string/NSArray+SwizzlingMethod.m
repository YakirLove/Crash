//
//  NSArray+SwizzlingMethod.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "NSArray+SwizzlingMethod.h"
#import <objc/runtime.h>
@implementation NSArray (SwizzlingMethod)

+ (void)exchangeInstanceMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL
{
    Method origIndex = class_getInstanceMethod(anClass, originSEL);
    Method overrideIndex = class_getInstanceMethod(anClass, replaceSEL);
    if (!origIndex || !overrideIndex) {
        return;
    }
    method_exchangeImplementations(origIndex, overrideIndex);
}

+ (void)SwizzlingMethod
{
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArray0") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(yk_objectAtIndex0:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArrayI") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(yk_objectAtIndexI:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSSingleObjectArrayI") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(yk_objectSingleAtIndexSignle:)];
}

-(id)yk_objectAtIndex0:(NSUInteger)index
{
    return nil;
}

-(id)yk_objectAtIndexI:(NSUInteger)index
{
    id obj = nil;
    if (self.count > 0 && index < self.count) {
        obj = [self yk_objectAtIndexI:index];
    }
    return obj;
}

-(id)yk_objectSingleAtIndexSignle:(NSUInteger)index
{
    id obj = nil;
    if (self.count > 0 && index < self.count) {
        obj = [self yk_objectSingleAtIndexSignle:index];
    }
    return obj;
}



@end
