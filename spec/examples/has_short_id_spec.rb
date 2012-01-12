require 'spec_helper'

# For easy testing
Object.send(:extend, QuickShort::HasShortId)

describe QuickShort do

  describe 'when trying a duplicate prefix' do

    it 'should raise an error' do
      class Something1
        has_short_id :prefix1
      end
      found = false
      begin
        class Something2
          has_short_id :prefix1
        end
      rescue QuickShort::DuplicatePrefix => e
        e.message.should ==
          'Duplicate prefix: prefix1 (already assigned to Something1)'
        found = true
      end
      found.should be_true
    end

  end

  describe 'when it does not has_short_id' do

    class SomethingElse
    end

    it 'should not respond to #short_id' do
      SomethingElse.new.should_not respond_to :short_id
    end

  end

  describe 'when it has a short id' do

    class Something
      has_short_id 'a'
      # some numeric id
      def id
        123
      end
    end

    it 'should be able to get the short id' do
      Something.new.short_id.should == 'a-dy'
    end

    it 'should be able to decode a short id' do
      Something.should_receive(:find_by_id).once.with(123).and_return(nil)
      QuickShort.find_by_short_id('a-dy')
    end

    it 'should be able to decode a short id for find' do
      Something.should_receive(:find).once.with(123).and_return(nil)
      QuickShort.find('a-dy')
    end

  end

end
