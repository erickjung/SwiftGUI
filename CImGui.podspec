#
#  Be sure to run `pod spec lint CImGui.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "CImGui"
  spec.version      = "0.0.1"
  spec.summary      = "hellow"
  spec.description  = <<-DESC
                    hellow
                   DESC

  spec.homepage     = "https://github.com/erickjung/SwiftGUI"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Erick Jung" => "erickjung@gmail.com" }
  spec.social_media_url   = "https://twitter.com/erickjung"

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.13"

  spec.source       = { :git => "https://github.com/erickjung/SwiftGUI.git", :tag => "#{spec.version}" }

  spec.source_files  = "CImGui/**/*.{h,m}"

end
