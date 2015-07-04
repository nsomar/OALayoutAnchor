# OALayoutAnchor

[![Build Status](https://travis-ci.org/oarrabi/OALayoutAnchor.svg)](https://travis-ci.org/oarrabi/OALayoutAnchor)
[![Version](https://img.shields.io/cocoapods/v/OALayoutAnchor.svg?style=flat)](http://cocoapods.org/pods/OALayoutAnchor)
[![License](https://img.shields.io/cocoapods/l/OALayoutAnchor.svg?style=flat)](http://cocoapods.org/pods/OALayoutAnchor)
[![Platform](https://img.shields.io/cocoapods/p/OALayoutAnchor.svg?style=flat)](http://cocoapods.org/pods/OALayoutAnchor)

`OALayoutAnchor` is an effort to port the amazing [NSLayoutAnchor](https://developer.apple.com/library/prerelease/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/index.html) introduced in iOS 9 to iOS 7.

`OALayoutAnchor` is a 100% port of `NSLayoutAnchor` to iOS 7, it aims to provide the same functionality to iOS 7, and rollback to `NSLayoutAnchor` on iOS 9 and up.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Usage is 100% compatible with `NSLayoutAnchors`.:   
Example Usage (Taken from apple websites):

```objc
// Creating constraints using NSLayoutConstraint
[NSLayoutConstraint
 constraintWithItem:subview
 attribute:NSLayoutAttributeLeading
 relatedBy:NSLayoutRelationEqual
 toItem:self.view
 attribute:NSLayoutAttributeLeadingMargin
 multiplier:1.0
 constant:0.0].active = YES;
 
[NSLayoutConstraint
 constraintWithItem:subview
 attribute:NSLayoutAttributeTrailing
 relatedBy:NSLayoutRelationEqual
 toItem:self.view
 attribute:NSLayoutAttributeTrailingMargin
 multiplier:1.0
 constant:0.0].active = YES;
 
 ```

The following constraint setup can be rewritten to the following:

```
// Creating the same constraints using Layout Anchors
UILayoutGuide *margin = self.view.layoutMarginsGuide;
 
[subview.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
[subview.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
```

For iOS 7, since `active` property is not available on `NSLayoutConstraint` the constraint set will be already installed. The bellow code shows the usage on iOS7:   

```objc
// Creating the same constraints using Layout Anchors
UILayoutGuide *margin = self.view.layoutMarginsGuide;
 
[subview.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor];
[subview.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor];
```

For a better documentation please refer to [apple docs](https://developer.apple.com/library/prerelease/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/index.html).

## Installation

OALayoutAnchor is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OALayoutAnchor"
```

## Tests

There are several unit tests covering most of the Equality constraints. Unit test for covering Greater than or Lesser than are coming next.

Test are currently running for iOS 8 only, test for iOS 7 are coming next.

The following a [human readable](https://raw.githubusercontent.com/oarrabi/OALayoutAnchor/master/Example/Tests/tests.transcript.txt?token=ABZLPLZHHBeo2g41rVZSKjCf-_DnrTnFks5ViydLwA%3D%3D) text subscript (generated with [specipy](https://github.com/oarrabi/specipy)).

### Notes on usage in iOS 7

Since iOS7 `NSLayoutConstraint` does not have an `active` property, the category `NSLayoutConstraint+SuppressActive` was introduced to make the usage of the constraints transparent between iOS7 and 8.

When using the bellow line:
```objc
[label1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
```

On iOS 8, the returned constraint is not active until we call `.active = YES` on it. However, on iOS 7, since there is no active property on `NSLayoutConstraint`. a method has been attached to the `NSLayoutConstraint` to ignore the `isActive` method calls.

That means that calling `isActive` or `active` on iOS 7 will not crash the app, these calls will just be ignored.

### Notes on usage in swift
Since anchor UIView's properties are annotated with `NS_AVAILABLE_IOS(9_0);`, it makes them unusable with swift when the app deployment target is less than iOS9.
The compiler will not allow the usage of anchor properties without guarding against the iOS version.

    if #available(iOS 9.0, *) {
        view.leftAnchor
    } else {
        // Fallback on earlier versions
    }

In order to target this problem, `OALayoutAnchor` contains a mirror of all the anchor properties. these properties are named with a prefix of `oa_`

    var oa_leadingAnchor: NSLayoutXAxisAnchor! { get }
    var oa_trailingAnchor: NSLayoutXAxisAnchor! { get }
    var oa_leftAnchor: NSLayoutXAxisAnchor! { get }
    ... etc..

As an example, using `oa_leadingAnchor` in iOS 9 and up, will forward the invocation to `leadingAnchor`. On iOS 8 and 7, this call will use the layout anchor from `OALayourAnchor`.

`NSLayoutConstraint` `active` property is also unusable in swift for any iOS less than 8. In order to address this issue please use `oa_active`.
Using `oa_active` will result in using `active` on iOS 8,9 and doing nothing on iOS 7.

This is an example in swift:

    view1.oa_widthAnchor.constraintEqualToConstant(100).oa_active = true
    view1.oa_heightAnchor.constraintEqualToConstant(100).oa_active = true
    view1.oa_centerXAnchor.constraintEqualToAnchor(self.view.oa_centerXAnchor).oa_active = true
    view1.oa_centerYAnchor.constraintEqualToAnchor(self.view.oa_centerYAnchor).oa_active = true

### Future improvements
The following would be nice to have for future versions

- [ ] Increase the test coverage for Greater than and Less Than
- [ ] Better Documentation
- [ ] Add tests for iOS 7


## Author

Omar Abdelhafith, o.arrabi@me.com

## License

OALayoutAnchor is available under the MIT license. See the LICENSE file for more info.
