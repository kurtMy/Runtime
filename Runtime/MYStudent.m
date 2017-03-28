//
//  MYStudent.m
//  Runtime
//
//  Created by my on 2017/3/27.
//  Copyright © 2017年 my. All rights reserved.
//

#import "MYStudent.h"
#import <objc/runtime.h>
@interface MYStudent()

@end

@implementation MYStudent

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([MYStudent class], &count);
    
    for (int i = 0; i < count; i++) {
        //取出对应的成员变量
        Ivar ivar = ivars[i];
        
        //查看成员变量
        const char *name = ivar_getName(ivar);
        NSLog(@"%s",name);
        
        //归档
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivars);
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([MYStudent class], &count);
    
    for (int i = 0; i < count; i++) {
        
        //取出对应的成员变量
        
        Ivar viar = ivars[i];
        
        const char *name = ivar_getName(viar);
        
        //解档
        NSString *key = [NSString stringWithUTF8String:name];
        
        id value = [aDecoder decodeObjectForKey:key];
        
        [self setValue:value forKey:key];
    }
    
    free(ivars);
    return self;
}

@end
