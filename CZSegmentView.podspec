Pod::Spec.new do |s|

s.name         = "CZSegmentView"
s.version      = "0.0.1"
s.summary      = "Custom segmented control for iOS 7 and above"

s.description  = <<-DESC
Support both images and text.
Support vertically organise segments
More customisible than UISegmentedControl and easier to expand with new style.
DESC

s.homepage     = "https://github.com/letianyuxiang/CZSegmentView"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author       = "czy"
s.platform     = :ios, "7.0"

s.ios.deployment_target = "7.0"

s.source       = { :git => "https://github.com/letianyuxiang/CZSegmentView.git", :tag => "0.0.1",:branch => "master" }


s.source_files  = "Classes", "CZSegmentView/SegmentView/*.{h,m}"
s.requires_arc = true
s.frameworks = 'UIKit'

end
