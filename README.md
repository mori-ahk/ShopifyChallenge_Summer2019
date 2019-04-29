# ShopifyChallenge - Summer 2019
Shopify asked to build this iOS mobile application to check coding skills for iOS internship positions(Winter 2018).
## Getting Started
### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:
```bash
$ gem install cocoapods
```
Navigate to directory containing Xcode project and create a Podfile by running the follwing command:

```bash
$ pod init
```
### Alamofire

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire', '~> 4.7'
end
```
Then, run the following command:

```bash
$ pod install
```

> CocoaPods 1.1+ is required to build Alamofire 4.0+.
