//
//  UIView+OALayoutAnchor.h
//  Pods
//
//  Created by Omar Abdelhafith on 17/06/2015.
//
//

#import <UIKit/UIKit.h>
#import "OALayoutAnchor.h"


#ifndef __IPHONE_9_0
@interface UIView (OALayoutAnchor)

@property(readonly, strong) OALayoutXAxisAnchor *leadingAnchor;
@property(readonly, strong) OALayoutXAxisAnchor *trailingAnchor;
@property(readonly, strong) OALayoutXAxisAnchor *leftAnchor;
@property(readonly, strong) OALayoutXAxisAnchor *rightAnchor;

@property(readonly, strong) OALayoutYAxisAnchor *topAnchor;
@property(readonly, strong) OALayoutYAxisAnchor *bottomAnchor;

@property(readonly, strong) OALayoutDimension *widthAnchor;
@property(readonly, strong) OALayoutDimension *heightAnchor;

@property(readonly, strong) OALayoutXAxisAnchor *centerXAnchor;
@property(readonly, strong) OALayoutYAxisAnchor *centerYAnchor;

@property(readonly, strong) OALayoutYAxisAnchor *firstBaselineAnchor;
@property(readonly, strong) OALayoutYAxisAnchor *lastBaselineAnchor;

@end
#endif
