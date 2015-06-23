Pod::Spec.new do |s|
  s.name         = "FormationLayout"
  s.version      = "0.3.0"
  s.summary      = "Yet another auto layout library in Swift 2"

  s.description  = <<-DESC
                   An auto layout library in Swift 2 that supports group layout and size classes.
                   DESC

  s.homepage     = "https://github.com/evan-liu/FormationLayout"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Evan Liu" => "evancoding@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/evan-liu/FormationLayout.git", :tag => "#{s.version}" }
  s.source_files  = "FormationLayout/*.swift"

  s.requires_arc = true
end
