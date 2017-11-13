//
//  OALayoutAnchor.m
//  Pods
//
//  Created by Omar Abdelhafith on 17/06/2015.
//
//

#import "OALayoutAnchor.h"
#import "UIView+OALayoutAnchorInternals.h"
#import "NSLayoutConstraint+SuppressActive.h"


@interface OALayoutAnchor ()
@property (nonatomic, weak) UIView *view;
@property (nonatomic) NSLayoutAttribute attribute;

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView*)view;
@end

@implementation OALayoutAnchor

+ (void)load {
  [UIView addAnchorMethodsIfNeeded];
}

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView*)view {
  self = [super init];
  if (self) {
    _attribute = attribute;
    _view = view;
  }
  return self;
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutAnchor*)anchor {
  return [self constraintEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutAnchor*)anchor {
  return [self constraintGreaterThanOrEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutAnchor*)anchor {
  return [self constraintLessThanOrEqualToAnchor:anchor constant:0];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutAnchor*)anchor constant:(CGFloat)c {
  NSLayoutConstraint *constraint = [self constraintToAnchor:anchor relatedBy:NSLayoutRelationEqual constant:c];
  
  [self addConstraint:constraint betweenView:self.view otherView:anchor.view];
  return constraint;
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutAnchor*)anchor constant:(CGFloat)c {
  NSLayoutConstraint *constraint = [self constraintToAnchor:anchor relatedBy:NSLayoutRelationGreaterThanOrEqual constant:c];
  
  [self addConstraint:constraint betweenView:self.view otherView:anchor.view];
  return constraint;
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutAnchor*)anchor constant:(CGFloat)c {
  NSLayoutConstraint *constraint = [self constraintToAnchor:anchor relatedBy:NSLayoutRelationLessThanOrEqual constant:c];
  
  [self addConstraint:constraint betweenView:self.view otherView:anchor.view];
  return constraint;
}

- (NSLayoutConstraint*)constraintToAnchor:(OALayoutAnchor*)anchor
                                relatedBy:(NSLayoutRelation)relation
                                 constant:(CGFloat)c {
  
  return [NSLayoutConstraint constraintWithItem:self.view
                                      attribute:self.attribute
                                      relatedBy:relation
                                         toItem:anchor.view
                                      attribute:anchor.attribute
                                     multiplier:1
                                       constant:c];
}

- (void)addConstraint:(NSLayoutConstraint*)constraint betweenView:(UIView*)view otherView:(UIView*)otherView {
  UIView *parent = [self viewToAddConstraintOnForFirstView:self.view secondView:otherView];
  [parent addConstraint:constraint];
  constraint.active = NO;
}

- (UIView*)viewToAddConstraintOnForFirstView:(UIView*)firstView secondView:(UIView*)secondView {
  if (firstView == nil || secondView == nil) {
    return nil;
  }
  
  if ([firstView isDescendantOfView:secondView]) {
    return secondView;
  }
  
  if ([secondView isDescendantOfView:firstView]) {
    return firstView;
  }
  
  return [self viewToAddConstraintOnForFirstView:firstView.superview secondView:secondView];
}

@end

@implementation OALayoutXAxisAnchor
@end

@implementation OALayoutYAxisAnchor
@end

@implementation OALayoutDimension

- (NSLayoutConstraint *)constraintEqualToConstant:(CGFloat)c {
  return [self constraintEqualToAnchor:nil multiplier:1 constant:c];
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToConstant:(CGFloat)c {
  return [self constraintGreaterThanOrEqualToAnchor:nil multiplier:1 constant:c];
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToConstant:(CGFloat)c {
  return [self constraintLessThanOrEqualToAnchor:nil multiplier:1 constant:c];
}


- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m {
  return [self constraintEqualToAnchor:anchor multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m {
  return [self constraintGreaterThanOrEqualToAnchor:anchor multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m {
  return [self constraintLessThanOrEqualToAnchor:anchor multiplier:m constant:0];
}

- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
  NSLayoutConstraint *constraint = [self constraintToAnchor:anchor
                                                  relatedBy:NSLayoutRelationEqual
                                                 multiplier:m
                                                   constant:c];
  
  constraint.priority = 1000;
  id viewToAdd = anchor ? [self viewToAddConstraintOnForFirstView:self.view secondView:anchor.view] : self.view;
  [self addConstraint:constraint toView:viewToAdd];
  
  return constraint;
}

- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
  NSLayoutConstraint *constraint = [self constraintToAnchor:anchor
                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                 multiplier:m
                                                   constant:c];

  constraint.priority = 1000;
  id viewToAdd = anchor ? [self viewToAddConstraintOnForFirstView:self.view secondView:anchor.view] : self.view;
  [self addConstraint:constraint toView:viewToAdd];
  
  return constraint;
}

- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
  NSLayoutConstraint *constraint = [self constraintToAnchor:anchor
                                                  relatedBy:NSLayoutRelationLessThanOrEqual
                                                 multiplier:m
                                                   constant:c];
  
  constraint.priority = 1000;
  id viewToAdd = anchor ? [self viewToAddConstraintOnForFirstView:self.view secondView:anchor.view] : self.view;
  [self addConstraint:constraint toView:viewToAdd];
  
  return constraint;
}

- (NSLayoutConstraint*) constraintToAnchor:(OALayoutAnchor*)anchor
                                 relatedBy:(NSLayoutRelation)relation
                                multiplier:(CGFloat)multiplier
                                  constant:(CGFloat)c {
  
  return [NSLayoutConstraint constraintWithItem:self.view
                                      attribute:self.attribute
                                      relatedBy:relation
                                         toItem:anchor.view
                                      attribute:anchor ? anchor.attribute : NSLayoutAttributeNotAnAttribute
                                     multiplier:multiplier
                                       constant:c];
}

- (void)addConstraint:(NSLayoutConstraint*)constraint toView:(UIView*)view {
  [view addConstraint:constraint];

  constraint.active = NO;
}

@end
