begin
  require 'simplecov'
  SimpleCov.start
rescue LoadError
  # oh well
end

# Load
require File.join(File.dirname(__FILE__), '..', 'lib', 'quick_short')

# ensure that a number makes a successful round trip and then
# return its encoding
def ensure_numeric_round_trip(number)
  encoding = QuickShort::ShortId.encode(number)
  QuickShort::ShortId.decode(encoding).should == number
  encoding
end
