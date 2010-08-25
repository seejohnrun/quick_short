module QuickShort

  module ShortId

    AlphabetLength = QuickShort::Alphabet.length # optimization
    
    # Encode a numeric ID
    def self.encode(id)
      alpha = ''
      while id != 0
        alpha = QuickShort::Alphabet[id % AlphabetLength].chr + alpha
        id /= AlphabetLength
      end
      alpha
    end
    
    # Decode an ID created with encode
    def self.decode(alpha)
      alpha = alpha.dup; id = 0
      0.upto(alpha.length - 1) do |i|
        letter = alpha[alpha.length - 1]
        alphabet_index = QuickShort::Alphabet.index letter
        raise ArgumentError.new("Character not in Alphabet: #{letter}") unless alphabet_index # bad character present
        id += alphabet_index * (AlphabetLength ** i)
        alpha.chop!
      end
      id
    end
    
  end
 
end
