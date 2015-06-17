# OALayoutAnchor

`OALayoutAnchor` is an effort to port the amazing [NSLayoutAnchor](https://developer.apple.com/library/prerelease/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/index.html) introduced in iOS 9 to iOS 7.

`OALayoutAnchor` is a 100% port of `NSLayoutAnchor` to iOS 7, it aims to provide the same funtionality to iOS 7, and rollback to `NSLayoutAnchor` on iOS 9 and up.

[![CI Status](http://img.shields.io/travis/Omar Abdelhafith/OALayoutAnchor.svg?style=flat)](https://travis-ci.org/Omar Abdelhafith/OALayoutAnchor)
[![Version](https://img.shields.io/cocoapods/v/OALayoutAnchor.svg?style=flat)](http://cocoapods.org/pods/OALayoutAnchor)
[![License](https://img.shields.io/cocoapods/l/OALayoutAnchor.svg?style=flat)](http://cocoapods.org/pods/OALayoutAnchor)
[![Platform](https://img.shields.io/cocoapods/p/OALayoutAnchor.svg?style=flat)](http://cocoapods.org/pods/OALayoutAnchor)

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
 
// Creating the same constraints using Layout Anchors
UILayoutGuide *margin = self.view.layoutMarginsGuide;
 
[subview.leadingAnchor constraintEqualToAnchor:margin.leadingAnchor].active = YES;
[subview.trailingAnchor constraintEqualToAnchor:margin.trailingAnchor].active = YES;
```

For a better documentation please refer to [apple docs](https://developer.apple.com/library/prerelease/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/index.html).

## Installation

OALayoutAnchor is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OALayoutAnchor"
```

## Tests

There are several unit tests covering most of the Equality constraints. Unit test for covering Greater than or Lesser than are comming next.

The following a [human readable](https://raw.githubusercontent.com/oarrabi/OALayoutAnchor/master/Example/Tests/tests.transcript.txt?token=ABZLPLZHHBeo2g41rVZSKjCf-_DnrTnFks5ViydLwA%3D%3D) text subscript (generated with [specipy](https://github.com/oarrabi/specipy)).


### Future improvments
The following would be nice to have for future versions

- [ ] Increase the test coverage for Greater than and Less Than
- [ ] Better Documentation


## Author

Omar Abdelhafith, o.arrabi@me.com

## License

OALayoutAnchor is available under the MIT license. See the LICENSE file for more info.
