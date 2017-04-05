# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

# For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

# Input: a string
# Output: lines of the same string with increasing space indent from the left. Each subsequent line increase 1 space

10.times { |x| puts (" " * x) + "The Flintstones Rock!" }