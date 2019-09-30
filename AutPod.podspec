#
# Be sure to run `pod lib lint AutPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutPod'
  s.version          = '0.1.0'
  s.summary          = 'A custom test-pod having collection of other pods'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"Making a private collection of the pods so that if for bad day on the earth, anytime in future the open source projects goes down, I will always have a copy of the project dependencies."
                       DESC

  s.homepage         = 'https://github.com/sourabhardwaj/AutPod'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sourabh Bhardwaj' => 'ssourabh.sb1@gmail.com' }
  s.source           = { :git => 'https://github.com/sourabhardwaj/Pod4Pods.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.swift_version = "4.0"
  s.source_files = 'AutPod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AutPod' => ['AutPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  # Barcode sdk
  s.dependency "BarcodeScanner", "4.1.3"

  # Dropbox sdk
  s.dependency "SwiftyDropbox", "5.0.0"

  # Local database wrapper
  s.dependency "CoreStore", "6.1.0"
  
  # Logger
  s.dependency "XCGLogger", "6.1.0"
  
  # Keyboard manager
  s.dependency "IQKeyboardManagerSwift", "6.2.0"

  # AWS
  s.dependency "AWSUserPoolsSignIn", "2.9.0"
  s.dependency "AWSAuthUI", "2.9.0"
  s.dependency "AWSMobileClient", "2.9.0"
  s.dependency "AWSCore", "2.9.0"
  s.dependency "AWSS3", "2.9.0"
  s.dependency "AWSCognito", "2.9.0"
end
