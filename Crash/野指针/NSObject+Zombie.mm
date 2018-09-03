//
//  NSObject+Zombie.m
//  Crash
//
//  Created by wyj on 2018/9/3.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "NSObject+Zombie.h"
#import "ZombieObjectManager.h"
#import "ZombieProxy.h"
#import <objc/runtime.h>
#import <list>

static NSInteger const threshold = 100;
static std::list<id> undellocedList;

@implementation NSObject (Zombie)

- (void)yk_dealloc;
{
    Class selfClass = object_getClass(self);
    BOOL needProtect = NO;
    for (NSString *className in [ZombieObjectManager shareInstance].classArr) {
        Class clazz = objc_getClass([className UTF8String]);
        if (clazz == selfClass) {
            needProtect = YES;
            break;
        }
    }
    
    if (needProtect) {
        objc_destructInstance(self);
        object_setClass(self, [ZombieProxy class]);
        ((ZombieProxy *)self).originClass = selfClass;
        
        undellocedList.size();
        if (undellocedList.size() >= threshold) {
            id object = undellocedList.front();
            undellocedList.pop_front();
            free(object);
        }
        undellocedList.push_back(self);
    } else {
        [self yk_dealloc];
    }
}

@end
