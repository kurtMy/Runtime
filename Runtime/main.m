//
//  main.m
//  Runtime
//
//  Created by my on 2017/3/26.
//  Copyright © 2017年 my. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>
#import "MYPerson.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
       
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
