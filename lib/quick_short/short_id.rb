module QuickShort

  # This module handles the actual encoding and decoding
  # of the IDs
  module ShortId

    # This is the sequence of characters we use to encode the ID
    # Note: We cut out vowels to avoid shortened strings from mistakenly
    # forming words
    DefaultAlphabet = 'bcdfghjklmnpqrstvwxyz0123456789BCDFGHJKLMNPQRSTVWXYZ'

    class << self

      # Get the alphabet to use
      def alphabet
        @alphabet ||= DefaultAlphabet
      end

      # Encode a numeric ID
      # @param [Fixnum] id - the ID to encode
      # @return [String] the encoded ID
      def encode(id)
        alpha = ''
        while id != 0
          alpha = alphabet[id % alphabet.length].chr + alpha
          id /= alphabet.length
        end
        alpha
      end

      # Decode an ID created with encode
      # @param [String] the ID to decode
      # @return [Fixnum] the decoded ID
      def decode(alpha)
        alpha = alpha.dup; id = 0
        0.upto(alpha.length - 1) do |i|
          letter = alpha[alpha.length - 1]
          alphabet_index = alphabet.index letter
          unless alphabet_index # bad character present?
            raise ArgumentError.new("Character not in Alphabet: #{letter}")
          end
          id += alphabet_index * (alphabet.length ** i)
          alpha.chop!
        end
        id
      end

    end
    
  end
 
end
