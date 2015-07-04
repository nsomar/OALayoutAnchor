//
//  UIView+OALayoutAnchor.m
//  Pods
//
//  Created by Omar Abdelhafith on 17/06/2015.
//
//

@import ObjectiveC;
#import "UIView+OALayoutAnchor.h"
#import "NSLayoutConstraint+SuppressActive.h"


@interface OALayoutAnchor ()
- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView*)view;
@end

@implementation UIView (OALayoutAnchor)
#ifndef __IPHONE_9_0
@dynamic leadingAnchor, trailingAnchor, leftAnchor, rightAnchor,
topAnchor, bottomAnchor, widthAnchor, heightAnchor,
centerXAnchor, centerYAnchor, firstBaselineAnchor, lastBaselineAnchor;
#endif

- (OALayoutXAxisAnchor *)___leadingAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLeading];
}

- (OALayoutXAxisAnchor *)___trailingAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeTrailing];
}

- (OALayoutXAxisAnchor *)___leftAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLeft];
}

- (OALayoutXAxisAnchor *)___rightAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeRight];
}

- (OALayoutYAxisAnchor *)___topAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeTop];
}

- (OALayoutYAxisAnchor *)___bottomAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeBottom];
}

- (OALayoutDimension *)___widthAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutDimension class]
                                   layoutAttribute:NSLayoutAttributeWidth];
}

- (OALayoutDimension *)___heightAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutDimension class]
                                   layoutAttribute:NSLayoutAttributeHeight];
}

- (OALayoutXAxisAnchor *)___centerXAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeCenterX];
}

- (OALayoutYAxisAnchor *)___centerYAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeCenterY];
}

- (OALayoutYAxisAnchor *)___firstBaselineAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeFirstBaseline];
}

- (OALayoutYAxisAnchor *)___lastBaselineAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLastBaseline];
}

#pragma mark - adding the methods

+ (void)addAnchorMethodsIfNeeded {
  BOOL hasMethods = [UIView instancesRespondToSelector:@selector(leadingAnchor)];
  
  // If the methods are already available on UIView that means addAnchorMethodsIfNeeded has already been called
  // Or that we are running on iOS9 and up
  if (!hasMethods) {

    NSArray *methods = @[@"leadingAnchor", @"trailingAnchor", @"leftAnchor", @"rightAnchor",
                         @"topAnchor", @"bottomAnchor", @"widthAnchor", @"heightAnchor",
                         @"centerXAnchor", @"centerYAnchor", @"firstBaselineAnchor", @"lastBaselineAnchor"];
    
    //Iterate all the method, creating new methods that point to their ___ prefixed ones
    for (NSString *methodName in methods) {
      [self addMethodWithName:methodName toClass:[UIView class]];
    }
  }
  
  hasMethods = [NSLayoutConstraint instancesRespondToSelector:@selector(setActive:)];
  //We need to add methods for isActive and setActive to be able to transparently use constraints
  if (!hasMethods) {
    [self addMethodWithName:@"isActive" toClass:[NSLayoutConstraint class]];
    [self addMethodWithName:@"setActive:" toClass:[NSLayoutConstraint class]];
  }
}

+ (void)addMethodWithName:(NSString*)methodName toClass:(Class)cls {
  SEL selector = NSSelectorFromString(methodName);
  SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"___%@", methodName]);
  
  Method method = class_getInstanceMethod(cls, newSelector);
  IMP imp = [cls instanceMethodForSelector:newSelector];
  
  class_addMethod(cls, selector, imp, method_getTypeEncoding(method));
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