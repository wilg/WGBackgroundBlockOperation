Pod::Spec.new do |s|
  s.name             = "WGBackgroundBlockOperation"
  s.version          = File.read('VERSION')
  s.summary          = "A block operation that automatically works in the background on iOS."
  s.homepage         = "https://github.com/wilg/WGBackgroundBlockOperation"
  s.license          = 'MIT'
  s.author           = { "Wil Gieseler" => "wil@wilgieseler.com" }
  s.source           = { :git => "https://github.com/wilg/WGBackgroundBlockOperation.git", :tag => s.version.to_s }

  s.platform         = :ios, '5.0'
  s.requires_arc     = true

  s.source_files = 'Classes'
end
