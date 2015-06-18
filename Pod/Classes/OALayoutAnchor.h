//
//  OALayoutConstraint.h
//  Pods
//
//  Created by Omar Abdelhafith on 17/06/2015.
//
//

#import <UIKit/UIKit.h>


@interface OALayoutAnchor : NSObject

- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutAnchor*)anchor;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutAnchor*)anchor;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutAnchor*)anchor;

/* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutAnchor*)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutAnchor*)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutAnchor*)anchor constant:(CGFloat)c;

@end

@interface OALayoutXAxisAnchor : OALayoutAnchor
@end

@interface OALayoutYAxisAnchor : OALayoutAnchor
@end

@interface OALayoutDimension : OALayoutAnchor

/* These methods return an inactive constraint of the form
 thisVariable = constant.
 */
- (NSLayoutConstraint *)constraintEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToConstant:(CGFloat)c;

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m;

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier + constant.
 */
- (NSLayoutConstraint *)constraintEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)constraintLessThanOrEqualToAnchor:(OALayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;

@end