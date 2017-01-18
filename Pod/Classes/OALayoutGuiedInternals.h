//
//  OALayoutGuiedInternals.h
//  Pods
//
//  Created by Tayphoon on 18.01.17.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import "OALayoutGuide.h"

@interface OALayoutGuide(Internals)

+ (instancetype)layoutGuideForView:(UIView*)view;

- (instancetype)initWithView:(UIView*)view;

@end
