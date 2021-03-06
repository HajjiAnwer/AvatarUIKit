#
# Be sure to run `pod lib lint AvatarUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AvatarUIKit'
  s.version          = '1.0.0'
  s.summary          = 'A short description of AvatarUIKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'TODO: Add long description of the pod here.'
                       DESC

  s.homepage         = 'https://github.com/HajjiAnwer/AvatarUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HajjiAnwer' => 'hajjianwer2013@gmail.com' }
  s.source           = { :git => 'https://github.com/HajjiAnwer/AvatarUIKit.git', :tag => s.version.to_s }
 

  s.ios.deployment_target = '11.0'

  s.source_files = 'Source/**/*'
  
  s.dependency 'Kingfisher', '~> 5.0'
  
end
