//
//  UIView+LayoutGuide.h
//  Pods
//
//  Created by Tayphoon on 18.01.17.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OALayoutGuide.h"

@interface UIView (LayoutGuide)

#ifndef __IPHONE_9_0
@property (readonly, strong) OALayoutGuide * layoutMarginsGuide;
#endif

@end
