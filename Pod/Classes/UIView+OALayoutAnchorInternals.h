//
//  UIView+OALayoutAnchor.h
//  Pods
//
//  Created by Omar Abdelhafith on 17/06/2015.
//
//

#import <UIKit/UIKit.h>
#import "OALayoutAnchor.h"

@interface UIView (OALayoutAnchorInternals)

// Dont use these methods, use the one non prefixed with oa
- (OALayoutXAxisAnchor *)___leadingAnchor;
- (OALayoutXAxisAnchor *)___trailingAnchor;
- (OALayoutXAxisAnchor *)___leftAnchor;
- (OALayoutXAxisAnchor *)___rightAnchor;
- (OALayoutYAxisAnchor *)___topAnchor;
- (OALayoutYAxisAnchor *)___bottomAnchor;
- (OALayoutDimension *)___widthAnchor;
- (OALayoutDimension *)___heightAnchor;
- (OALayoutXAxisAnchor *)___centerXAnchor;
- (OALayoutYAxisAnchor *)___centerYAnchor;
- (OALayoutYAxisAnchor *)___firstBaselineAnchor;
- (OALayoutYAxisAnchor *)___lastBaselineAnchor;

// This method is called once at app startup
+ (void)addAnchorMethodsIfNeeded;

@end
