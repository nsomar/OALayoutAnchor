//
//  NSLayoutConstraint+SuppressActive.m
//  Pods
//
//  Created by Omar Abdelhafith on 18/06/2015.
//
//

#import "NSLayoutConstraint+SuppressActive.h"

@implementation NSLayoutConstraint (SuppressActive)

- (BOOL)oa_active {
  if ([self respondsToSelector:@selector(isActive)]) {
    return self.isActive;
  }
  
  return YES;
}

- (void)setOa_active:(BOOL)oa_active {
  if ([self respondsToSelector:@selector(setActive:)]) {
    self.active = oa_active;
  }
}

- (BOOL)___isActive {
  //This method is added to NSLayoutConstraint in iOS 7, isActive and setActive are rerouted to this method
  //iOS 7 Constraints are active always
  return YES;
}

- (void)___setActive:(BOOL)active {
  //This method is added to NSLayoutConstraint in iOS 7, isActive and setActive are rerouted to this method
}

@end
