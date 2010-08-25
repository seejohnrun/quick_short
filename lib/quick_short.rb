module QuickShort

  # This is the sequence of characters we use to encode the ID
  # Note: We cut out vowels to avoid shortened strings from mistakenly
  # forming words
  Alphabet = 'bcdfghjklmnpqrstvwxyz0123456789BCDFGHJKLMNPQRSTVWXYZ'

  require 'lib/quick_short/short_id.rb'
  
end
