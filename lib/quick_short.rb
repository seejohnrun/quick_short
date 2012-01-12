module QuickShort

  autoload :ShortId, File.dirname(__FILE__) + '/quick_short/short_id'
  autoload :HasShortId, File.dirname(__FILE__) + '/quick_short/has_short_id'

  autoload :DuplicatePrefix, File.dirname(__FILE__) + '/quick_short/duplicate_prefix'
  autoload :NoSuchPrefix, File.dirname(__FILE__) + '/quick_short/no_such_prefix'

  class << self

    # The current mapping of short_id_prefixes
    # @return [Hash] the mapping
    def short_id_prefixes
      @prefixes ||= {}
    end

    # A convenient alias for #find which locates the class and calls find(id)
    # @param [String] short_id - the short id to look up
    def find(short_id)
      lookup(short_id) do |klass, id|
        klass.find id
      end
    end

    # A convenient alias for #find_by_id which locates the class and calls
    # find_by_id(id)
    # @param [String] short_id - the short id to look up
    def find_by_short_id(short_id)
      lookup(short_id) do |klass, id|
        klass.find_by_id id
      end
    end

    # Look up a short id, and yield [klass, id] to a block, or return as array
    # @param [String] short_id - the short id to look up
    def lookup(short_id)
      prefix, short_id = short_id.split('-', 2)
      if klass = short_id_prefixes[prefix]
        id = QuickShort::ShortId.decode(short_id)
        if block_given?
          yield klass, id # return result
        else
          [klass, id] # otherwise, return [klass, id]
        end
      else
        raise NoSuchPrefix.new(prefix)
      end
    end

  end

end
