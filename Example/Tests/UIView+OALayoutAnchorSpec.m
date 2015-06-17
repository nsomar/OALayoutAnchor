//
//  UIView+OALayoutAnchorSpec.m
//  OALayoutAnchor
//
//  Created by Omar Abdelhafith on 17/06/2015.
//  Copyright 2015 Omar Abdelhafith. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <UIKit/UIKit.h>
#import "UIView+OALayoutAnchor.h"


@interface UIView ()
- (void)setAssociatedObject:(id)object forKey:(NSString*)key;
@end

SPEC_BEGIN(UIView_OALayoutAnchorSpec)

describe(@"UIView+OALayoutAnchor", ^{

  it(@"Should create the anchor the first time", ^{
    
    UIView *view = [[UIView alloc] init];
    [[view.leadingAnchor should] beNonNil];
  });
  
  it(@"Should not create the anchor the second time", ^{
    
    UIView *view = [[UIView alloc] init];
    id v1 = view.leadingAnchor;
    id v2 = view.leadingAnchor;
    
    [[v1 should] equal:v2];
    [[v1 shouldNot] beNil];
  });
  
  context(@"Anchors", ^{
    
    it(@"Should create a leading anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.leadingAnchor;
      id v2 = view.leadingAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a trailing anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.trailingAnchor;
      id v2 = view.trailingAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a left anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.leftAnchor;
      id v2 = view.leftAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a right anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.rightAnchor;
      id v2 = view.rightAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a top anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.topAnchor;
      id v2 = view.topAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a bottom anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.bottomAnchor;
      id v2 = view.bottomAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a width anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.widthAnchor;
      id v2 = view.widthAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a height anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.heightAnchor;
      id v2 = view.heightAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a center X anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.centerXAnchor;
      id v2 = view.centerXAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a center Y anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.centerYAnchor;
      id v2 = view.centerYAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a first baseline anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.firstBaselineAnchor;
      id v2 = view.firstBaselineAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
    it(@"Should create a last baseline anchor", ^{
      
      UIView *view = [[UIView alloc] init];
      id v1 = view.lastBaselineAnchor;
      id v2 = view.lastBaselineAnchor;
      
      [[v1 should] equal:v2];
      [[v1 shouldNot] beNil];
    });
    
  });
  
});

SPEC_END
