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
- (OALayoutXAxisAnchor *)oa_leadingAnchor;
- (OALayoutXAxisAnchor *)oa_trailingAnchor;
- (OALayoutXAxisAnchor *)oa_leftAnchor;
- (OALayoutXAxisAnchor *)oa_rightAnchor;
- (OALayoutYAxisAnchor *)oa_topAnchor;
- (OALayoutYAxisAnchor *)oa_bottomAnchor;
- (OALayoutDimension *)oa_widthAnchor;
- (OALayoutDimension *)oa_heightAnchor;
- (OALayoutXAxisAnchor *)oa_centerXAnchor;
- (OALayoutYAxisAnchor *)oa_centerYAnchor;
- (OALayoutYAxisAnchor *)oa_firstBaselineAnchor;
- (OALayoutYAxisAnchor *)oa_lastBaselineAnchor;

// This method is called once at app startup
+ (void)addAnchorMethodsIfNeeded;

@end
