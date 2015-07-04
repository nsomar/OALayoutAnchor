//
//  UIView+LayoutAnchorSwift.h
//  Pods
//
//  Created by Omar Abdelhafith on 04/07/2015.
//
//

#import <UIKit/UIKit.h>

//These helpers have been added to make swift comiplation works
//In swift apis that are available for an iOS version and up, wont compile.
//To fix this you can guard agains the api. However, for a more transparent usage for anchors on ios
//7,8 and 9, if you are using swift, use oa_ prefixed version.

#ifndef __IPHONE_9_0
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

