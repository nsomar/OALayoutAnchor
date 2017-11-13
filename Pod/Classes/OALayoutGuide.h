//
//  OALayoutGuide.h
//  Pods
//
//  Created by Tayphoon on 18.01.17.
//  Copyright © 2017 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OALayoutAnchor.h"

@interface OALayoutGuide : NSObject

/* The frame of the UILayoutGuide in its owningView's coordinate system.
 Valid by the time the owningView receives -layoutSubviews.
 */
@property (nonatomic, readonly) CGRect layoutFrame;

/* The guide must be added to a view with -[UIView addLayoutGuide:] before being used in a constraint.
 Do not use this property directly to change the owningView of a layout guide. Instead, use
 -[UIView addLayoutGuide:] and -[UIView removeLayoutGuide:], which will use this property to
 change the owningView.
 */
@property (nonatomic, weak) UIView * owningView;

/* For ease of debugging.
 'UI' prefix is reserved for UIKit-created layout guides.
 */
@property (nonatomic, copy) NSString * identifier;


/* Constraint creation conveniences. See NSLayoutAnchor.h for details.
 */
@property (nonatomic, readonly) OALayoutXAxisAnchor * leadingAnchor;
@property (nonatomic, readonly) OALayoutXAxisAnchor * trailingAnchor;
@property (nonatomic, readonly) OALayoutXAxisAnchor * leftAnchor;
@property (nonatomic, readonly) OALayoutXAxisAnchor * rightAnchor;

@property (nonatomic, readonly) OALayoutYAxisAnchor * topAnchor;
@property (nonatomic, readonly) OALayoutYAxisAnchor * bottomAnchor;

@property (nonatomic, readonly) OALayoutDimension * widthAnchor;
@property (nonatomic, readonly) OALayoutDimension * heightAnchor;

@property (nonatomic, readonly) OALayoutXAxisAnchor * centerXAnchor;
@property (nonatomic, readonly) OALayoutYAxisAnchor * centerYAnchor;

@end
