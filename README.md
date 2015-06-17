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


### Future improvements
The following would be nice to have for future versions

- [ ] Increase the test coverage for Greater than and Less Than
- [ ] Better Documentation
- [ ] Add tests for iOS 7
- [ ] Improve demo app for iOS 7


## Author

Omar Abdelhafith, o.arrabi@me.com

## License

OALayoutAnchor is available under the MIT license. See the LICENSE file for more info.
