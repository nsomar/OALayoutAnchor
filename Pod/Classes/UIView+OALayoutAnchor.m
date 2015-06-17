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

- (OALayoutXAxisAnchor *)leadingAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLeading];
}

- (OALayoutXAxisAnchor *)trailingAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeTrailing];
}

- (OALayoutXAxisAnchor *)leftAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLeft];
}

- (OALayoutXAxisAnchor *)rightAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeRight];
}

- (OALayoutYAxisAnchor *)topAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeTop];
}

- (OALayoutYAxisAnchor *)bottomAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeBottom];
}

- (OALayoutDimension *)widthAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutDimension class]
                                   layoutAttribute:NSLayoutAttributeWidth];
}

- (OALayoutDimension *)heightAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutDimension class]
                                   layoutAttribute:NSLayoutAttributeHeight];
}

- (OALayoutXAxisAnchor *)centerXAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeCenterX];
}

- (OALayoutYAxisAnchor *)centerYAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeCenterY];
}

- (OALayoutYAxisAnchor *)firstBaselineAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeFirstBaseline];
}

- (OALayoutYAxisAnchor *)lastBaselineAnchor {
  return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                   layoutAttribute:NSLayoutAttributeLastBaseline];
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
