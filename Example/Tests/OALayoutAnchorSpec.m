//
//  OALayoutAnchorSpec.m
//  OALayoutAnchor
//
//  Created by Omar Abdelhafith on 17/06/2015.
//  Copyright 2015 Omar Abdelhafith. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "UIView+OALayoutAnchor.h"
#import "OATestHelpers.h"

SPEC_BEGIN(OALayoutAnchorSpec)

describe(@"OALayoutAnchor", ^{
  
  context(@"Leading Anchors and Top", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.leadingAnchor constraintEqualToAnchor:parentView.leadingAnchor].active = YES;
      [view1.leadingAnchor constraintEqualToAnchor:view2.leadingAnchor].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
      [view1.topAnchor constraintEqualToAnchor:view2.topAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(0, 0, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(0, 0, 500, 30))];
    });
    
    it(@"can place views correctly with positive constants", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.leadingAnchor constraintEqualToAnchor:parentView.leadingAnchor constant:100].active = YES;
      [view2.leadingAnchor constraintEqualToAnchor:view1.leadingAnchor constant:100].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor constant:100].active = YES;
      [view2.topAnchor constraintEqualToAnchor:view1.topAnchor constant:100].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(100, 100, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(200, 200, 500, 30))];
    });
    
    it(@"can place views correctly with negative constants", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.leadingAnchor constraintEqualToAnchor:parentView.leadingAnchor constant:100].active = YES;
      [view2.leadingAnchor constraintEqualToAnchor:view1.leadingAnchor constant:100].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor constant:100].active = YES;
      [view2.topAnchor constraintEqualToAnchor:view1.topAnchor constant:-100].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(100, 100, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(200, 0, 500, 30))];
    });
    
  });
  
  
  context(@"Trailing Anchors and Bottom", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.trailingAnchor constraintEqualToAnchor:parentView.trailingAnchor].active = YES;
      [view1.trailingAnchor constraintEqualToAnchor:view2.trailingAnchor].active = YES;
      
      [view1.bottomAnchor constraintEqualToAnchor:parentView.bottomAnchor].active = YES;
      [view1.bottomAnchor constraintEqualToAnchor:view2.bottomAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(800, 980, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(500, 970, 500, 30))];
    });
    
    it(@"can place views correctly with positive constants", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.trailingAnchor constraintEqualToAnchor:parentView.trailingAnchor constant:100].active = YES;
      [view2.trailingAnchor constraintEqualToAnchor:view1.trailingAnchor constant:100].active = YES;
      
      [view1.bottomAnchor constraintEqualToAnchor:parentView.bottomAnchor constant:100].active = YES;
      [view2.bottomAnchor constraintEqualToAnchor:view1.bottomAnchor constant:100].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(900, 1080, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(700, 1170, 500, 30))];
    });
    
    it(@"can place views correctly with negative constants", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.trailingAnchor constraintEqualToAnchor:parentView.trailingAnchor constant:-100].active = YES;
      [view2.trailingAnchor constraintEqualToAnchor:view1.trailingAnchor constant:-100].active = YES;
      
      [view1.bottomAnchor constraintEqualToAnchor:parentView.bottomAnchor constant:-100].active = YES;
      [view2.bottomAnchor constraintEqualToAnchor:view1.bottomAnchor constant:-100].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(700, 880, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(300, 770, 500, 30))];
    });
    
  });
  
  
  context(@"Leading to Trailing and Top - Top", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.leadingAnchor constraintEqualToAnchor:parentView.leadingAnchor].active = YES;
      [view2.leadingAnchor constraintEqualToAnchor:view1.trailingAnchor constant:100].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
      [view1.topAnchor constraintEqualToAnchor:view2.topAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(0, 0, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(300, 0, 500, 30))];
    });
    
  });
  
  
  context(@"Trailing to Leading and Top - Top", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.trailingAnchor constraintEqualToAnchor:parentView.trailingAnchor constant:-100].active = YES;
      [view2.trailingAnchor constraintEqualToAnchor:view1.leadingAnchor constant:0].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
      [view1.topAnchor constraintEqualToAnchor:view2.topAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(700, 0, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(200, 0, 500, 30))];
    });
    
  });
  
  context(@"Left to Left and Top - Bottom", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.leftAnchor constraintEqualToAnchor:parentView.leftAnchor constant:100].active = YES;
      [view2.leftAnchor constraintEqualToAnchor:view1.rightAnchor constant:100].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
      [view2.topAnchor constraintEqualToAnchor:view1.bottomAnchor constant:10].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(100, 0, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(400, 30, 500, 30))];
    });
    
  });
  
  
  context(@"Right to Right and Top - Bottom", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.rightAnchor constraintEqualToAnchor:parentView.rightAnchor constant:-100].active = YES;
      [view2.rightAnchor constraintEqualToAnchor:view1.leftAnchor constant:-100].active = YES;
      
      [view1.topAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
      [view2.topAnchor constraintEqualToAnchor:view1.bottomAnchor constant:10].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(700, 0, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(100, 30, 500, 30))];
    });
    
  });
  
  
  context(@"CenterX and Bottom - Bottom", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.centerXAnchor constraintEqualToAnchor:parentView.centerXAnchor].active = YES;
      [view2.centerXAnchor constraintEqualToAnchor:view1.centerXAnchor constant:100].active = YES;
      
      [view1.bottomAnchor constraintEqualToAnchor:parentView.bottomAnchor constant:-100].active = YES;
      [view2.bottomAnchor constraintEqualToAnchor:view1.topAnchor constant:-10].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(400, 880, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(350, 840, 500, 30))];
    });
    
  });
  
  
  context(@"CenterY and Leading", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 1000, 20, 1000, @"View 1");
      view2 = createViewP(500, 1000, 30, 1000, @"View 2");
      view3 = createViewP(600, 1000, 40, 1000, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.centerYAnchor constraintEqualToAnchor:parentView.centerYAnchor].active = YES;
      [view2.centerYAnchor constraintEqualToAnchor:view1.centerYAnchor constant:100].active = YES;
      
      [view1.leadingAnchor constraintEqualToAnchor:parentView.leadingAnchor constant:100].active = YES;
      [view2.leadingAnchor constraintEqualToAnchor:view1.leadingAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(100, 490, 200, 20))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(100, 585, 500, 30))];
    });
    
  });
  
  
  context(@"Width and height", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 250, 20, 250, @"View 1");
      view2 = createViewP(500, 250, 30, 250, @"View 2");
      view3 = createViewP(600, 250, 40, 250, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      
      [view1.widthAnchor constraintEqualToConstant:300].active = YES;
      [view1.heightAnchor constraintEqualToConstant:300].active = YES;
      
      [view1.leftAnchor constraintEqualToAnchor:parentView.leftAnchor];
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(0, 0, 300, 300))];
    });
    
  });
  
  
  context(@"Width and height with multipliers", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 250, 20, 250, @"View 1");
      view2 = createViewP(500, 250, 30, 250, @"View 2");
      view3 = createViewP(600, 250, 40, 250, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.widthAnchor constraintEqualToConstant:100].active = YES;
      [view1.heightAnchor constraintEqualToConstant:100].active = YES;
      
      [view2.widthAnchor constraintEqualToAnchor:view1.widthAnchor multiplier:2].active = YES;
      [view2.heightAnchor constraintEqualToAnchor:view1.heightAnchor multiplier:2].active = YES;
      
      [view1.centerXAnchor constraintEqualToAnchor:parentView.centerXAnchor].active = YES;
      [view1.centerYAnchor constraintEqualToAnchor:parentView.centerYAnchor].active = YES;
      
      [view2.centerXAnchor constraintEqualToAnchor:parentView.centerXAnchor].active = YES;
      [view2.centerYAnchor constraintEqualToAnchor:parentView.centerYAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(450, 450, 100, 100))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(400, 400, 200, 200))];
    });
    
  });
  
  
  context(@"Width and height with multipliers and constants", ^{
    
    __block UIView *view1, *view2, *view3;
    
    beforeEach(^{
      view1 = createViewP(200, 250, 20, 250, @"View 1");
      view2 = createViewP(500, 250, 30, 250, @"View 2");
      view3 = createViewP(600, 250, 40, 250, @"View 3");
    });
    
    it(@"can place views correctly", ^{
      UIView *parentView = createViewP(1000, 1000, 1000, 1000, @"Parent");
      [parentView addSubview:view1];
      [parentView addSubview:view2];
      
      [view1.widthAnchor constraintEqualToConstant:100].active = YES;
      [view1.heightAnchor constraintEqualToConstant:100].active = YES;
      
      [view2.widthAnchor constraintEqualToAnchor:view1.widthAnchor multiplier:2 constant:20].active = YES;
      [view2.heightAnchor constraintEqualToAnchor:view1.heightAnchor multiplier:2 constant:20].active = YES;
      
      [view1.centerXAnchor constraintEqualToAnchor:parentView.centerXAnchor].active = YES;
      [view1.centerYAnchor constraintEqualToAnchor:parentView.centerYAnchor].active = YES;
      
      [view2.centerXAnchor constraintEqualToAnchor:parentView.centerXAnchor].active = YES;
      [view2.centerYAnchor constraintEqualToAnchor:parentView.centerYAnchor].active = YES;
      
      layoutView(parentView);
      
      [[theValue(view1.frame) should] equal:theValue(CGRectMake(450, 450, 100, 100))];
      [[theValue(view2.frame) should] equal:theValue(CGRectMake(390, 390, 220, 220))];
    });
    
  });
  
});

SPEC_END

