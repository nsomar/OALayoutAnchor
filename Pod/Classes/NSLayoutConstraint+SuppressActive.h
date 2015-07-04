//
//  NSLayoutConstraint+SuppressActive.h
//  Pods
//
//  Created by Omar Abdelhafith on 18/06/2015.
//
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (SuppressActive)

/**
 *  oa_active is to be used when writing in Swift, as swift will complain that active is only ios 8 and up
 */

@property (nonatomic, assign) BOOL oa_active;

@end
