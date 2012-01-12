module QuickShort

  # A mixin for registering a class with short_ids
  module HasShortId

    # Register this class with QuickShort with a certain
    # prefix.  With prefix 'a', will generate ids like 'a-lksdjf'
    # @param [String] prefix - The prefix for this class
    def has_short_id(prefix)
      send(:include, InstanceMethods)  
      if QuickShort.short_id_prefixes.has_key?(prefix)
        raise QuickShort::DuplicatePrefix.new(prefix)
      else
        QuickShort.short_id_prefixes[prefix] = self
        self
      end
    end

    # Instance methods for things that has_short_id
    module InstanceMethods

      # Get the short id (expects a method named #id to be
      # defined on this class)
      # @return [String] the generated short id
      def short_id
        if id
          prefix = QuickShort.short_id_prefixes.key(self.class)
          "#{prefix}-#{QuickShort::ShortId.encode(id)}"
        end
      end

    end

  end

end
