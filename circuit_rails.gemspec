# Ensure we require the local version and not one we might have installed already
spec = Gem::Specification.new do |s| 
  s.name = 'circuit_rails'
  s.version = '0.0.1'
  s.author = 'Markus Benning'
  s.email = 'ich@markusbenning.de'
  s.homepage = 'https://github.com/benningm/circuit_rails'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Action Mailer adapter for using Circuit in Rails apps.'
  s.license = 'MIT'
  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('bin/*') + Dir.glob('[A-Z]*') + Dir.glob('test/**/*')
  s.require_paths << 'lib'
  s.add_development_dependency('rake', '~> 12')
  s.add_development_dependency('rdoc', '~> 6')
  s.add_development_dependency('aruba', '~> 0')
  s.add_runtime_dependency('circuit_client', '~> 0')
end
