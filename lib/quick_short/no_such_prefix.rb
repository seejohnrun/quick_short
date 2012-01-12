module QuickShort

  # When there is no such prefix
  class NoSuchPrefix < StandardError

    def initialize(prefix)
      super "No such prefix registered: #{prefix}"
    end

  end

end
