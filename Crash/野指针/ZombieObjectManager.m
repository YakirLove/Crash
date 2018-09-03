//
//  ZombieObjectManager.m
//  Crash
//
//  Created by wyj on 2018/9/3.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "ZombieObjectManager.h"
#import <objc/runtime.h>
#import "NSObject+Zombie.h"

@implementation ZombieObjectManager

+(ZombieObjectManager *)shareInstance;
{
    static ZombieObjectManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZombieObjectManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.classArr = @[@"TestObj"].mutableCopy;
    }
    return self;
}

//添加监测类
+ (void)registerUserClass:(NSArray *)arr
{
//    NSMutableArray *avaibleList = arr.mutableCopy;
//    for (NSString *className in arr) {
//        NSBundle *classBundle = [NSBundle bundleForClass:NSClassFromString(className)];
//        if (classBundle != [NSBundle mainBundle]) {
//            [avaibleList removeObject:className];
//        }
//    }
    [self shareInstance].classArr = arr.mutableCopy;
    for (NSString *className in [self shareInstance].classArr) {
        defaultSwizzlingOCMethod(NSClassFromString(className), NSSelectorFromString(@"dealloc"), @selector(yk_dealloc));
    }
    
}

BOOL defaultSwizzlingOCMethod(Class self, SEL origSel_, SEL altSel_) {
    Method origMethod = class_getInstanceMethod(self, origSel_);
    if (!origMethod) {
        return NO;
    }
    
    Method altMethod = class_getInstanceMethod(self, altSel_);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    origSel_,
                    class_getMethodImplementation(self, origSel_),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel_,
                    class_getMethodImplementation(self, altSel_),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, origSel_), class_getInstanceMethod(self, altSel_));
    return YES;
    
}

@end
