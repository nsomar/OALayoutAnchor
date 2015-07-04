//
//  UIView+LayoutAnchorSwift.m
//  Pods
//
//  Created by Omar Abdelhafith on 04/07/2015.
//
//

#import "UIView+LayoutAnchorSwift.h"

//Casting to ID is needed for ios version less than 9
//please note, use this library only when using swift

@implementation UIView (LayoutAnchorSwift)

- (NSLayoutXAxisAnchor *)oa_leadingAnchor {
  return (id)self.leadingAnchor;
}

- (NSLayoutXAxisAnchor *)oa_trailingAnchor {
  return (id)self.trailingAnchor;
}

- (NSLayoutXAxisAnchor *)oa_leftAnchor {
  return (id)self.leftAnchor;
}

- (NSLayoutXAxisAnchor *)oa_rightAnchor {
  return (id)self.rightAnchor;
}

- (NSLayoutYAxisAnchor *)oa_topAnchor {
  return (id)self.topAnchor;
}

- (NSLayoutYAxisAnchor *)oa_bottomAnchor {
  return (id)self.bottomAnchor;
}

- (NSLayoutDimension *)oa_widthAnchor {
  return (id)self.widthAnchor;
}

- (NSLayoutDimension *)oa_heightAnchor {
  return (id)self.heightAnchor;
}

- (NSLayoutXAxisAnchor *)oa_centerXAnchor {
  return (id)self.centerXAnchor;
}

- (NSLayoutYAxisAnchor *)oa_centerYAnchor {
  return (id)self.centerYAnchor;
}

- (NSLayoutYAxisAnchor *)oa_firstBaselineAnchor {
  return (id)self.firstBaselineAnchor;
}

- (NSLayoutYAxisAnchor *)oa_lastBaselineAnchor {
  return (id)self.lastBaselineAnchor;
}

@end
