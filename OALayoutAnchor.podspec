#
# Be sure to run `pod lib lint OALayoutAnchor.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OALayoutAnchor"
  s.version          = "0.2.0"
  s.summary          = "Porting NSLayoutAnchor to iOS7 (100% port)."
  s.description      = <<-DESC
  `OALayoutAnchor` is an effort to port the amazing [NSLayoutAnchor](https://developer.apple.com/library/prerelease/mac/documentation/AppKit/Reference/NSLayoutAnchor_ClassReference/index.html) introduced in iOS 9 to iOS 7.

  `OALayoutAnchor` is a 100% port of `NSLayoutAnchor` to iOS 7, it aims to provide the same funtionality to iOS 7, and rollback to `NSLayoutAnchor` on iOS 9 and up.
                       DESC
  s.homepage         = "https://github.com/oarrabi/OALayoutAnchor"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Omar Abdelhafith" => "o.arrabi@me.com" }
  s.source           = { :git => "https://github.com/oarrabi/OALayoutAnchor.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ifnottrue'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'OALayoutAnchor' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
