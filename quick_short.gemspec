require File.dirname(__FILE__) + '/lib/quick_short/version'

spec = Gem::Specification.new do |s|
  s.name = 'quick_short'  
  s.author = 'John Crepezzi'
  s.add_development_dependency('rspec')
  s.description = 'quick_short is a really awesome way to generate short URLs (especially for local resources)'
  s.email = 'john@crepezzi.com'
  s.files = Dir['lib/**/*.rb']
  s.has_rdoc = true
  s.homepage = 'http://seejohnrun.github.com/quick_short/'
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.summary = 'Rails Short URL Library - Employs Magic'
  s.test_files = Dir.glob('spec/*.rb')
  s.version = QuickShort::VERSION
  s.rubyforge_project = "quick-short"
end
