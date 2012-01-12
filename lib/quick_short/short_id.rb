module QuickShort

  # This module handles the actual encoding and decoding
  # of the IDs
  module ShortId

    # This is the sequence of characters we use to encode the ID
    # Note: We cut out vowels to avoid shortened strings from mistakenly
    # forming words
    Alphabet = 'bcdfghjklmnpqrstvwxyz0123456789BCDFGHJKLMNPQRSTVWXYZ'
    AlphabetLength = Alphabet.length
    
    # Encode a numeric ID
    # @param [Fixnum] id - the ID to encode
    # @return [String] the encoded ID
    def self.encode(id)
      alpha = ''
      while id != 0
        alpha = Alphabet[id % AlphabetLength].chr + alpha
        id /= AlphabetLength
      end
      alpha
    end
    
    # Decode an ID created with encode
    # @param [String] the ID to decode
    # @return [Fixnum] the decoded ID
    def self.decode(alpha)
      alpha = alpha.dup; id = 0
      0.upto(alpha.length - 1) do |i|
        letter = alpha[alpha.length - 1]
        alphabet_index = Alphabet.index letter
        unless alphabet_index # bad character present?
          raise ArgumentError.new("Character not in Alphabet: #{letter}")
        end
        id += alphabet_index * (AlphabetLength ** i)
        alpha.chop!
      end
      id
    end
    
  end
 
end
