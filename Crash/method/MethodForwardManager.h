//
//  MethodForwardManager.h
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MethodForwardManager : NSObject

+(MethodForwardManager *)sharedInstance;

-(void)recordMethodForward:(NSString *)record;



@end
