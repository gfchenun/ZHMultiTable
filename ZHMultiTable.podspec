#
#  Be sure to run `pod spec lint ZHMultiTable.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

s.name              = "ZHMultiTable"
s.version          = "0.1.0"
s.summary          = "iOS多级联动视图组件"
s.description      = <<-DESC.gsub(/^\s*\|?/,'')
An optional longer description of XUEZHIYUN

| * Markdown format.
| * Don't worry about the indent, we strip it!
DESC

  s.homepage         = "https://github.com/gfchenun/ZHMultiTable"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = { :type => 'MIT' }
  s.author           = { "chasel" => "chasel.chen@qq.com" }
  s.source           = { :git => "https://github.com/gfchenun/ZHMultiTable.git", :branch => "develop" }

s.platform     = :ios, '8.0'
s.requires_arc = true
s.public_header_files = 'Core/**/*.h'
s.source_files = 'Core/**/*.{h,m}'
s.resource_bundles = {
'ZHMultiTable' => ['Core/Assets/*.png','Core/Assets/*.jpg','Core/Assets/*.lproj']
}


# Uncomment following lines if ZHUserKit depends on any system framework.
#  s.frameworks = 'UIKit'

# Uncomment following lines if ZHUserKit depends on any public or private pod.
s.dependency 'BCComConfigKit'

end
