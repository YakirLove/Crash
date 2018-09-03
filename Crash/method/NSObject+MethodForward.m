//
//  NSObject+MethodForward.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "NSObject+MethodForward.h"
#import "MethodForwardManager.h"
#import <objc/runtime.h>
//#import "XXShieldSwizzling.h"

@implementation NSObject (MethodForward)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *string = [NSString stringWithFormat:@"[%@ %@]",[self class],NSStringFromSelector(aSelector)];
    [[MethodForwardManager sharedInstance] recordMethodForward:string];
    
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
}

//需要重写这个方法才会避免崩溃
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    
}

+ (void)exchangeClassMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL
{
    Method origIndex = class_getClassMethod(anClass, originSEL);
    Method overrideIndex = class_getClassMethod(anClass, replaceSEL);
    if (!origIndex || !overrideIndex) {
        return;
    }
    method_exchangeImplementations(origIndex, overrideIndex);
}

+(void)load
{
    [self exchangeClassMethod:[self class] originMethodSel:@selector(yk_resolveClassMethod:) replaceMethodSel:@selector(resolveClassMethod:)];
}

int classFunction(id target, SEL cmd, ...) {
    return 0;
}

+ (BOOL)yk_resolveClassMethod:(SEL)sel
{
    Class metaClass = objc_getMetaClass(class_getName([self class]));
    class_addMethod(metaClass, sel, (IMP)classFunction,"v@:");
    NSString *string = [NSString stringWithFormat:@"[%@ %@]",[self class],NSStringFromSelector(sel)];
    [[MethodForwardManager sharedInstance] recordMethodForward:string];
    return YES;
}


@end
