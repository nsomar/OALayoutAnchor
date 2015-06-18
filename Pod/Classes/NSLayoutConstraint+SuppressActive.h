//
//  NSLayoutConstraint+SuppressActive.h
//  Pods
//
//  Created by Omar Abdelhafith on 18/06/2015.
//
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (SuppressActive)

- (BOOL)oa_isActive;
- (void)oa_setActive:(BOOL)active;

@end
