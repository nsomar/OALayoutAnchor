//
//  OATestHelpers.h
//  OALayoutAnchor
//
//  Created by Omar Abdelhafith on 17/06/2015.
//  Copyright (c) 2015 Omar Abdelhafith. All rights reserved.
//

#import <UIKit/UIKit.h>

UIView *createView(float width, float height);
UIView *createViewP(float width, float widthPriority, float height, float heightPriority, NSString *title);

void addHightToView(UIView *view, float height, float heightPriority);
void addWidthToView(UIView *view, float width, float widthPriority);

void layoutView(UIView* view);