//
//  ZombieObjectManager.h
//  Crash
//
//  Created by wyj on 2018/9/3.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZombieObjectManager : NSObject

@property (nonatomic, copy) NSMutableArray *classArr;

+(ZombieObjectManager *)shareInstance;

+ (void)registerUserClass:(NSArray *)arr;

@end
