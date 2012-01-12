module QuickShort

  class DuplicatePrefix < StandardError

    # When trying to register the same key twice
    def initialize(prefix)
      klass = QuickShort.short_id_prefixes[prefix]
      super "Duplicate prefix: #{prefix} (already assigned to #{klass.name})"
    end

  end

end
