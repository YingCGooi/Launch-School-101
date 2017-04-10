# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift # => [a:, 'ant']
# returns the first key-value pair as a two-item array, or the hash's default value if the hash is empty.
hash # => {b: 'bear'} #shift destructively removes the first key-value pair of the hash