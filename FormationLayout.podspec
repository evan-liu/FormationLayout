Pod::Spec.new do |s|
  s.name         = "FormationLayout"
  s.version      = "0.1"
  s.summary      = ""
  s.description  = <<-DESC
  DESC
  s.homepage     = "https://github.com/evan-liu/FormationLayout.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Evan Liu" => "evancoding@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/evan-liu/FormationLayout.git.git", :tag => "0.1" }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
