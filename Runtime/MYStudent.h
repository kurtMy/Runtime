//
//  MYStudent.h
//  Runtime
//
//  Created by my on 2017/3/27.
//  Copyright © 2017年 my. All rights reserved.
//
//利用运行时进行归解档

#import <Foundation/Foundation.h>

@interface MYStudent : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, assign) NSInteger height;

@end
