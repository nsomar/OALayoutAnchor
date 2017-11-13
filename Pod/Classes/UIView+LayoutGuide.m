//
//  UIView+LayoutGuide.m
//  Pods
//
//  Created by Tayphoon on 18.01.17.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "UIView+LayoutGuide.h"
#import "OALayoutGuiedInternals.h"

NSString const * OALayoutGuiedKey = @"OALayoutGuiedKey";

@import ObjectiveC;

@implementation UIView (LayoutGuide)

#ifndef __IPHONE_9_0
@dynamic layoutMarginsGuide;
#endif

+ (Class)layoutMarginsGuideClass {
    return [OALayoutGuide class];
}

+ (void)addLayoutGuideMethodsIfNeeded {
    BOOL hasMethods = [UIView instancesRespondToSelector:@selector(layoutMarginsGuide)];
    
    // If the methods are already available on UIView that means addLayoutGuideMethodsIfNeeded has already been called
    // Or that we are running on iOS9 and up
    if (!hasMethods) {
        
        NSArray *methods = @[@"layoutMarginsGuide"];
        
        //Iterate all the method, creating new methods that point to their ___ prefixed ones
        for (NSString *methodName in methods) {
            [self addOrCreateMethodWithName:methodName toClass:[UIView class]];
        }
    }
}

+ (void)addOrCreateMethodWithName:(NSString*)methodName toClass:(Class)class {
    SEL selector = NSSelectorFromString(methodName);
    SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"___%@", methodName]);
    
    Method method = class_getInstanceMethod(class, newSelector);
    IMP imp = [class instanceMethodForSelector:newSelector];
    
    if (method) {
        class_addMethod(class, selector, imp, method_getTypeEncoding(method));
    }
}

- (OALayoutGuide*)___layoutMarginsGuide {
    id layoutGuide = objc_getAssociatedObject(self, &OALayoutGuiedKey);
    
    if (!layoutGuide) {
        layoutGuide = [[UIView layoutMarginsGuideClass] layoutGuideForView:self];
        objc_setAssociatedObject(self, &OALayoutGuiedKey, layoutGuide, OBJC_ASSOCIATION_RETAIN);
    }
    
    return layoutGuide;
}

#pragma mark - Private methods

@end
