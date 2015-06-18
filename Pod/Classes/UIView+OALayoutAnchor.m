//
//  UIView+OALayoutAnchor.m
//  Pods
//
//  Created by Omar Abdelhafith on 17/06/2015.
//
//

@import ObjectiveC;
#import "UIView+OALayoutAnchor.h"

@interface OALayoutAnchor ()
- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView*)view;
@end

@implementation UIView (OALayoutAnchor)
#ifndef __IPHONE_9_0
@dynamic leadingAnchor, trailingAnchor, leftAnchor, rightAnchor,
topAnchor, bottomAnchor, widthAnchor, heightAnchor,
centerXAnchor, centerYAnchor, firstBaselineAnchor, lastBaselineAnchor;
#endif

- (OALayoutXAxisAnchor *)oa_leadingAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLeading];
}

- (OALayoutXAxisAnchor *)oa_trailingAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeTrailing];
}

- (OALayoutXAxisAnchor *)oa_leftAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLeft];
}

- (OALayoutXAxisAnchor *)oa_rightAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeRight];
}

- (OALayoutYAxisAnchor *)oa_topAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeTop];
}

- (OALayoutYAxisAnchor *)oa_bottomAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeBottom];
}

- (OALayoutDimension *)oa_widthAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutDimension class]
                                   layoutAttribute:NSLayoutAttributeWidth];
}

- (OALayoutDimension *)oa_heightAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutDimension class]
                                   layoutAttribute:NSLayoutAttributeHeight];
}

- (OALayoutXAxisAnchor *)oa_centerXAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeCenterX];
}

- (OALayoutYAxisAnchor *)oa_centerYAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeCenterY];
}

- (OALayoutYAxisAnchor *)oa_firstBaselineAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeFirstBaseline];
}

- (OALayoutYAxisAnchor *)oa_lastBaselineAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLastBaseline];
}

#pragma mark - adding the methods

+ (void)addAnchorMethodsIfNeeded {
  BOOL hasMethods = [UIView instancesRespondToSelector:@selector(leadingAnchor)];
  
  // If the methods are already available on UIView that means addAnchorMethodsIfNeeded has already been called
  // Or that we are running on iOS9 and up
  if (hasMethods) { return; }
  
  NSArray *methods = @[@"leadingAnchor", @"trailingAnchor", @"leftAnchor", @"rightAnchor",
                       @"topAnchor", @"bottomAnchor", @"widthAnchor", @"heightAnchor",
                       @"centerXAnchor", @"centerYAnchor", @"firstBaselineAnchor", @"lastBaselineAnchor"];
  
  //Iterate all the method, creating new methods that point to their oa_ prefixed ones
  for (NSString *methodName in methods) {
    SEL selector = NSSelectorFromString(methodName);
    SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"oa_%@", methodName]);
    
    Method method = class_getInstanceMethod([UIView class], newSelector);
    IMP imp = [UIView instanceMethodForSelector:newSelector];
    
    class_addMethod([UIView class], selector, imp, method_getTypeEncoding(method));
  }
}

#pragma mark - helpers

- (id)getAnchorAndCreateItIfNeededWithKey:(SEL)anchorSelector anchorClass:(Class)anchorClass
                          layoutAttribute:(NSLayoutAttribute)layoutAttribute {
  id anchor = [self associatedObjectForKey:anchorSelector];
  
  if (!anchor) {
    anchor = [[anchorClass alloc] initWithAttribute:layoutAttribute view:self];
    [self setAssociatedObject:anchor forKey:anchorSelector];
  }
  
  return anchor;
}


- (id)associatedObjectForKey:(SEL)key {
  return objc_getAssociatedObject(self, key);
}

- (void)setAssociatedObject:(id)object forKey:(SEL)key {
  objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}



@end