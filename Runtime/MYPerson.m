//
//  MYPerson.m
//  Runtime
//
//  Created by my on 2017/3/26.
//  Copyright © 2017年 my. All rights reserved.
//

#import "MYPerson.h"
#import <objc/runtime.h>
#import "MYChildren.h"

@implementation MYPerson

/*1.方法的动态解析
 *为当前类添加一个方法
 *这种方法仅适用于替换为当前类中的方法，即用newTestMethod()函数替换掉原来的testMethod.但仅限于当前类中的函数
 *如果返回值为NO,则继续执行forwardingTargetForSelector方法
 */
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    
//    NSLog(@"方法的动态解析");
//    
//    NSString *selName = NSStringFromSelector(sel);
//    if ([selName isEqualToString:@"testMethod"]) {
//        class_addMethod([self class], @selector(testMethod), (IMP)newTestMethod, "v@:");
//        return YES;
//    }
//    return NO;
//}



//void newTestMethod() {
//    
//    NSLog(@"%s",__func__);
//}

/*
 2.备用接受者，即替换掉调用该方法的对象，如果返回值为nil,则执行forwardInvocation方法
 */
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    
//    NSLog(@"备用接受者");
//    //指定某一个对象来接收方法
//    NSString *selName = NSStringFromSelector(aSelector);
//    if ([selName isEqualToString:@"testMethod"] ) {
//        return [MYChildren new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

/*
 *执行forwardInvocation方法之前要先执行methodSignatureForSelector方法
 */

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    NSLog(@"指定方法签名");
    NSString *string = NSStringFromSelector(aSelector);
    if ([string isEqualToString:@"testMethod"]) {
        ////为类添加方法 ,(IMP)ReportFunction 方法的实现地址， “v@:” 是类型编码,v 表示void @表示对象 ，:表示方法选标（SEL ，即看做一个方法的id）
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    NSLog(@"%s",__func__);
    
    [anInvocation setSelector:@selector(newTestMethod)];
    [anInvocation invokeWithTarget:[MYChildren new]];
    
}

- (void)newTestMethod1 {
    
    NSLog(@"%s",__func__);
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    
    NSLog(@"哈哈:%@", NSStringFromSelector(aSelector));
}

@end
