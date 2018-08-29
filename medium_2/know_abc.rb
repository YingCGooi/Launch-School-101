# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

BLOCKS = [ %w(B O), %w(X K), %w(D Q), 
          %w(C P), %w(N A), %w(G T),
          %w(R E), %w(F S), %w(J W),
          %w(H U), %w(V I), %w(L Y), %w(Z M) ].freeze

def block_word?(string)
  BLOCKS.none? do |pair|
    string.upcase.include?(pair[0]) && string.upcase.include?(pair[1])
  end
end

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.all? { |block| up_string.count(block) < 2 }
# end

p block_word?('BATCH') # == true
p block_word?('BUTCH') # == false
p block_word?('jest') # == true