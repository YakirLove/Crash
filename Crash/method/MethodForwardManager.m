//
//  MethodForwardManager.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "MethodForwardManager.h"

@implementation MethodForwardManager

+(MethodForwardManager *)sharedInstance;
{
    static dispatch_once_t pred;
    static MethodForwardManager *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[MethodForwardManager alloc] init];
    });
    return sharedInstance;
}

-(void)recordMethodForward:(NSString *)record;
{
//#ifdef DEBUG
    NSLog(@"-------------------------------");
    NSLog(@"%@ \n %@",record ,[NSThread callStackSymbols]);
    NSLog(@"-------------------------------");
//#else
//     @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"%@ \n %@",record ,[NSThread callStackSymbols]] userInfo:nil];
//#endif
    
}


@end
