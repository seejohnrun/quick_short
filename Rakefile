require 'rspec/core/rake_task'
require File.dirname(__FILE__) + '/lib/quick_short/version'

task :default => :test do
end
 
task :build => :test do
  system "gem build quick_short.gemspec"
end

task :release => :build do
  # tag and push
  system "git tag v#{QuickShort::VERSION}"
  system "git push origin --tags"
  # push the gem
  system "gem push quick_short-#{QuickShort::VERSION}.gem"
end
 
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.fail_on_error = true # be explicit
end
