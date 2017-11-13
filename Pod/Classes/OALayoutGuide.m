//
//  OALayoutGuide.m
//  Pods
//
//  Created by Tayphoon on 18.01.17.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "OALayoutGuide.h"
#import "UIView+LayoutGuideInternals.h"

@import ObjectiveC;

@interface OALayoutAnchor ()
- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView*)view;
@end

@implementation OALayoutGuide

+ (void)load {
    [UIView addLayoutGuideMethodsIfNeeded];
}

+ (instancetype)layoutGuideForView:(UIView*)view {
    return [[self alloc] initWithView:view];
}

- (instancetype)initWithView:(UIView*)view {
    self = [super init];
    
    if (self) {
        self.owningView = view;
    }
    
    return self;
}

- (OALayoutXAxisAnchor *)leadingAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (OALayoutXAxisAnchor *)trailingAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (OALayoutXAxisAnchor *)leftAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeLeftMargin];
}

- (OALayoutXAxisAnchor *)rightAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutXAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeRightMargin];
}

- (OALayoutYAxisAnchor *)topAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeTopMargin];
}

- (OALayoutYAxisAnchor *)bottomAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeBottomMargin];
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
                                     layoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (OALayoutYAxisAnchor *)centerYAnchor {
    return [self getAnchorAndCreateItIfNeededWithKey:_cmd anchorClass:[OALayoutYAxisAnchor class]
                                     layoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

#pragma mark - Private methods

- (id)getAnchorAndCreateItIfNeededWithKey:(SEL)anchorSelector anchorClass:(Class)anchorClass
                          layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    id anchor = objc_getAssociatedObject(self, anchorSelector);
    
    if (!anchor) {
        anchor = [[anchorClass alloc] initWithAttribute:layoutAttribute view:self.owningView];
        objc_setAssociatedObject(self, anchorSelector, anchor, OBJC_ASSOCIATION_RETAIN);;
    }
    
    return anchor;
}

@end
