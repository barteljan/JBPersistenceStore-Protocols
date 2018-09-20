Pod::Spec.new do |s|
  s.name             = "JBPersistenceStore-Protocols"
  s.version          = "0.3.4"
  s.summary          = "Protocols for a persistence store used as a facade for your favorite persistence library"

  s.description      = <<-DESC
Protocols for a persistence store used as a facade for your favorite persistence library
                       DESC

  s.homepage         = "https://github.com/barteljan/JBPersistenceStore-Protocols"
  s.license          = 'MIT'
  s.author           = { "Jan Bartel" => "jan.bartel@atino.net" }
  s.source           = { :git => "https://github.com/barteljan/JBPersistenceStore-Protocols.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/janbartel'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JBPersistenceStore-Protocols/Classes/**/*'

  s.dependency 'ValueCoding','~> 3.0.0'

end
