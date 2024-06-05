Pod::Spec.new do |s|
  s.name             = 'ZTStyle'
  s.version          = '1.0.0'
  s.summary          = 'A lightweight Swift library for applying styles to UI components using a chainable syntax.'

  s.description      = <<-DESC
                          ZTStyle is a lightweight Swift library for applying styles to UI components using a chainable syntax.
                        DESC

  s.homepage         = 'https://github.com/willonboy/ZTStyle'
  s.license          = { :type => 'MPL-2.0', :file => 'LICENSE' }
  s.author           = { 'trojan zhang' => 'willonboy@qq.com' }
  s.source           = { :git => 'https://github.com/willonboy/ZTStyle.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/**/*.{swift,h,m}'
  s.exclude_files = 'Sources/Exclude'

  s.platforms = { :ios => '11.0', :osx => '10.15' }

  s.swift_version = '4.2'
  
  s.dependency 'ZTChain', '~> 1.0.0'
end
