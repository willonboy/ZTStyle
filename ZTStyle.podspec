Pod::Spec.new do |s|
  s.name             = 'ZTStyle'
  s.version          = '2.0.0'
  s.summary          = 'A lightweight Swift library for customizing and applying styles to UIKit or SwiftUI components, just like using CSS styles.'

  s.description      = <<-DESC
                          ZTStyle is a lightweight Swift library for customizing and applying styles to UIKit or SwiftUI components, just like using CSS styles.
                        DESC

  s.homepage         = 'https://github.com/willonboy/ZTStyle'
  s.license          = { :type => 'AGPLv3', :file => 'LICENSE' }
  s.author           = { 'trojan zhang' => 'willonboy@qq.com' }
  s.source           = { :git => 'https://github.com/willonboy/ZTStyle.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/**/*.{swift,h,m}'
  s.exclude_files = 'Sources/Exclude'

  s.platforms = { :ios => '13.0', :osx => '10.15' }

  s.swift_version = '4.2'
  
  s.dependency 'ZTChain', '~> 1.0.0'
end
