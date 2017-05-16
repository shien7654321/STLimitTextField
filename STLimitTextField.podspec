Pod::Spec.new do |s|

  s.name         = "STLimitTextField"
  s.version      = "0.0.1"
  s.summary      = "A textfield that can limit the length of the text."
  s.homepage     = "https://github.com/shien7654321/STLimitTextField"
  s.author       = { "Suta" => "shien7654321@163.com" }
  s.source       = { :git => "https://github.com/shien7654321/STLimitTextField.git", :tag => s.version.to_s }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.frameworks   = "Foundation", "UIKit"
  s.source_files = "STLimitTextField/*.{h,m}"
  s.compiler_flags = "-fmodules"
  s.description    = <<-DESC
  STLimitTextField is a textfield that can limit the length of the text.
                       DESC

end
