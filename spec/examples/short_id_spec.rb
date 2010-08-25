require File.dirname(__FILE__) + '/spec_helper'

describe QuickShort::ShortId do

  it 'tells the truth' do
    true.should be(true)
  end

  it 'can encode a number' do
    encoding = ensure_numeric_round_trip(1234)
    encoding.should == '2K'
  end

  it 'can encode a long number' do
    encoding = ensure_numeric_round_trip(123456789012345678901234567890)
    encoding.should == 'QnsPltL3X07DmcRK5'
  end

  it 'errors properly when it gets a string to encode that has characters outside of the alphabet' do
    lambda do
      QuickShort::ShortId.decode('hello}')
    end.should raise_error(ArgumentError)
  end
  
end
