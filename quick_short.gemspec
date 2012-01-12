require File.dirname(__FILE__) + '/lib/quick_short/version'

spec = Gem::Specification.new do |s|
  s.name = 'quick_short'  
  s.author = 'John Crepezzi'
  s.add_development_dependency('rspec')
  s.description = 'quick_short is a really awesome way to generate short URLs (especially for local resources)'
  s.email = 'john.crepezzi@gmail.com'
  s.files = Dir['lib/**/*.rb']
  s.has_rdoc = true
  s.homepage = 'https://github.com/seejohnrun/quick_short'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'awesome short URL library'
  s.test_files = Dir.glob('spec/*.rb')
  s.version = QuickShort::VERSION
end
