//
//  ViewController.m
//  Runtime
//
//  Created by my on 2017/3/26.
//  Copyright © 2017年 my. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "MYPerson.h"
#import "MYStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MYPerson *person = [MYPerson new];
    [person performSelector:@selector(testMethod)];
    // Do any additional setup after loading the view, typically from a nib.
    
    MYStudent *student = [[MYStudent alloc] init];
    student.name = @"哥哥";
    student.age = 15;
    student.height = 170;
    student.sex = @"man";
    student.number = 20;
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    NSString *filePath = [path stringByAppendingPathComponent:@"student.data"];
    
    [NSKeyedArchiver archiveRootObject:student toFile:filePath];
    
    MYStudent *s = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"解档%@，%zd",s.name,s.number);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
