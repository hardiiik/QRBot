#
# Be sure to run `pod lib lint QRBot.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QRBot'
  s.version          = '0.1.0'
  s.summary          = 'QRBot, a QR Code Scanning and Generating library for iOS 9+, written in Swift 4.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'QRBot is a library to simplify QR code scanning and generating new QR code tasks. You just need to make our class as super class of your ViewController and conform one protocol to scan QR Code using your app. And for generating new Code from your data, you need to call one method. We made these complex tasks that easy for you. :)'
                       DESC

  s.homepage         = 'https://github.com/hardiiik/QRBot'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hardik Trivedi' => 'hardiktrivedi3008.ht@gmail.com' }
  s.source           = { :git => 'https://github.com/hardiiik/QRBot.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/HardikTrivedi_D'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.source_files = 'QRCodeScan/*.{swift}'
  
  # s.resource_bundles = {
  #   'QRBot' => ['QRBot/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'AVFoundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
