//
//  UIView+LayoutAnchorSwift.h
//  Pods
//
//  Created by Omar Abdelhafith on 04/07/2015.
//
//

#import <UIKit/UIKit.h>

// These helpers have been added to make Swift compilation work
// In Swift, APIs that are available for an iOS version and up wont compile on older SDK versions.
// To fix this you can guard against the API. However, for a more transparent usage for anchors on iOS
// 7, 8, and 9, if you are using Swift, use oa_ prefixed version.

#if __IPHONE_OS_VERSION_MIN_REQUIRED < 90000
#import <OALayoutAnchor/UIView+OALayoutAnchor.h>
#import <OALayoutAnchor/OALayoutAnchor.h>
#define NSLayoutXAxisAnchor OALayoutXAxisAnchor
#define NSLayoutYAxisAnchor OALayoutYAxisAnchor
#define NSLayoutDimension OALayoutDimension
#endif

@interface UIView (LayoutAnchorSwift)

@property(readonly, strong) NSLayoutXAxisAnchor *oa_leadingAnchor;
@property(readonly, strong) NSLayoutXAxisAnchor *oa_trailingAnchor;
@property(readonly, strong) NSLayoutXAxisAnchor *oa_leftAnchor;
@property(readonly, strong) NSLayoutXAxisAnchor *oa_rightAnchor;
@property(readonly, strong) NSLayoutYAxisAnchor *oa_topAnchor;
@property(readonly, strong) NSLayoutYAxisAnchor *oa_bottomAnchor;
@property(readonly, strong) NSLayoutDimension *oa_widthAnchor;
@property(readonly, strong) NSLayoutDimension *oa_heightAnchor;
@property(readonly, strong) NSLayoutXAxisAnchor *oa_centerXAnchor;
@property(readonly, strong) NSLayoutYAxisAnchor *oa_centerYAnchor;
@property(readonly, strong) NSLayoutYAxisAnchor *oa_firstBaselineAnchor;
@property(readonly, strong) NSLayoutYAxisAnchor *oa_lastBaselineAnchor;

@end

