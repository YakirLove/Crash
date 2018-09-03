//
//  ViewController.m
//  Crash
//
//  Created by wyj on 2018/8/30.
//  Copyright © 2018年 wyj. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+Crash.h"
#import "NSArray+Crash.h"
#import "NSString+Crash.h"
#import "TestObj.h"

@interface ViewController ()
@property (nonatomic, assign) TestObj* assignObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TestObj *obj = [TestObj new];
    self.assignObj = obj;
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSMutableArray *array = @[@"123"].mutableCopy;
//
//    [(NSMutableArray *)array yk_insertObject:@"1" atIndex:1];
//    NSLog(@"%@",array);
    
//    NSString *string = @"12345";
//    string =  [string yk_substringWithRange:NSMakeRange(6, 1)];
//    NSLog(@"%@",[string class]);
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch)]];
    
}

-(void)touch
{
//    [self performSelector:@selector(crashMethod)];
    
//    [ViewController performSelector:@selector(crashMethod)];
    
    NSLog(@"%@", self.assignObj);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
