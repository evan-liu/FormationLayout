Pod::Spec.new do |s|
  s.name         = "FormationLayout"
  s.version      = "0.8.1"
  
  s.summary      = "Yet Another Swift Auto Layout DSL"
  
  s.homepage     = "https://github.com/evan-liu/FormationLayout.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Evan Liu" => "evancoding@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/evan-liu/FormationLayout.git", :tag => "#{s.version}" }
  s.source_files = "Sources/**/*"
end
